---
permalink: /prdpt/
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
    <span style="font-size: 24px;"><b>Plateau-Reduced Differentiable Path Tracing</b></span> <br><br>
    <span style="font-size: 17px; color: black">CVPR 2023</span><br><br>
    <span style="font-size: 17px;"><a href="https://mfischer-ucl.github.io/">Michael Fischer</a>, <a href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel</a></span><br>
    <a style="font-size: 14px;" href="https://www.ucl.ac.uk/">University College London</a>
</p>
<br>
</div>


<div class="row" style="margin: 50px 0 50px 0">
    <div style="display: inline">
        <ul style="list-style: none; text-align: center">
            <li class="horizItem">
                <a href="/assets/prdpt_main.pdf" download="plateaureduced_diff_pt.pdf">
                <img src="/assets/images/prdpt/paperfront.png" style="height: 100px"><br>
                    <h4><strong>Paper</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/prdpt">
                <img src="/assets/images/youtube_icon_red.png" style="height: 100px"><br>
                    <h4><strong>Video (coming soon)</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/prdpt">
                <img src="/assets/images/gh_icon.png" style="height: 100px"><br>
                    <h4><strong>Code (coming soon)</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/prdpt">
                <img src="/assets/images/colablogo.png" style="height: 100px"><br>
                    <h4><strong>Colab (coming soon)</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <a href="/assets/prdpt_suppl.pdf" download="plateaureduced_diff_pt_suppl.pdf">
                <img src="/assets/images/paperclip.png" style="height: 100px"><br>
                    <h4><strong>Supplemental</strong></h4>
                </a>
            </li>
        </ul>
    </div>
</div>

<b>TL;DR</b><br>
<p style="text-align: justify">
We convolute the traditional rendering equation with a Gaussian smoothing kernel to reduce plateaus, i.e., regions of zero gradient, in inverse 
rendering. Our algorithm improves convergence and works on problems with intricate light transport (e.g., caustics) that previous algorithms
do not converge on.</p> <br>


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
converge on.</p><br>

<b>Examples</b><br>
Coming soon. <br>

<!-- ({% include jsapplet.md %}) -->

<br>

<b>BibTeX</b><br>
If you find our work useful and use parts or ideas of our paper or code, please cite: <br> <br>
<p class="cite-box">
    <span style="font-family: Lucida Console, Courier New, monospace"> 
        @article{fischer2022plateau, <br>
            &nbsp;&nbsp;title={Plateau-reduced Differentiable Path Tracing}, <br> 
            &nbsp;&nbsp;author={Fischer, Michael and Ritschel, Tobias}, <br>
            &nbsp;&nbsp;journal={arXiv preprint arXiv:2211.17263}, <br>
            &nbsp;&nbsp;year={2022} <br>
        }
     </span>
</p> <br>

<b>Acknowledgements</b><br>
We thank the Chen Liu, Valentin Deschaintre and the anonymous reviewers for their constructive comments and insightful 
feedback. This work was supported by Meta Reality Labs. 

</div>
</body>