#!/usr/bin/env bash
set -euo pipefail

# Target height
TARGET_H=512

# find mp4s (globbing, supports spaces in filenames)
shopt -s nullglob
files=(./*.mp4)

if [ ${#files[@]} -eq 0 ]; then
  echo "No .mp4 files found in current folder."
  exit 1
fi

# check ffmpeg/ffprobe exist
if ! command -v ffmpeg >/dev/null 2>&1 || ! command -v ffprobe >/dev/null 2>&1; then
  echo "ffmpeg and ffprobe are required. Install via: brew install ffmpeg"
  exit 1
fi

# Build ffmpeg args arrays to avoid eval/word-splitting issues
ffargs=()
filter_part=""
labels=()
i=0

for f in "${files[@]}"; do
  ffargs+=("-i" "$f")

  # get video height (integer)
  height=$(ffprobe -v error -select_streams v:0 \
           -show_entries stream=height -of csv=p=0 "$f")
  # fallback if ffprobe fails
  if [[ -z "$height" ]]; then
    echo "Could not determine height of '$f' with ffprobe. Aborting."
    exit 1
  fi

  if [ "$height" -gt "$TARGET_H" ]; then
    # downscale those larger than TARGET_H -> keep aspect, even width
    filter_part+="[$i:v]scale=-2:${TARGET_H}[v$i];"
  elif [ "$height" -eq "$TARGET_H" ]; then
    # no-op (use null filter to create label)
    filter_part+="[$i:v]null[v$i];"
  else
    # smaller: do not upscale — instead vertically pad to TARGET_H and center
    # we use a no-op scale (scale=-2:ih) to normalize expression variables, then pad
    # pad=iw:TARGET_H:x:(TARGET_H-ih)/2
    filter_part+="[$i:v]scale=-2:ih,pad=iw:${TARGET_H}:0:(${TARGET_H}-ih)/2[v$i];"
  fi

  labels+=("[v$i]")
  i=$((i+1))
done

# join labels into hstack
inputs_count=${#files[@]}
# create stack part like [v0][v1]hstack=inputs=N[outv]
stack_inputs=""
for ((j=0;j<inputs_count;j++)); do
  stack_inputs+="[v$j]"
done
filter_part+="${stack_inputs}hstack=inputs=${inputs_count}[outv]"

# finalize ffmpeg command
out="hstack_output.mp4"

# build command array
cmd=(ffmpeg -y)
cmd+=("${ffargs[@]}")
cmd+=("-filter_complex" "$filter_part")
# map stacked video
cmd+=("-map" "[outv]")
# map first audio stream if present
cmd+=("-map" "0:a?" "-c:a" "aac" "-b:a" "192k")
# codec for video
cmd+=("-c:v" "libx264" "-crf" "18" "-preset" "fast" "$out")

# show the built command (safe printed form) and run it
echo "Running ffmpeg to create: $out"
printf ' %q' "${cmd[@]}"
echo
"${cmd[@]}"
echo "Done — output: $out"