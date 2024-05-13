---
permalink: /zerograds/
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
</style>


<body>
<div class="globaldiv">

<div class="grey-box">
<br>
<p style="margin: 0 auto; text-align: center;">
<span style="font-size: 24px;"><b>Zero Grads: Learning Local Surrogate Losses for Non-Differentiable Graphics</b></span> <br><br>
<span style="font-size: 17px; color: black">SIGGRAPH 2024</span><br><br>
<span style="font-size: 17px;"><a href="https://mfischer-ucl.github.io/">Michael Fischer</a>, <a href="https://www.homepages.ucl.ac.uk/~ucactri/">Tobias Ritschel</a></span><br>
<a style="font-size: 14px;" href="https://www.ucl.ac.uk/">University College London</a>
</p>
<br>
</div>

<div style="display: flex; justify-content: center; align-items: center; margin-top: 2%">
  <img src="/assets/images/zerograds/teaser.png" style="width: 60%">
</div>

<div class="row" style="margin: 50px 0 50px 0">
    <div style="display: inline">
        <ul style="list-style: none; text-align: center">
            <li class="horizItem">
                <a href="https://arxiv.org/abs/2308.05739">
                <img class="teaserbutton" src="/assets/images/zerograds/paperfront.png" ><br>
                    <h4><strong>Paper</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <img class="teaserbutton" src="/assets/images/youtube_icon_red.png" ><br>
                    <h4><strong>Video (coming soon)</strong></h4>
            </li>
            <li class="horizItem">
                <a href="https://colab.research.google.com/drive/1GNd6DdRGRHQjKyG3rIfJ9519lo9VuAq4?usp=sharing">
                <img class="teaserbutton" src="/assets/images/colablogo.png"><br>
                    <h4><strong>Colab</strong></h4>
                </a>
            </li>
            <li class="horizItem">
                <img class="teaserbutton" src="/assets/images/gh_icon.png" ><br>
                    <h4><strong>Code (coming soon)</strong></h4>
            </li>
            <li class="horizItem">
                <a href="/assets/zerograds_supplemental.pdf" download="zerograds_supplemental.pdf">
                <img class="teaserbutton" src="/assets/images/paperclip.png" ><br>
                    <h4><strong>Supplemental</strong></h4>
                </a>
            </li>
        </ul>
    </div>
</div>

<b>TLDR:</b><br>
<p style="text-align: justify">
We learn a mapping between optimization parameters and their corresponding loss values, our neural surrogate loss, 
whose gradients we can then use for running gradient descent on arbitrary, high-dimensional black-box forward models. 
</p>

<b>Abstract:</b><br>
<p style="text-align: justify">
Gradient-based optimization is now ubiquitous across graphics, but unfortunately can not be applied to problems with undefined or zero gradients.
To circumvent this issue, the loss function can be manually replaced by a ``surrogate'' that has similar minima but is differentiable.
Our proposed framework, ZeroGrads, automates this process by learning a neural approximation of the objective function, which in turn can be used to differentiate through arbitrary black-box graphics pipelines.
We train the surrogate on an actively smoothed version of the objective and encourage locality, focusing the surrogate's capacity on what matters at the current training episode.
The fitting is performed online, alongside the parameter optimization, and self-supervised, without pre-computed data or pre-trained models.
As sampling the objective is expensive (it requires a full rendering or simulator run), we devise an efficient sampling scheme that allows for tractable run-times and competitive performance at little overhead. 
We demonstrate optimizing diverse non-convex, non-differentiable black-box problems in graphics, such as visibility in rendering, discrete parameter spaces in procedural modelling or optimal control in physics-driven animation. 
In contrast to other derivative-free algorithms, our approach scales well to higher dimensions, which we demonstrate on problems with up to 35k interlinked variables.
</p>

<b>Method:</b><br>


<div class="image-section">
    <img src="/assets/images/zerograds/gradflow.png">
</div>
<p>In ZeroGrads, we deal with the problem that many programs are not differentiable by design - for instance, as they're
   not written in a differentiable programming language, or simply were made for another user group (Photoshop, GIMP, ...). 
   We therefore have no way of backpropagating through these programs (red arrow in the figure on the right).   
   However, in this paper we show that we can still differentiate these programs if we can find a analytical mapping from the program input
   (the optimization parameters) to "how wrong" the output is, i.e., the loss function's value for these parameters. 
   Once we have found such a mapping, we can use its gradients as "surrogate gradients" during gradient descent, and thus differentiate
   through non-differentiable programs (green arrows in the figure on the right) like Blender or Matplotlib.   
</p>


However, it is often the case that large parts of this parameter space are irrelevant for the current optimization state, 
which is why we constrain our surrogate model to the local neighbourhood by sampling from a Gaussian. The surrogate 
therefore can "focus on what matters" at the current optimization step. In simple words, the four key steps in ZeroGrads are:  

