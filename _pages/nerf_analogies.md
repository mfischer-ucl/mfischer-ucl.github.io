---
permalink: /nerf_analogies/
title:
classes: wide
author_profile: false

---

{% include stylefile.md %}

<body>
<div class="globaldiv">

<div class="grey-box">
<br>
    <p style="margin: auto; text-align: center;">
    <span style="font-size: 24px;"><b>NeRF Analogies: Example-Based Visual Attribute Transfer for NeRFs</b></span> <br><br>
    <span style="font-size: 17px; color: black">CVPR 2024</span><br><br>
    <span style="font-size: 17px;">
    <a style="text-decoration:none; color:inherit;" href="https://mfischer-ucl.github.io/">Michael Fischer<sup>1</sup></a>,
    <a style="text-decoration:none; color:inherit;" href="https://scholar.google.com/citations?user=Nxc2RbQAAAAJ&hl=en&oi=ao">Zhengqin Li<sup>2</sup></a>,
    <a style="text-decoration:none; color:inherit;" href="https://www.monkeyoverflow.com/">Thu Nguyen-Phuoc<sup>2</sup></a>,
    <a style="text-decoration:none; color:inherit;" href="https://aljazbozic.github.io/">Aljaž Božič<sup>2</sup></a>,
    <a style="text-decoration:none; color:inherit;" href="http://flycooler.com/">Zhao Dong<sup>2</sup></a>,
    <a style="text-decoration:none; color:inherit;" href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel<sup>1</sup></a>,
    <a style="text-decoration:none; color:inherit;" href="https://scholar.google.com/citations?user=xWD7ZRkAAAAJ&hl=en">Carl Marshall<sup>2</sup></a>
    </span>
    <br/>
    <br/>
    <a style="font-size: 15px;" href="https://www.ucl.ac.uk/"><sup>1</sup>University College London</a>,
    <a style="font-size: 15px;" href="https://about.meta.com/uk/realitylabs/"><sup>2</sup>Meta Reality Labs Research</a>
</p>
<br>
</div>

<div class="row" style="margin: 50px 0 50px 0">
    <div style="display: inline;">
        <ul style="list-style: none; text-align: center">
            <li class="horizItem">
                <a href="https://arxiv.org/abs/2402.08622">
                <img class="teaserbutton" src="/assets/images/nerf_analogies/paperfront.png" ><br>
                    <h4><strong>Paper</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://youtu.be/Yghst5lrBeQ">
                <img class="teaserbutton" src="/assets/images/youtube_icon_red.png" ><br>
                    <h4><strong>Video</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <img class="teaserbutton" src="/assets/images/gh_icon.png" ><br>
                    <h4><strong>Code (coming soon)</strong></h4>
            </li>
            <li class="horizItem">
                <a href="/assets/nerfanalogies_poster.pdf" download="NeRFAnalogies_poster.pdf">
                <img class="teaserbutton" src="/assets/images/poster.png"><br>
                    <h4><strong>Poster</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/assets/nerfanalogies_supplemental.pdf" download="NeRFAnalogies_supplemental.pdf">
                <img class="teaserbutton" src="/assets/images/paperclip.png"><br>
                    <h4><strong>Supplemental</strong></h4>
                </a>
            </li>
        </ul>
    </div>
</div>

<b>TL;DR:</b><br>
<p style="text-align: justify">
We investigate transferring the appearance from a source Neural Radiance Field (NeRF) to a target 3D geometry 
in a semantically meaningful and multiview-consistent way by leveraging semantic correspondence from ViT features. 
</p>

<p align="center">
 <img src="/assets/images/nerf_analogies/thumb_github.png" width="40%" height="37.5%" />
</p>

