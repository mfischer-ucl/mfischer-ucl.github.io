---
permalink: /metappearance/
title: 
classes: wide
author_profile: false

---

<style>

.row {
  margin-left: -15px;
  margin-right: -15px;
}

h4, .h4, h5, .h5, h6, .h6 {
  margin-top: 10.5px;
  margin-bottom: 10.5px;
}

.horizItem {
    display: inline-block; 
    margin-left: 3%; 
    margin-right: 3%;
}

</style>

<body>
<div style="margin-left: -25%; font-size:16px">

<p style="margin: 0 auto; text-align: center;">
<span style="font-size: 24px;"><b>Metappearance: Meta-Learning for Visual Appearance Reproduction</b></span> <br><br>
<span style="font-size: 17px; color: grey">arXiv preprint</span><br><br>
<span style="font-size: 17px;"><a href="https://mfischer-ucl.github.io/">Michael Fischer</a>, <a href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel</a></span><br>
<a style="font-size: 14px;" href="https://www.ucl.ac.uk/">University College London</a>
</p>


<div class="row" style="margin: 50px 0 50px 0">
    <div style="display: inline">
        <ul style="list-style: none; text-align: center">
            <li class="horizItem">
                <a href="https://arxiv.org/abs/2204.08993">
                <img src="/assets/images/metappearance/paperfront.png" style="height: 110px"><br>
                    <h4><strong>Paper</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://youtu.be/LY6MgDUzS2M">
                <img src="/assets/images/youtube_icon.png" style="height: 110px"><br>
                    <h4><strong>Video</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://github.com/mfischer-ucl/metappearance.">
                <img src="/assets/images/gh_icon.png" style="height: 110px"><br>
                    <h4><strong>Code</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://arxiv.org/abs/21204.08993">
                <img src="/assets/images/paperclip.png" style="height: 110px"><br>
                    <h4><strong>Supplemental</strong></h4>
                </a>
            </li>
        </ul>
    </div>
</div>

<b>Paucis Verbis</b><br>
<p style="text-align: justify">
We use meta-learning to encode visual appearance. Metappearance can be trained in less than a second, while providing 
similar quality to conventionally trained networks that train orders of magnitude longer. We show results on a wide  
variety of applications and analyze important properties, such as convergence & efficiency.  </p> 

<img src="/assets/images/metappearance/Teaser_Large.png" style="display: block; margin-left: auto; margin-right: auto; max-width: 75%"> <br><br>

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

<b>Exemplary Results</b><br>

<figure>
  <picture>
    <img src="/assets/images/metappearance/MetaIters_Large_noBorder.png" style="display: block; margin-left: auto; margin-right: auto; max-width: 50%">
  </picture>
  <figcaption style="font: inherit; font-size: 15px; display: block; margin-left: auto; margin-right: auto; max-width: 70%; text-align: justify">  
        Metappearance learns a model initialization (leftmost column) and a per-parameter learning rate that allows 
        quick over-fitting onto <b> new, unseen </b> tasks in only a few gradient steps. We report wall-clock
        time for approx. 25%, 50% and 75% (columns 2-5) of the gradient descent steps used for inference. Note how after less than 
        a second of optimization, Metappearance achieves quality that is very close to the reference across all applications
        (from top to bottom: textures, BRDFs, stationary svBRDFs, non-stationary svBRDFs, illumination, light transport).    
    </figcaption>
</figure>
 

<br>

<b>BibTeX</b><br>
<p style="background-color: #f7f7f7; line-height: 110%; margin: 5px 0 0 0">
    <span style="font-family: Lucida Console, Courier New, monospace"> 
        @article{fischer2022metappearance, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;title={Metappearance: Meta-Learning for Visual Appearance Reproduction}, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;author={Fischer, Michael and Ritschel, Tobias}, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;journal={arXiv preprint arXiv:2204.08993}, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;year={2022} <br>
        }
     </span>
</p> <br>

<b>Acknowledgements</b><br>
We thank the reviewers for their constructive comments. We also thank Philipp Henzler, Alejandro Sztrajman, 
Valentin Deschaintre and Gilles Rainer for open-sourcing their code and insightful discussions.
This work was supported by TODO. 

</div>
</body>