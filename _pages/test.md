---
permalink: /test/
title: "Test"
classes: wide

header:
  image: /assets/images/network_crop4.jpg

---
<style>
  #plot-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  #plot {
    width: 65%;
  }
  .slider {
    width: 30%;
  }
</style>

<div id="plot-container">
  <div id="plot"></div>
  <div>
    <label for="sigma">Sigma:</label>
    <input class="slider" type="range" min="0" max="2" step="0.01" value="1" id="sigma">
    <label for="num-samples">Num Samples:</label>
    <input class="slider" type="range" min="1" max="100" step="1" value="10" id="num-samples">
    <div>
        <input type="checkbox" id="cb_antithetic" checked style="float: left; margin-top: 14px;">
        <div style="margin-left: 25px;">
             Antithetic?
        </div>
    </div>
    <div>
        <input type="checkbox" id="cb_showsmoothed" style="float: left; margin-top: 14px;">
        <div style="margin-left: 25px;">
             Show Smooth?
        </div>
    </div>
    <button style="float: left; margin-top: 14px;" onclick="optimize()">Run optimization</button>
  </div>
</div>

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script>
  
function stepEdge(x) {
	return x < 0 ? 1 : 0; 
}

function calcGradGaussian(x, sigma) {
		// already sampling the positivized function here 
    return (Math.abs(x) / Math.pow(sigma, 2)) * calcGaussian(x, sigma=sigma);
}

function gradGaussianKernel(x, sigma) {
	return -(x / Math.pow(sigma, 2)) * calcGaussian(x, sigma=sigma);
}

function get_pdf(x, sigma) {
	return 0.5 * sigma * Math.sqrt(2.0 * Math.PI) * x;
}

function calcGaussian(x, sigma) {
  return 1.0 / (sigma * Math.sqrt(2 * Math.PI)) * Math.exp(-Math.pow(x, 2) / (2 * Math.pow(sigma, 2)));
}

// sample from a standard normal, N(0,1)
function boxmueller() {
  return Math.sqrt(-2 * Math.log(Math.random())) * Math.cos(2 * Math.PI * Math.random());
}

// convert standard normal samples to scaled normal 
function sampleGaussian(sigma = 1.0) {
  return sigma * boxmueller();
}

function mc_estimate(f_x, p_x) {
	var N = f_x.length; 
  var estimate = 0.0; 
  for (var i = 0; i < N; i += 1) {
  	estimate += f_x[i] / p_x[i];
  }
  return estimate / N; 
}

function convolve(theta, n_samples, samples, sigma) {
	var outputs = []; var pdfs = [];
  
  for(var i = 0; i < n_samples; i+=1) {
  	var tau = samples[i];
    var pdf = get_pdf(tau, sigma); 
    var w = gradGaussianKernel(tau, sigma);
    
    var theta_p = theta - tau; 
    var weighted_fn_val = stepEdge(theta_p) * w; 
    
    outputs.push(weighted_fn_val); 
    pdfs.push(pdf);
  }
  
  return mc_estimate(outputs, pdfs);
}

function icdf(x, sigma) {
	if (x > 0.5) {
  	return Math.sqrt(-2.0 * Math.pow(sigma, 2) * Math.log(-2.0 * (x - 1.0)));
  } else {
  	return Math.sqrt(-2.0 * Math.pow(sigma, 2) * Math.log(2.0 * x));
  }
}

function clean_random(x) {
	var eps = 0.0001
  if (x < eps) {x += eps;}					// too close to zero 
  if (x - 0.5 < eps) {x -= eps;}		// too close to 0.5
  if (0.5 - x < eps) {x += eps;}		// too close to 0.5
  if (1.0 - x < eps) {x -= eps;}		// too close to 1
  return x; 
} 


function getGradGaussianSamples(n_samples, sigma, antithetic) {
	var samples = [] 
  var f_x = []
  var p_x = []
  for (var i = 0; i < n_samples; i++) {
  	// var rand = Math.random();
    var rand = clean_random(Math.random());
    var x_i = icdf(rand, sigma) * (rand < 0.5 ? -1.0 : 1.0); 
    samples.push(x_i);
    
    if (antithetic) {
    	var arand = 1.0 - rand; 
      var x_i = icdf(rand, sigma) * (arand < 0.5 ? -1.0 : 1.0); 
    	samples.push(x_i);
    }
  }  
  
  // calculcate sample value and pdf 
  for (var i = 0; i<samples.length; i+=1){
    var f_xi = Math.abs(samples[i]) / Math.pow(sigma, 2) * calcGaussian(samples[i], sigma);
    var p_xi = 0.5 * sigma * Math.sqrt(2.0 * Math.PI) * f_xi;
    f_x.push(f_xi);
    p_x.push(p_xi); 
  }
  
  return [samples, f_x, p_x];
}

function getGaussianSamples(n_samples, sigma, antithetic) {
	var samples = []
  var p_x = []
  for (var i = 0; i < n_samples; i++) {
    var x_i = sampleGaussian(sigma);
    samples.push(x_i);
    if (antithetic) {samples.push(x_i * -1.0);}
  }
  
  // calc sample value 
  for (var i = 0; i < samples.length; i+=1) {
  	p_x.push(calcGaussian(samples[i], sigma=sigma));
  }
	return [samples, p_x]; 
}

