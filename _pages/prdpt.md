---
permalink: /prdpt/
title:
classes: wide
author_profile: false

---

{% include stylefile.md %}

<body>
<div class="globaldiv">

<div class="grey-box">
<br>
    <p style="margin: 0 auto; text-align: center;">
    <span style="font-size: 24px;"><b>Plateau-Reduced Differentiable Path Tracing</b></span> <br><br>
    <span style="font-size: 17px; color: black">CVPR 2023</span><br><br>
    <span style="font-size: 17px;"><a href="https://mfischer-ucl.github.io/">Michael Fischer</a>, <a href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel</a></span><br>
    <a style="font-size: 14px;" href="https://www.ucl.ac.uk/">University College London</a>
</p>
<br>
</div>

<!--<div style="display: flex; justify-content: center; align-items: center; margin-top: 2%">
  <img src="/assets/images/prdpt/teaserImg1.png" style="width: 100%">
</div>-->

<div class="row" style="margin: 50px 0 50px 0">
    <div style="display: inline">
        <ul style="list-style: none; text-align: center">
            <li class="horizItem">
                <a href="/assets/prdpt_main.pdf" download="plateaureduced_diff_pt.pdf">
                <img class="teaserbutton" src="/assets/images/prdpt/paperfront.png" ><br>
                    <h4><strong>Paper</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://youtu.be/KJlJbqJ4wwY">
                <img class="teaserbutton" src="/assets/images/youtube_icon_red.png" ><br>
                    <h4><strong>Video</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://github.com/mfischer-ucl/prdpt">
                <img class="teaserbutton" src="/assets/images/gh_icon.png" ><br>
                    <h4><strong>Code</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="https://colab.research.google.com/github/mfischer-ucl/prdpt/blob/main/examples/box_example.ipynb">
                <img class="teaserbutton" src="/assets/images/colablogo.png"><br>
                    <h4><strong>Colab</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/assets/prdpt_suppl.pdf" download="plateaureduced_diff_pt_suppl.pdf">
                <img class="teaserbutton" src="/assets/images/paperclip.png" ><br>
                    <h4><strong>Supplemental</strong></h4>
                </a>
            </li>
        </ul>
    </div>
</div>

<b>TLDR:</b><br>
<p style="text-align: justify">
We convolute the traditional rendering equation with a Gaussian smoothing kernel to reduce plateaus, i.e., regions of zero gradient, in inverse 
rendering. Our algorithm improves convergence and works on problems with intricate light transport (e.g., caustics) that previous algorithms
do not converge on.</p>

<b>Abstract</b><br>
<p style="text-align: justify">
Current differentiable renderers provide light transport
gradients with respect to arbitrary scene parameters. However,
the mere existence of these gradients does not guarantee
useful update steps in an optimization. Instead, inverse
rendering might not converge due to inherent plateaus, i.e.,
regions of zero gradient, in the objective function. We propose
to alleviate this by convolving the high-dimensional
rendering function, that maps scene parameters to images,
with an additional kernel that blurs the parameter
space. We describe two Monte Carlo estimators to compute
plateau-reduced gradients efficiently, i.e., with low variance,
and show that these translate into net-gains in optimization
error and runtime performance. Our approach
is a straightforward extension to both black-box and differentiable
renderers and enables optimization of problems
with intricate light transport, such as caustics or global
illumination, that existing differentiable renderers do not
converge on.</p>

<p style="display: block; margin-left: auto; margin-right: auto; max-width: 75%">
<iframe width="560" height="315" 
src="https://www.youtube.com/embed/KJlJbqJ4wwY" 
title="YouTube video player" 
frameborder="0" allow="accelerometer; autoplay; 
clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen>
</iframe>
</p>

<b>Interactive Examples</b><br>
<p style="text-align: justify">
Below is an interactive 1D example which uses our method to differentiate through a discontinuous step function. The task here 
is to move the triangle center (parameterized by theta), such that it covers the black pixel at the bottom. The plateaus in the cost landscape 
come from the fact that the error between the pixel's desired and its current color does not take into account how "far away" the triangle is 
when it's not overlapping the pixel. We can smoothen these plateaus by our proposed convolution with a Gaussian kernel (displayed in plot in the right bottom corner, click 'Show Smooth' to see the convolved function). 
We then sample this convoluted space and use the samples to drive a gradient descent that moves the initial 
parameter (green) towards the region of zero cost, i.e., such that the triangle overlaps the pixel. <br>
</p>