<b>Abstract:</b><br>
<p style="text-align: justify">
A Neural Radiance Field (NeRF) encodes the specific relation of 3D geometry and appearance of a scene. We here ask the question whether we can transfer the appearance
from a source NeRF onto a target 3D geometry in a semantically meaningful way, such that the resulting new NeRF retains the target geometry but has an appearance that is
an analogy to the source NeRF. To this end, we generalize classic image analogies from 2D images to NeRFs. We leverage correspondence transfer along semantic affinity
that is driven by semantic features from large, pre-trained 2D image models to achieve multi-view consistent appearance transfer. Our method allows exploring the mix-and-
match product space of 3D geometry and appearance. We show that our method outperforms traditional stylization-based methods and that a large majority of users prefer
our method over several typical baselines. 
</p>

<p style="display: block; margin-left: auto; margin-right: auto; max-width: 75%">
<iframe width="560" height="315" 
src="https://www.youtube.com/embed/Yghst5lrBeQ?si=CWcMxXLKc9QCCri-" 
title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; 
gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
</iframe>
</p>


<b>Results:</b><br>
In the video captions, DIA is short for Deep Image Analogies, ST is short for Style Transfer, WCT is short for 
Whitening and Coloring Transform, the algorithm introduced in the paper "Universal Style Transfer via Feature Transforms",
SNeRF is the method by Nguyen-Phuoc et al., and Ours is our NeRF Analogy. <br> 
<button class="collapsible grey-box" style="margin-top: 8px; text-align: center;">Animated Transfer Results</button>
<div class="content grey-box">
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/birdhouses.png">
    </div>
    <div class="videos-flex-container">
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/birdhouse.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/birdhouse.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/birdhouse.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/birdhouse.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/birdhouse.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
    </div>
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/shoes.png">
    </div>
    <div class="videos-flex-container"> 
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/boots.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/boots.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/boots.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/boots.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/boots.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
    </div>
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/modernchair.png">
    </div>
    <div class="videos-flex-container"> 
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/modernchair.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/modernchair.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/modernchair.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/modernchair.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/modernchair.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
    </div>
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/bags.png">
    </div>
    <div class="videos-flex-container"> 
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/pinkbag.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/pinkbag.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/pinkbag.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/pinkbag.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/pinkbag.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
    </div>
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/guitars.png">
    </div>
    <div class="videos-flex-container"> 
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/flyingv.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/flyingv.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/flyingv.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/flyingv.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/flyingv.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
    </div>
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/tools.png">
    </div>
    <div class="videos-flex-container"> 
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/hammer.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/hammer.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/hammer.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/hammer.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/hammer.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
    </div>
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/greenchair.png">
    </div>
    <div class="videos-flex-container"> 
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/greenchair.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/greenchair.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/greenchair.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/greenchair.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/greenchair.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
    </div>
</div>

<button class="collapsible grey-box">Animated Results on Real-World scenes</button>
<div class="content grey-box">
     <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/garden.png">
    </div>
    <div class="videos-flex-container">
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/GT/garden.webm" autoplay muted loop ></video>
            <div class="caption">Original</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/garden.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/garden.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/garden.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/garden.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/garden.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
    </div>
    <div class="top-image-container">
        <img src="/assets/images/nerf_analogies/overview/kitchen.png">
    </div>
    <div class="videos-flex-container">
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/GT/kitchen.webm" autoplay muted loop ></video>
            <div class="caption">Original</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/ST/kitchen.webm" autoplay muted loop ></video>
            <div class="caption">ST</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/OURS/kitchen.webm" autoplay muted loop ></video>
            <div class="caption">Ours</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/DIA/kitchen.webm" autoplay muted loop ></video>
            <div class="caption">DIA</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/WCT/kitchen.webm" autoplay muted loop ></video>
            <div class="caption">WCT</div>
        </div>
        <div class="NAvideo-container">
            <video src="/assets/videos/nerf_analogies/SNERF/kitchen.webm" autoplay muted loop ></video>
            <div class="caption">SNeRF</div>
        </div>
    </div>
</div>

