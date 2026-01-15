---
permalink: /sama/
title:
classes: wide
author_profile: false

---

{% include stylefile.md %}

<style>
    .container {
        width: 100%;
        margin: auto;
        text-align: center;
    }
    
    .containerimg {
        width: 90%;
        margin: auto;
    }

    .caption {
        font-size: 0.9em;
        color: #666;
    }

    .image-section img {
            float: right; /* Image floats to the right */
            width: 45%; /* Image takes up 50% of the linewidth */
            margin-left: 20px; /* Adds space between the text and the image */
            margin-bottom: 5px; /* Adds space between the text and the image */
    }

ol > li::marker {
  font-weight: bold;
}

.collapsible {
  background-color: transparent; 
  background-image: linear-gradient(to right, transparent, #9d9d9d5c, transparent);
  color: #000000;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: center;
  outline: none;
  font-size: 15px;
  position: relative;
  margin-bottom: 10px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.collapsible:hover {
  background-color: #f1f1f1;
  color: #919191;
}

.collapsible::before {
  content: '\002B';
  color: #777;
  font-weight: bold;
  margin-right: 5px;
}

.active::before {
  content: "\2212";
}

.content {
  visibility: hidden;
  height: 0;
  margin: 0;
  overflow: hidden;
  background-color: #ffffff;
  display: flex;
  flex-direction: column; 
  align-items: center; 
  transition: visibility 0.3s, height 0.3s ease, margin 0.3s ease; 
}

.content.open {
  visibility: visible;
  height: auto; 
  margin-bottom: 33px; 
  overflow: visible;
}

.NARWvideo-container {
    margin: 20px 0; /* Add vertical spacing between videos */
    text-align: center;
    width: 90%; /* Make videos fit within the screen width */
    max-width: 1600px; /* Set a maximum width for larger screens */
}

.NARWvideo-container video {
    width: 100%; /* Scale video to the container's width */
    height: auto; /* Maintain aspect ratio */
    
}

.NARWvideo-container2D {
    margin: 20px 0; /* Add vertical spacing between videos */
    text-align: center;
    width: 90%; /* Make videos fit within the screen width */
    max-width: 1000px; /* Set a maximum width for larger screens */
}

.NARWvideo-container2D video {
    width: 100%; /* Scale video to the container's width */
    height: auto; /* Maintain aspect ratio */
    border: 1px solid #ccc; /* Optional: Add a subtle border */
    border-radius: 2px; /* Optional: Add rounded corners */
}

body {
  background-color: #FFFFFF; /* Soft background color */
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; /* Modern font */
  overflow-y: scroll;
}

html {
  scrollbar-width: thin; /* Optional: Make the scrollbar less obtrusive (for Firefox) */
}

body::-webkit-scrollbar {
  width: 8px; /* Optional: Set scrollbar width (for WebKit browsers) */
}

body::-webkit-scrollbar-thumb {
  background-color: #888; /* Optional: Customize scrollbar color */
  border-radius: 10px;
}

body::-webkit-scrollbar-thumb:hover {
  background-color: #555;
}

.videos-flex-container {
display: flex;
justify-content: center; /* Adjust this to change the alignment of videos */
flex-wrap: wrap; /* Allows the items to wrap to the next line */
margin-bottom: 10px;
}

.NAvideo-container {
    margin: 3px;
    text-align: center;
    flex: 1;
    max-width: 20%;
}

.NAvideo-container video {
    max-width: 100%;
    height: auto;
}

.caption {
    text-align: center;
    margin-top: 5px;
}

.collapsible {
  text-align: center;
}

.media-flex-container {
    flex-basis: calc(40.0% - 20px);
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}

.parent-flex-container {
    margin-top: 10px;
    margin-bottom: 50px;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 50px;
}

@media (max-width: 768px) {
    .media-flex-container {
        flex-basis: 100%;
    }
}

.media-item {
    margin: 0 10px;
    text-align: center;
    flex-basis: 33%;
}

.media-item img, .media-item video {
    max-width: 100%;
    height: auto;
}

hr.modern-gradient {
  border: none;
  height: 2px;
  background-image: linear-gradient(to right, transparent, #000000, transparent);
}

video {
    max-width: 100%;
    height: auto;
}

</style>


<body>
<div class="globaldiv">

<div class="grey-box">
<br>
<p style="margin: auto; text-align: center;">
    <span style="font-size: 24px;"><b>SAMa: Material-aware 3D Selection and Segmentation</b></span> <br><br>
    <span style="font-size: 17px; color: black">3DV 2026</span><br><br>
    <span style="font-size: 17px;">
        <a style="text-decoration:none; color:inherit;" href="https://mfischer-ucl.github.io/">Michael Fischer</a><sup>1,2</sup>,
        <a style="text-decoration:none; color:inherit;" href="https://iliyan.com/">Iliyan Georgiev<sup>1</sup></a>,
        <a style="text-decoration:none; color:inherit;" href="https://imagine.enpc.fr/~groueixt/">Thibault Groueix<sup>1</sup></a>,
        <a style="text-decoration:none; color:inherit;" href="https://research.adobe.com/person/vladimir-kim/">Vladimir G. Kim<sup>1</sup></a>,
        <a style="text-decoration:none; color:inherit;" href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel<sup>2</sup></a>,
        <a style="text-decoration:none; color:inherit;" href="https://valentin.deschaintre.fr/">Valentin Deschaintre<sup>1</sup></a>
    </span>
    <br/>
    <br/>
    <sup>1</sup><a style="font-size: 14px;" href="https://research.adobe.com/">Adobe Research</a>,
    <sup>2</sup><a style="font-size: 14px;" href="https://www.ucl.ac.uk/">University College London</a>
</p>
<br>
</div>

<div class="row" style="margin: 50px 0 50px 0">
    <div style="display: inline">
        <ul style="list-style: none; text-align: center">
            <li class="horizItem">
                <a href="/assets/sama_main.pdf" download="sama_main.pdf">
                <img class="teaserbutton" src="/assets/images/sama/paperfront.png" ><br>
                    <h4><strong>Paper</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://mfischer-ucl.github.io/sama">
                <img class="teaserbutton" src="/assets/images/gh_icon.png" ><br>
                    <h4><strong>Code (coming soon)</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://mfischer-ucl.github.io/sama">
                <img class="teaserbutton" src="/assets/images/database_icon.png" ><br>
                    <h4><strong>Data & Model (coming soon)</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/assets/sama_supplemental.pdf" download="sama_supplemental.pdf">
                <img class="teaserbutton" src="/assets/images/paperclip.png" ><br>
                    <h4><strong>Supplemental</strong></h4>
                </a>
            </li>
        </ul>
    </div>
</div>

<b>TLDR:</b><br>
<p style="text-align: justify">
We fine-tune SAM2 for material selection in 3D representations. We exploit that, as a video model, it is by design multiview-consistent
and leverage this property to create a 3D-consistent material-similarity representation in the form of a point cloud, 
which can be efficiently queried from novel views in just a few milliseconds. Our method works on arbitrary 3D assets (NeRFs, 3D Gaussians, meshes) and does 
not require any pre-processing, leading to a click-to-selection time of around 2 seconds. 
</p>

<div style="display: flex; justify-content: center; align-items: center; margin-top: 2%; gap: 10px;">
    <video src="/assets/videos/sama/cropped_lego.mp4" style="width: 18%;" autoplay muted loop></video>
    <video src="/assets/videos/sama/cropped_hotdog.mp4" style="width: 18%;" autoplay muted loop></video>
    <video src="/assets/videos/sama/cropped_chair.mp4" style="width: 18%;" autoplay muted loop></video>
    <video src="/assets/videos/sama/cropped_bike.mp4" style="width: 18%;" autoplay muted loop></video>
</div>
<br>

<b>Abstract:</b><br>
<p style="text-align: justify">
Decomposing 3D assets into material parts is a common task for artists and creators, yet remains a highly manual process. 
In this work, we introduce <b>S</b>elect <b>A</b>ny <b>Ma</b>terial (<b>SAMa</b>), a material selection approach for various 3D representations. 
Building on the recently introduced SAM2 video selection model, we extend its capabilities to the material domain. 
We leverage the model's cross-view consistency to create a 3D-consistent intermediate material-similarity representation
in the form of a point cloud from a sparse set of views. 
Nearest-neighbor lookups in this similarity cloud allow us to efficiently reconstruct accurate continuous selection 
masks over objects' surfaces that can be inspected from any view.
Our method is multiview-consistent by design, alleviating the need for contrastive learning or feature-field 
pre-processing, and performs optimization-free selection in seconds. Our approach works on arbitrary 3D representations 
and outperforms several strong baselines in terms of selection accuracy and multiview consistency.
It enables several compelling applications, such as replacing the diffuse-textured materials on a text-to-3D output
with PBR materials, or selecting and editing materials on NeRFs and 3D-Gaussians.
</p>

<b>Method Overview:</b><br>
Once a user clicks on a material, we perform the following steps:  
<ol style="text-align: justify">
    <li>Render a sparse set of RGB and depth images of the object (or use pre-rendered images and cached depth) and process these with SAMa, conditioned on the user's click.</li>
    <li>Back-project the resulting per-pixel similarity values to 3D to obtain a 3D material-similarity point cloud.</li>
    <li>Due to SAMa's multiview-consistent predictions, we do not need any pre-processing or 3D consolidation and can now directly infer the selection results for any novel view by simply using kNN-lookups into this pointcloud. This is very efficient and 
        takes only a few milliseconds (see GUI video below).</li>
</ol>
<br>
<p align="center">
 <img src="/assets/images/sama/overview.png" width="70%" margin-top="50px" />
</p>

<b>Results:</b>
<br/>
<br/>


<button class="collapsible" style="text-align: center;">3D Selection Results</button>
<div class="content">
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/chair_wood.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/chair_gold.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/hotdog_sauce.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/hotdog_mustard.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/lego_floor.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/lego_excavator.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/plant_leaves.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/plant_pot.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/bike_frame.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/bike_handles.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/hamburger_cheese.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/hamburger_patty.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/whitechair_feet.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/whitechair_base.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
      <video src="/assets/videos/sama/3D_selection/hut.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
      <video src="/assets/videos/sama/3D_selection/body_postbox.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container">
      <video src="/assets/videos/sama/3D_selection/label_postbox.mp4" autoplay controls  muted loop ></video>
    </div>
      <div class="NARWvideo-container">
        <video src="/assets/videos/sama/3D_selection/wood_chest.mp4" autoplay controls  muted loop ></video>
      </div>
    <div class="NARWvideo-container">
      <video src="/assets/videos/sama/3D_selection/metal_chest.mp4" autoplay controls  muted loop ></video>
    </div>
</div>

<button class="collapsible">GUI Screen-Recordings</button>
<div class="content">
    <div class="NARWvideo-container2D">
        <video src="/assets/videos/sama/gui/screengrab_lego.mp4" autoplay controls  muted loop ></video>
    </div>
    <div class="NARWvideo-container2D">
      <video src="/assets/videos/sama/gui/screengrab_chair.mp4" autoplay controls  muted loop ></video>
  </div>
  <div class="NARWvideo-container2D">
    <video src="/assets/videos/sama/gui/screengrab_hamburger.mp4" autoplay controls  muted loop ></video>
  </div>
</div>

<br>

<b>Citation</b><br>
If you find our work useful and use parts or ideas of our paper or code, please cite: <br>
<p class="cite-box" style="margin-top: 5px">
  <span style="font-family: Lucida Console, Courier New, monospace; padding: 10px; font-size: 85%">
    @article{fischer2024sama, <br>
        &nbsp;&nbsp;title={SAMa: Material-aware 3D Selection and Segmentation}, <br> 
        &nbsp;&nbsp;author={Fischer, Michael and Georgiev, Iliyan and Groueix, Thibault and Kim, Vladimir G and Ritschel, Tobias and Deschaintre, Valentin}, <br>
        &nbsp;&nbsp;journal={arXiv preprint arXiv:2411.19322}, <br> 
        &nbsp;&nbsp;year={2024} <br>
    }
  </span>
</p>

<b>Acknowledgements</b><br>
This research was conducted during an internship at Adobe Research London. 
I am honored to be a recipient of the Rabin Ezra Scholarship and deeply appreciate the support of the trust. 

</div>

<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.classList.contains("open")) {
      content.classList.remove("open");
    } else {
      content.classList.add("open");
    }
  });
}
</script>

</body>