{% include gaussianconv.md %}
<br>

<p style="text-align: justify">
We also provide a simple 2D example of our method in <a href="https://colab.research.google.com/github/mfischer-ucl/prdpt/blob/main/examples/box_example.ipynb">Colab</a>. Here, we optimize a square that, in the initial configuration, 
does not overlap its reference and hence creates a plateau in the loss landscape (the 2D counterpart to the example above). This example uses a simpler renderer 
and hence does not need all the scene config / rendering infrastructure used in the main repository.
</p>
<div style="display: flex; justify-content: center; align-items: center; margin-top: 2%; max-width: 100%">
  <img src="/assets/images/prdpt/2Dexample.png" style="max-width: 90%;">
</div>

<br>

<b>Results</b><br>
<p style="text-align: justify">
In the paper, we show a variety of results on different inverse rendering tasks. One such example is included here:  
we optimize the position of the red sphere (cf. the video below) that is initially occluded by the blue sphere. This  
leads to a jump discontinuity as soon as the red sphere moves in front of the blue one (cf. the sudden change in the image loss plot)
with plateaus to the left and right. As in the interactive example above, our method (blue) successfully smoothes the space
and differentiates through the plateaus, whereas a rigid optimization (orange) gets stuck on the plateau. 
</p>

<div class="vidcontainer">
    <video id ="occl-vid" style="display:inline-block; width:95%;" autoplay muted loop controls>
      <source src="/assets/images/prdpt/occl_w_graph.webm" type="video/webm">
      Your browser does not support the video tag.
    </video>
</div>

<p style="text-align: justify">
Another example of our method shows how a smoother space is easier to optimize: the rigid optimization (the orange curve in the plot) follows 
the slight slope leading to a wrong minimum and finally pushing the sphere out of the image, where a plateau is hit, 
and the optimizer cannot recover. Our formulation (the blue curve) allows the optimization to converge, as it is operating in a smoother space.   
</p>

<div class="vidcontainer">
    <video id="shad-vid" style="display:inline-block; width: 95%;" autoplay muted loop controls>
      <source src="/assets/images/prdpt/shadows_w_graph.webm" type="video/webm">
      Your browser does not support the video tag.
    </video>
</div>

<p style="text-align: justify">
In the below example the task is to optimize the light's position such that a reference caustic is matched. 
As in the shadow example, the rigid optimization operates in non-smooth space, and pushes the light source far out, 
where a plateau (the grey image) is reached. Our method operates in smooth space and finds the correct position.
</p>

<div class="vidcontainer">
    <video id="caust-vid" style="display:inline-block; width: 95%;" autoplay muted loop controls>
      <source src="/assets/images/prdpt/caustic_w_graph.webm" type="video/webm">
      Your browser does not support the video tag.
    </video>
</div>


<br>

<b>BibTeX</b><br>
If you find our work useful and use parts or ideas of our paper or code, please cite: <br>
<p class="cite-box" style="margin-top: 5px">
  <span style="font-family: Lucida Console, Courier New, monospace; padding: 10px;">
    @inproceedings{fischer2023plateau, <br>
      &nbsp;&nbsp;title={Plateau-Reduced Differentiable Path Tracing}, <br> 
      &nbsp;&nbsp;author={Fischer, Michael and Ritschel, Tobias}, <br>
      &nbsp;&nbsp;booktitle={Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition}, <br>
      &nbsp;&nbsp;pages={4285--4294}, <br>
      &nbsp;&nbsp;year={2023} <br>
    }
  </span>
</p>


<b>Acknowledgements</b><br>
We thank the Chen Liu, Valentin Deschaintre and the anonymous reviewers for their constructive comments and insightful 
feedback. We further thank Meta Reality Labs for supporting and enabling this research.  

</div>
</body>