<button class="collapsible grey-box">Additional Synthetic Results</button>
<div class="content grey-box">
    <div class="parent-flex-container">
      <div class="media-flex-container">
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/leatherbag.webm" autoplay muted loop></video>
            <div class="caption">Target <br>(Shape)</div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/OURS/src_pinkbag_target_leatherbag.webm" autoplay muted loop></video>
            <div class="caption">Ours <br><span style="color:#f2f2f2">tmp</span></div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/pinkbag.webm" autoplay muted loop></video>
            <div class="caption">Source <br>(Appearance)</div>
          </div>
      </div>
       <div class="media-flex-container">
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/vans.webm" autoplay muted loop></video>
            <div class="caption">Target <br>(Shape)</div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/OURS/src_boots_target_sneakers.webm" autoplay muted loop></video>
            <div class="caption">Ours <br><span style="color:#f2f2f2">tmp</span></div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/boots.webm" autoplay muted loop></video>
            <div class="caption">Source <br>(Appearance)</div>
          </div>
      </div>
    </div>
    <div class="parent-flex-container">
      <div class="media-flex-container">
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/greenchair.webm" autoplay muted loop></video>
            <div class="caption">target<br>(Shape)</div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/OURS/src_whitechair_target_greenchair.webm" autoplay muted loop></video>
            <div class="caption">Ours <br><span style="color:#f2f2f2">tmp</span></div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/whitechair.webm" autoplay muted loop></video>
            <div class="caption">Source<br>(Appearance)</div>
          </div>
      </div>
       <div class="media-flex-container">
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/modernchair.webm" autoplay muted loop></video>
            <div class="caption">target<br>(Shape)</div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/OURS/src_redchair_target_modernchair.webm" autoplay muted loop></video>
            <div class="caption">Ours <br><span style="color:#f2f2f2">tmp</span></div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/redchair.webm" autoplay muted loop></video>
            <div class="caption">Source<br>(Appearance)</div>
          </div>
      </div>
    </div>
    <div class="parent-flex-container">
      <div class="media-flex-container">
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/goldcat.webm" autoplay muted loop></video>
            <div class="caption">target<br>(Shape)</div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/OURS/src_teddy_target_goldcat.webm" autoplay muted loop></video>
            <div class="caption">Ours <br><span style="color:#f2f2f2">tmp</span></div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/teddy.webm" autoplay muted loop></video>
            <div class="caption">Source<br>(Appearance)</div>
          </div>
      </div>
       <div class="media-flex-container">
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/teddy.webm" autoplay muted loop></video>
            <div class="caption">target<br>(Shape)</div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/OURS/src_goldcat_target_teddy.webm" autoplay muted loop></video>
            <div class="caption">Ours <br><span style="color:#f2f2f2">tmp</span></div>
          </div>
          <div class="media-item">
            <video src="/assets/videos/nerf_analogies/GT/goldcat.webm" autoplay muted loop></video>
            <div class="caption">Source<br>(Appearance)</div>
          </div>
      </div>
    </div>
</div>
<br/>
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}

</script>

<br/>
<b>Citation</b><br>
If you find our work useful and use parts or ideas of our paper or code, please cite: <br>
<p class="cite-box" style="margin-top: 5px">
  <span style="font-family: Lucida Console, Courier New, monospace; padding: 10px; font-size: 85%">
    @article{fischer2024nerf, <br>
      &nbsp;&nbsp;title={NeRF Analogies: Example-Based Visual Attribute Transfer for NeRFs}, <br>
      &nbsp;&nbsp;author={Fischer, Michael and Li, Zhengqin and Nguyen-Phuoc, Thu and Bozic, Aljaz and Dong, Zhao and Marshall, Carl and Ritschel, Tobias}, <br>
      &nbsp;&nbsp;journal={arXiv preprint arXiv:2402.08622}, <br>
      &nbsp;&nbsp;year={2024} <br>
    }
  </span>
</p>

<b>Acknowledgements</b><br>
This research was conducted during an internship at Meta Reality Labs Research. 
We extend our gratitude to the anonymous reviewers for their insightful feedback and to 
Meta Reality Labs for their continuous support. 
Additionally, we are thankful for the support provided by the Rabin Ezra Scholarship Trust.


</div>
</body>