<ol type="1">
  <li>Smooth the loss landscape via convolution with a Gaussian kernel, a trick introduced in <a href="/prdpt">PRDPT</a>.</li>
  <li>Locally sample around the current parameter state to produce samples for our surrogate fitting.</li>
  <li>Fit an analytical function (we use an MLP) to these samples.</li>
  <li>Compute the gradient of the MLP w.r.t. the optimization parameters, and use this gradient to perform an (Adam-) gradient descent step.</li>
</ol>  

We provide a <a href="https://colab.research.google.com/drive/1GNd6DdRGRHQjKyG3rIfJ9519lo9VuAq4?usp=sharing">Colab Notebook</a> that shows a simple example and how ZeroGrads outperforms its competitors. 

<br>
<br>
<b>Results:</b><br>
We compare our method against the traditional derivative-free optimizers Simulated Annealing (SA), Genetic Algorithms (GA), 
Simultaneous Perturbation Stochastic Spproximation (SPSA), Covariance Matrix Adaption Evolutionary Strategy (CMA-ES), and our 
previously published gradient estimator <a href="/prdpt">PRDPT</a>, here denoted as FR22. 
<br>
<br>

<div class="container">
    <img class="containerimg" src="/assets/images/zerograds/caustic.png">
    <div class="caption">In this experiment, we optimize a heightfield such that the resulting caustic matches a reference.
    The heightfield is parametrized as a 1,024-dimensional spline.</div>
</div>
<br>
<br>

<div class="container">
    <img class="containerimg" src="/assets/images/zerograds/texture.png">
    <div class="caption">Here, we optimize the 196,608 color values of a 256x256 RGB texture. CMA-ES cannot be run on
    this example due to its quadratic memory complexity.</div>
</div>
<br>
<br>

<div class="container">
    <img class="containerimg" src="/assets/images/zerograds/mlp.png">
    <div class="caption">In this example, we optimize the 35,152 weights of an MLP such that it encodes digits from the MNIST dataset.</div>
</div>
<br>
<br>

<div class="container">
    <img class="containerimg" src="/assets/images/zerograds/mesh.png">
    <div class="caption">In this inverse rendering scenario, the task is to deform a tesselated sphere into a mesh that 
    explains the reference views. "Diff. Rendering" implements the Largesteps approach by Nicolet et al., 2021.</div>
</div>
<br>
<br>

<div class="image-section">
    <img src="/assets/images/zerograds/vae_schematic.png">
</div>
<p>Finally, in this example, we train a <b>generative model</b> on a <b>non-differentiable task</b>. Specifically, we use
   a VAE that learns to encode digits from the MNIST dataset. However, instead of simply decoding the latents to pixel 
   values, the VAE produces spline-support-points, which are then rendered with a non-differentiable spline renderer (see the figure on the right for a schematic). 
   We use a weighted mixture of MSE and KLD as the trainig loss and backpropagate this loss through the non-diff. spline
   renderer (i.e., from the rendered spline to the VAE weights) using our proposed method ZeroGrads. The below digits 
   are samples from the latent space of the trained VAE, in a variety of styles, which are easily applicable in post-processing 
   thanks to the spline formulation.<br>    
</p>

<div class="container">
    <img class="containerimg" src="/assets/images/zerograds/vae.png">
    <div class="caption"></div>
</div>

<br>

The magic that makes our approach scale to high dimensions is the surrogate's hysteresis, which reduces the gradient 
variance. In contrast to methods that re-build a linear gradient estimate from scratch at every optimization iteration, 
the MLP's spectral bias prevents rapid changes and thus achieves a smoother gradient trajectory over time.
We plan to explore this further in future research. 

<br>
<br>

<b>Citation</b><br>
If you find our work useful and use parts or ideas of our paper or code, please cite: <br>
<p class="cite-box" style="margin-top: 5px">
  <span style="font-family: Lucida Console, Courier New, monospace; padding: 10px; font-size: 85%">
    @article{fischer2023zero, <br>
      &nbsp;&nbsp;title={Zero Grads: Learning Local Surrogate Losses for Non-Differentiable Graphics}, <br>
      &nbsp;&nbsp;author={Fischer, Michael and Ritschel, Tobias}, <br>
      &nbsp;&nbsp;journal={arXiv preprint arXiv:2308.05739}, <br>
      &nbsp;&nbsp;year={2023} <br>
    }
  </span>
</p>

<b>Acknowledgements</b><br>
We extend our gratitude to the anonymous reviewers for their insightful feedback and to 
Meta Reality Labs for their continuous support. 
Additionally, we are thankful for the support provided by the Rabin Ezra Scholarship Trust.

</div>
</body>
