---
permalink: /metappearance/
title: 
classes: wide
author_profile: false

---


<body style="font-size: 12px">      


<p style="margin: 0 auto; text-align: center">
<span style="font-size: 24px;">Metappearance: Meta-Learning for Visual Appearance Reproduction</span> <br>
<span style="font-size: 17px; color: grey">arXiv preprint</span><br>
<span style="font-size: 17px;"><a href="https://mfischer-ucl.github.io/">Michael Fischer</a>, <a href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel</a></span><br>
<a style="font-size: 14px;" href="https://www.ucl.ac.uk/">University College London</a>
</p>

todo: insert image 


<b>Abstract</b><br>
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
appearance are analyzed in our framework, and specific guidance for dif-
ferent tasks is provided. Metapperance enables visual quality that is similar
to over-fit approaches in only a fraction of their runtime while keeping the
adaptivity of general models.

<br><b>Materials</b><br>
Paper, Code, Supplemental, Video, Slides 

[//]: # (even lighter grey: #fafafa)
<br><b>BibTex</b><br>
<p style="background-color: #f7f7f7; line-height: 130%; margin: -10px 0 0 0">
    <span style="font-family: Lucida Console, Courier New, monospace"> 
        @article{fischer2022metappearance, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;title={Metappearance: Meta-Learning for Visual Appearance Reproduction}, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;author={Fischer, Michael and Ritschel, Tobias}, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;journal={arXiv preprint arXiv:2204.08993}, <br>
          &nbsp;&nbsp;&nbsp;&nbsp;year={2022} <br>
        }
     </span>
</p>

<br><b>Acknowledgements</b><br>
We thank the reviewers for their constructive comments. We also thank Philipp Henzler, Alejandro Sztrajman, 
Valentin Deschaintre, Gilles Rainer and Markus Worchel for open-sourcing their code and insightful discussions.
This work was supported by TODO. 


</body>