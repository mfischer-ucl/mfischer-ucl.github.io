---
permalink: /metappearance/
title: 
classes: wide
author_profile: false

---

{% include stylefile.md %}

<body>
<div style="margin-left: -25%; font-size:16px">

<div class="grey-box">
<br>
<p style="margin: 0 auto; text-align: center;">
<span style="font-size: 24px;"><b>Metappearance: Meta-Learning for Visual Appearance Reproduction</b></span> <br><br>
<span style="font-size: 17px; color: black">SIGGRAPH Asia 2022, Journal Track</span><br><br>
<span style="font-size: 17px;"><a href="https://mfischer-ucl.github.io/">Michael Fischer</a>, <a href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel</a></span><br>
<a style="font-size: 14px;" href="https://www.ucl.ac.uk/">University College London</a>
</p>
<br>
</div>


<div class="row" style="margin: 50px 0 50px 0">
    <div style="display: inline">
        <ul style="list-style: none; text-align: center">
            <li class="horizItem">
                <a href="/assets/metappearance_main.pdf" download="Metappearance_main.pdf">
                <img src="/assets/images/metappearance/paperfront.png" style="height: 100px"><br>
                    <h4><strong>Paper</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://youtu.be/6wTf9vAbfTM">
                <img src="/assets/images/youtube_icon.png" style="height: 100px"><br>
                    <h4><strong>Video</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://github.com/mfischer-ucl/metappearance">
                <img src="/assets/images/gh_icon.png" style="height: 100px"><br>
                    <h4><strong>Code</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/assets/metappearance_suppl.pdf" download="Metappearance_supplemental.pdf">
                <img src="/assets/images/paperclip.png" style="height: 100px"><br>
                    <h4><strong>Supplemental</strong></h4>
                </a>
            </li>
        </ul>
    </div>
</div>

<b>News</b><br>
<p style="text-align: justify">
Our work has been featured in the <a href="https://link.growkudos.com/1pxz4w4nuv4">ACM Showcase</a>.  
</p>

<b>TL;DR:</b><br>
<p style="text-align: justify">
We use meta-learning to encode visual appearance. Metappearance can be trained in less than a second, while providing 
similar quality to conventionally trained networks that train orders of magnitude longer. We show results on a wide  
variety of applications and analyze important properties, such as convergence & efficiency.  </p> <br>

<img src="/assets/images/metappearance/Teaser_Large.png" style="display: block; margin-left: auto; margin-right: auto; max-width: 75%"> <br><br>

<p style="display: block; margin-left: auto; margin-right: auto; max-width: 75%"> 
<iframe width="560" height="315" 
src="https://www.youtube.com/embed/biCRtitdWfs" 
title="YouTube video player" 
frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; 
gyroscope; picture-in-picture" allowfullscreen></iframe>
</p>

<b>Abstract</b><br>
<p style="text-align: justify">
There currently exist two main approaches to reproducing visual appearance 
using Machine Learning (ML): The first is training models that generalize
over different instances of a problem, e.g., different images of a dataset.
As one-shot approaches, these offer fast inference, but often fall short in
quality. The second approach does not train models that generalize across
tasks, but rather over-fit a single instance of a problem, e.g., a flash image
of a material. These methods offer high quality, but take long to train. We
suggest to combine both techniques end-to-end using meta-learning: We
over-fit onto a single problem instance in an inner loop, while also learning
how to do so efficiently in an outer-loop across many exemplars. To this
end, we derive the required formalism that allows applying meta-learning
to a wide range of visual appearance reproduction problems: textures, Bi-directional Reflectance Distribution Functions (BRDFs), spatially-varying
BRDFs (svBRDFs), illumination or the entire light transport of a scene. The
effects of meta-learning parameters on several different aspects of visual
appearance are analyzed in our framework, and specific guidance for different tasks is provided. 
Metapperance enables visual quality that is similar
to over-fit approaches in only a fraction of their runtime while keeping the
adaptivity of general models. </p> <br>

<p align="center">
 <img src="/assets/images/metappearance/metappearance.gif" width="75%" height="37.5%" />
</p>


<b>Exemplary Results</b><br>


<div style="display: flex; justify-content: center; align-items: center;">
  <figure style="display:inline-block; width:45%; margin-right: 20px;">
    <img src="/assets/images/metappearance/MetaIters_Large_noBorder.png">
    <figcaption style="text-align: justify; font-size: 90%; font-family: inherit;"><b>Metappearance</b> learns a model initialization (leftmost column) and a per-parameter learning rate that allows 
        quick over-fitting onto <b> new, unseen </b> tasks in only a few gradient steps. We report wall-clock
        time for approx. 25%, 50% and 75% (columns 2-5) of the gradient descent steps used for inference. Note how after less than 
        a second of optimization, Metappearance achieves quality that is very close to the reference across all applications
        (from top to bottom: textures, BRDFs, stationary svBRDFs</figcaption>
  </figure>
  <figure style="display:inline-block; width:45%; margin-left: 20px;">
    <img src="/assets/images/metappearance/EqualTime.png">
    <figcaption style="text-align: justify; font-size: 90%; font-family: inherit;"><b>Equal-time comparisons</b> on unseen test data for each application
(top to bottom row: Texture, BRDF, svBRDF, svBRDFnonstat, Illumination, Transport). Overfit and Finetune are ran with the same amount of gradient steps Meta uses,
i.e., the same wall-clock time. Metappearance encodes the reference best across all applications.</figcaption>
  </figure>
</div>


<br>

<b>BibTeX</b><br>
If you find our work useful and use parts or ideas of our paper or code, please cite: <br>
<p class="cite-box" style="margin-top: 5px">
    <span style="font-family: Lucida Console, Courier New, monospace; padding: 10px;">
        @article{fischer2022metappearance, <br>
            &nbsp;&nbsp;title={Metappearance: Meta-Learning for Visual Appearance Reproduction}, <br> 
            &nbsp;&nbsp;author={Fischer, Michael and Ritschel, Tobias}, <br>
            &nbsp;&nbsp;journal={ACM Trans Graph (Proc. SIGGRAPH Asia)}, <br>
            &nbsp;&nbsp;year={2022}, <br>
            &nbsp;&nbsp;volume={41}, <br>
            &nbsp;&nbsp;number={4} <br>
        }
     </span>
</p> <br>

<b>Acknowledgements</b><br>
We thank the reviewers for their constructive comments. We also thank Philipp Henzler, Alejandro Sztrajman, 
Valentin Deschaintre and Gilles Rainer for open-sourcing their code and insightful discussions.
Lastly, we thank Meta Reality Labs for supporting this work. 

</div>
</body>