// Define the data for the Gaussian distribution
var x = [], y_gauss = [], y_gradgauss = [], y_step = [], sigma = 1;
for (var i = -5; i < 5; i += 0.01) {
  x.push(i);
  y_step.push(stepEdge(i));
  y_gauss.push(calcGaussian(i, sigma = sigma));
  y_gradgauss.push(calcGradGaussian(i, sigma=sigma));
}

// Create the initial plot, declare all the traces 
var gaussianTrace = {
  x: x,
  y: y_gauss,
  name: 'Gaussian',
  type: 'scatter',
  opacity: 0.25
};
var gradGaussianTrace = {
  x: x,
  y: y_gradgauss,
  name: 'Grad. of Gaussian',
  type: 'scatter',
  marker: {color: 'rgb(0, 0, 0)'}
};
var stepTrace = {
  x: x,
  y: y_step,
  name: 'Step Function',
  type: 'scatter'
};
var sampleTrace = {
    x: [],
    y: [],
    name: 'Samples',
    mode: 'markers',
    opacity: 0.5,
    marker: {
      size: 7,
      symbol: 'diamond',
      color: 'black'
    }
};
var sampleTrace_gg = {
    x: [],
    y: [],
    name: 'Samples_gg',
    mode: 'markers',
    opacity: 0.8,
    marker: {
      size: 7,
      symbol: 'diamond',
      color: 'black'
    }
};  
var smoothedFn = {
  x: [],
  y: [],
  name: 'Smoothed',
  type: 'scatter',
  marker: {color: 'rgb(255, 0, 255)'}
};
var layout = {
  title: 'Gaussian Distribution Test',
  xaxis: {title: 'x'},
  yaxis: {title: 'y'},
  legend: {orientation: 'h'}
};
Plotly.newPlot('plot', [gaussianTrace, stepTrace, gradGaussianTrace, sampleTrace, sampleTrace_gg], layout);

var sigmaSlider = document.getElementById('sigma');
var numSamplesSlider = document.getElementById('num-samples');
var smoothed_checkbox = document.getElementById('cb_showsmoothed');
var antithetic_checkbox = document.getElementById('cb_antithetic');

[sigmaSlider, numSamplesSlider].forEach(function(element) {
   element.addEventListener('input', function() {
      update_plots();
   });
});

smoothed_checkbox.addEventListener('change', function() {
	if (!smoothed_checkbox.checked) {Plotly.deleteTraces('plot', 5);}
  else {
  	Plotly.addTraces('plot', smoothedFn);
    update_plots();
  }
})


function update_plots(){
	
  sigma = parseFloat(sigmaSlider.value);
  var numSamples = parseInt(numSamplesSlider.value);
  
  // update gaussian plots: for gradgaussian, plot pdf, to have same scale easier 
  for (var i = 0; i < x.length; i++) {
    y_gauss[i] = calcGaussian(x[i], sigma = sigma);
    y_gradgauss[i] = 0.5 * sigma * Math.sqrt(2.0 * Math.PI) * calcGradGaussian(x[i], sigma=sigma);		
  }
  Plotly.update('plot', {y: [y_gauss]}, {}, 0,);				// {} is update for layout, 0 is selector index
  Plotly.update('plot', {y: [y_gradgauss]}, {}, 2,);		// {} is update for layout, 0 is selector index
  
  // update samples: get samples and update the plots 
  var nsamples_real = antithetic_checkbox.checked ? Math.round(numSamples / 2.0) : numSamples; 
	const [xsampled_gauss, ysampled_gauss] = getGaussianSamples(nsamples_real, sigma, antithetic_checkbox.checked);
  const [x_gradG, y_gradG, pdf_gradG] = getGradGaussianSamples(nsamples_real, sigma, antithetic_checkbox.checked);

	Plotly.update('plot', {x: [xsampled_gauss], y: [ysampled_gauss]}, {}, 3);		
  Plotly.update('plot', {x: [x_gradG], y: [pdf_gradG]}, {}, 4);
  
  if (!smoothed_checkbox.checked) {
  	return;
  } else {
  
    // go through all x's, for every x make a "smoothed" y-val by sampling N pts from the current
    // x coordiante, and then querying and averaging their fn value
    var smoothed = []
    for(var i = 0; i < x.length; i+=1) {
      var theta = x[i]		// go from -5 to 5 

      const [xg, yg, pdf_g] = getGradGaussianSamples(nsamples_real, sigma, antithetic_checkbox.checked);
      //const [xg, yg] = getGaussianSamples(numSamples, sigma, antithetic_checkbox.checked);

      var fn_avg = 0.0
      var fn_vals = [];
      var pdfs = []
      for (var j=0; j < xg.length; j+=1) {
        var theta_perturbed = theta - xg[j]; 
        fn_avg += stepEdge(theta_perturbed);
        //fn_vals.push(stepEdge(theta_perturbed));
        //pdfs.push(pdf_g[j]);
      }

      smoothed.push(fn_avg / numSamples); 
      //smoothed.push(mc_estimate(fn_vals, pdfs)); 
    }

    Plotly.update('plot', {x: [x], y: [smoothed]}, {}, 5);
  }
}


</script>
