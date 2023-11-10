---
permalink: /subsite/
title: "User Study"
classes: wide
author_profile: false
---


{% include stylefile.md %}

<body>

Question: Which video is the most multiview-consistent? 
<form id="NAvideoForm">
    <!-- Repeat this block for each video -->
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/dia_video.webm" autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection1" value="A"> A
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/ours_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection1" value="B"> B
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/st_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection1" value="C"> C
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/wct_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection1" value="D"> D
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/snerf_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection1" value="E"> E
        </div>
    </div>
</form>

Question: Which video is the most multiview-consistent? 
<form id="NAvideoForm">
    <!-- Repeat this block for each video -->
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/dia_video.webm" autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection2" value="A"> A
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/ours_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection2" value="B"> B
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/st_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection2" value="C"> C
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/wct_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection2" value="D"> D
        </div>
    </div>
    <div class="NAvideo-container">
        <video src="/assets/videos/nerf_analogies/snerf_video.webm"  autoplay muted loop controls></video>
        <div class="radio-buttons">
            <input type="radio" name="videoSelection2" value="E"> E
        </div>
    </div>
</form>

<button type="button" id="submit">Submit</button>

<script>

document.getElementById('submit').addEventListener('click', function() {
    var selectedRadio1 = document.querySelector('input[name="videoSelection1"]:checked');
    var selectedRadio2 = document.querySelector('input[name="videoSelection2"]:checked');
    
    if (!selectedRadio1) {
        alert("Please make a selection.");
        return;
    }

    if (!selectedRadio2) {
        alert("Please make a selection.");
        return;
    }

    var selectedValue1 = selectedRadio1.value;
    var selectedValue2 = selectedRadio2.value;
    var queryString = `videoSelection1=${encodeURIComponent(selectedValue1)}&videoSelection2=${encodeURIComponent(selectedValue2)}`;

    fetch(`https://script.google.com/macros/s/AKfycbwHA08ab_ZXF3nZfXA7kTza8zNZ5h0YBMfo4C1aEeNBeZGiI9aBct2n4lvJXxFUSvE/exec?${queryString}`)
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.error('Error:', error));
});

</script>

</body>
