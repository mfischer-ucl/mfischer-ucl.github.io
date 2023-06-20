<style>
  #plot-container-wrapper {
    background-color: rgba(240, 240, 240, 0.5);
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
    padding: 20px;
    justify-content: space-between;
    height: 640px;
    display: flex; 
  }
  #plot-container {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  #plot-container2 {
    display: flex;
    justify-content: space-between;
  }
  #plot-container3 {
    display: flex;
    justify-content: space-between;
  }
  #plot {
    width: 100%;
    height: 485px;
  }
  #plot2 {
    width: 100%;
    height: 220px;
  }
  #plot3 {
    width: 100%;
    height: 100px;
  }
  .slider {
    margin-left: 5%;
    width: 30%;
  }
  .textbox {
    border-style: solid; 
    box-shadow: inset 0px 0px 0px 0px black; 
    border: none; 
    background-color: transparent;
  }

@media screen and (max-width: 768px) {
    #plot-container-wrapper {
        max-width: 100%;
    }
}

</style>

<div id="plot-container-wrapper">
    <div id="plot-container">
      <div id="plot"></div>
      <div id="plot3"></div>
    </div>
    <div id="plot-container">
      <div style="width: 400px;">       <!-- the slider container-->
        <div style="display: flex">
          <label for="sigma">Sigma:</label>
          <input class="slider" type="range" min="0.33" max="2.5" step="0.01" value="1" id="sigma">
        </div>
        <div style="display: flex">
          <label for="num-samples">Num Samples:</label>
          <input class="slider" type="range" min="2" max="100" step="2" value="10" id="num-samples">
        </div>
        <div style="display: flex">
          <label for="theta">Theta:</label>
          <input class="slider" type="range" min="-4" max="4.0" step="0.1" value="-1.8" id="theta">
        </div>
        <div style="display: flex">
          <label for="stepsize">StepSize:</label>
          <input class="slider" type="range" min="0.001" max="0.5" step="0.01" value="0.1" id="stepsize">
        </div>
        <div style="display: flex">
          <label for="epochs">Epochs:</label>
          <input class="slider" type="range" min="10" max="700" step="1" value="200" id="epochs">
        </div>
        <div style="display: flex">
            <input type="checkbox" id="cb_antithetic" checked>
            <div style="margin-left: 10px;">Antithetic?</div>
        </div>
        <div style="display: flex">
            <input type="checkbox" id="cb_showsmoothed">
            <div style="margin-left: 10px;">Show Smooth?</div>
        </div>
        <div style="display: flex;">
          <button style="float: left; margin-top: 14px;" onclick="optimize()">Run Optimization</button>
          <button style="float: left; margin-left: 10px; margin-top: 14px;" onclick="stop_anim()">Stop</button>
          <button style="float: left; margin-left: 10px; margin-top: 14px;" onclick="reset()">Reset</button>
        </div>
        _______________________________________
        <div style="display: flex; margin-top: 10px">
            <input type="text" class="textbox" id="epoch_text" value="Current Epoch: 0">
        </div>
        <div style="display: flex">
            <input type="text" class="textbox" id="cost_text" value="Current Cost: 1.0">
        </div>
        <div id="plot2" style="width: 100%;"></div>
      </div>
    </div>
</div>

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script>
  
function stepEdge(x) {
	return x < -0.5 ? 1 : (x > 2.5 ? 1 : 0); 
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

function icdf(x, sigma) {
	if (x > 0.5) {
  	return Math.sqrt(-2.0 * Math.pow(sigma, 2) * Math.log(2.0 * (1.0 - x)));
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
  	
    var rand = clean_random(Math.random());
    var x_i = icdf(rand, sigma) * (rand < 0.5 ? -1.0 : 1.0); 
    samples.push(x_i);
    
    if (antithetic) {
      var arand = 1.0 - rand; 
      var x_i = icdf(arand, sigma) * (arand < 0.5 ? -1.0 : 1.0); 
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

function mc_estimate(f_x, p_x) {
	var N = f_x.length; 
  var estimate = 0.0; 
  for (var i = 0; i < N; i += 1) {
  	estimate += (f_x[i] / p_x[i]);
  }
  return estimate / N; 
}

function mse(x, y) {
	return Math.pow((x - y), 2); 
 } 

function convolve(theta, n_samples, samples, pdfs, sigma, goal) {
	var outputs = [];
  
  goal = 0.0; 		// after rendering! 
  
  var tmp = []
  for(var i = 0; i < n_samples; i+=1) {
  	var tau = samples[i];
    var w = gradGaussianKernel(tau, sigma);
    
    var theta_p = theta - tau; 
    var fn = stepEdge(theta_p);
    var weighted_fn_val = mse(fn, goal) * w; 
    
    outputs.push(weighted_fn_val); 
  }
  
  var final_estimate = mc_estimate(outputs, pdfs);
  return final_estimate;
}

function avg_list(vals) {
	var average = 0.0; 
	for (var i = 0; i < vals.length; i++) {
  	average += vals[i];
  }
  return average / vals.length; 
}


function optimize() {
	if (run_anim){return;}		// avoid double-running, e.g., when button is clicked while anim is running 
  
	sigma = parseFloat(sigmaSlider.value);
  var theta = parseFloat(thetaSlider.value); 
  var epochs = parseInt(epochsSlider.value);
  var stepsize = parseFloat(stepsizeSlider.value);
  var numSamples = parseInt(numSamplesSlider.value);
  var nsamples_real = antithetic_checkbox.checked ? Math.round(numSamples / 2.0) : numSamples; 

	run_anim = true; 
  Plotly.update('plot', {x: [[theta]], y: [[stepEdge(theta)]]}, {}, 2);
	Plotly.update('plot', {visible: true}, {}, 2);
	
  var gt_theta; gt_theta = 0.0; 
  
  let i = 0; 
  const updateTrace = () => {
    if (i < epochs && run_anim) {
      
      // get gradient by convolving and multiplying by kernel: 
      const [x_i, f_xi, p_xi] = getGradGaussianSamples(numSamples, sigma, antithetic_checkbox.checked);
    
      var grad = convolve(theta, nsamples_real, x_i, p_xi, sigma, gt_theta);
      
      // grad. descent step 
      theta -= stepsize * grad; 
    
    	var cost = mse(stepEdge(theta), gt_theta); 
      update_trajectory([theta, stepEdge(theta), cost]); 
      text_epochs.value = 'Current Epoch: ' + (i+1).toString(); 
      text_cost.value = 'Current Cost: ' + cost.toString() + '.0'; 
      
      // make timeout so that display is able to react 
      setTimeout(updateTrace, 5); 
      i++; 
    }
  }
  
  // call function 
  updateTrace(); 
 }
    
function update_trajectory(values){
  const traj = plot.data[2];
  var xData = traj.x;
	var yData = traj.y;
  xData.push(values[0]); 
  yData.push(values[1]);
  Plotly.update('plot', {x: [xData], y: [yData]}, {}, 2);
  update_triangle(values[0]); 
}


defaults = {'sigma': 1.0, 'nsamples': 10, 'epochs': 600, 'stepsize': 0.1, 'theta': -2.0};

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
  name: 'Cost Function',
  type: 'scatter',
  marker: {color: 'orange'}
};
var sampleTrace = {
    x: [],
    y: [],
    name: 'Samples',
    showlegend: false,
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
    showlegend: false,
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
var verticalZero = {
  x: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  y: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
  name: '',
  showlegend: false,
  type: 'scatter',
  opacity: 0.75,
  line: {color: 'black', 'width': 0.5},
};
var pxTrace = {
  x: [-5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1, 2, 3, 4, 5, -5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1, 2, 3, 4, 5],
  y: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  name: '',
  showlegend: false,
  type: 'scatter',
  opacity: 0.75,
  marker: {color: 'black', size: 2, line: {color: 'black', width: 2}}
};
var trajectory = {
	x: [defaults.theta], 
  y: [1.0], 
  name: 'Triangle Center', 
  type: 'scatter', 
  mode: 'markers',
  marker: {color: 'lime', size: 10, line: {color: 'grey', width: 1}}
};
var layout = {
  title: '1D Example: Differentiating Through Plateaus',
  xaxis: {title: 'x', 'range': [-5, 5], zeroline: false},
  yaxis: {title: 'y', 'range': [-0.1, 1.2]},
  legend: {orientation: 'h', y: 0.0, xanchor: 'center', x: 0.5},
  /*shapes: [{type: 'rect',
           xref: 'x',
           yref: 'paper',
           x0: -1.5,
           y0: 0.075,
           x1: 1.5,
           y1: 0.15,
           fillcolor: 'royalblue',
           opacity: 0.6,
           layer: 'below',
           line: {width: 0}}],*/
};
var layoutLower = {
  xaxis: {title: '', 'range': [-5, 5]},
  yaxis: {title: '', 'range': [-0.1, 1.2]},
  legend: {orientation: 'h', y: 0.0, xanchor: 'center', x: 0.5},
  margin: {t: 10, b: 10, l: 25, r: 10},
  autosize: true
};
var layoutPxPlot = {
  xaxis: {title: '', 'range': [-5, 5], zeroline: false, showgrid: false},
  yaxis: {title: '', 'range': [-0.2, 0.7], showgrid: false, tickmode: 'array', tickvals: [0],
    showticklabels: false},
  legend: {orientation: 'h', y: 0.0, xanchor: 'center', x: 0.5},
  margin: {t: 2, b: 2, l: 80, r: 80},
  shapes: [{type: 'path',
      			path: 'M 0 0 L 1 0.4 L 2 0 Z',
      			xref: 'x',
      			yref: 'y',
      			fillcolor: 'red',
      			opacity: 0.6,
      			line: {width: 1}}, 
      		 {type: 'rect',
            xref: 'x',
            yref: 'y',
            x0: 0.80,
            y0: 0.0,
            x1: 1.2,
            y1: 0.2,
            fillcolor: 'grey',
            opacity: 0.6,
            line: {width: 1}}],
};

Plotly.newPlot('plot', [stepTrace, 
                        smoothedFn,
                        trajectory], layout);
Plotly.newPlot('plot2', [gaussianTrace,
                         gradGaussianTrace,
                         sampleTrace,
                         sampleTrace_gg,verticalZero], layoutLower);
Plotly.newPlot('plot3', [pxTrace], layoutPxPlot);
                        
function reset_textboxes() {
	text_cost.value = 'Current Cost: 1.0'; 
  text_epochs.value = 'Current Epoch: 0';
}

function reset(incl_plots=true) {
	sigmaSlider.value = defaults.sigma; 
  thetaSlider.value = defaults.theta;
  epochsSlider.value = defaults.epochs; 
  stepsizeSlider.value = defaults.stepsize; 
  numSamplesSlider.value = defaults.nsamples; 
  smoothed_checkbox.checked = false;
  antithetic_checkbox.checked = true;
  reset_textboxes(); 
  update_triangle();
  if (incl_plots) update_plots();
}

var sigmaSlider = document.getElementById('sigma');
var thetaSlider = document.getElementById('theta');
var epochsSlider = document.getElementById('epochs');
var stepsizeSlider = document.getElementById('stepsize');
var numSamplesSlider = document.getElementById('num-samples');
var smoothed_checkbox = document.getElementById('cb_showsmoothed');
var antithetic_checkbox = document.getElementById('cb_antithetic');

var text_cost = document.getElementById('cost_text')
var text_epochs = document.getElementById('epoch_text')

reset(incl_plots=false); 		// set default values to sliders 

var run_anim = false; 

thetaSlider.addEventListener('input', function() {
	update_triangle()
  update_plots(resample=false);
  stop_anim(); 
  reset_textboxes(); 
});

[epochsSlider, stepsizeSlider].forEach(function(element) {
   element.addEventListener('input', function() {
      update_plots(resample=false);
      stop_anim(); 
      reset_textboxes(); 
   });
});

[sigmaSlider, numSamplesSlider,antithetic_checkbox, smoothed_checkbox].forEach(function(element) {
   element.addEventListener('input', function() {
      update_plots(resample=true);
      stop_anim(); 
      reset_textboxes(); 
   });
});

function stop_anim() {
	run_anim = false; 
}

function theta_to_triPath(th) {
	// expects a single theta parameter, returns a triangle path that is used to update the layout 
  var w = 1.4; 		// tri width 
  var y = 0.0; 
  var h = 0.5; 
  var tripath = 'M ' + (th-w).toString() + ' ' + y.toString() + ' L ' + th.toString() + ' ' + (y+h).toString() + ' L ' + (th+w).toString() + ' '+ y.toString() +' Z';
  return tripath; 
}

function update_triangle(theta=999) {
	if (theta==999) {
		theta = parseFloat(thetaSlider.value); 		// default value, never passed, read from slider 
  }
  var tripath = theta_to_triPath(theta); 
  var update = {'shapes[0].path': tripath};
  Plotly.relayout('plot3', update);
}

function update_plots(resample=true){
	
  if (!smoothed_checkbox.checked) {Plotly.update('plot', {visible: false}, {}, 1);}
  else {Plotly.update('plot', {visible: true}, {}, 1);}
  
  sigma = parseFloat(sigmaSlider.value);
  var theta_init = parseFloat(thetaSlider.value);
  var numSamples = parseInt(numSamplesSlider.value);
  
  // remove (potential) trajectory 
  Plotly.update('plot', {visible: true}, {}, 2);
  Plotly.update('plot', {x: [[theta_init]], y: [[stepEdge(theta_init)]]}, {}, 2); 
  
  // update gaussian plots: for gradgaussian, plot pdf, to have same scale easier 
  for (var i = 0; i < x.length; i++) {
    y_gauss[i] = calcGaussian(x[i], sigma = sigma);
    y_gradgauss[i] = 0.5 * sigma * Math.sqrt(2.0 * Math.PI) * calcGradGaussian(x[i], sigma=sigma);		
  }
  Plotly.update('plot2', {y: [y_gauss]}, {}, 0,);				// {} is update for layout, 0 is selector index
  Plotly.update('plot2', {y: [y_gradgauss]}, {}, 1,);		// {} is update for layout, 0 is selector index
  
  
    // update samples: get samples and update the plots 
    var nsamples_real = antithetic_checkbox.checked ? Math.floor(numSamples / 2.0) : numSamples; 
    if (resample) {
    const [xsampled_gauss, ysampled_gauss] = getGaussianSamples(nsamples_real, sigma, antithetic_checkbox.checked);
    const [x_gradG, y_gradG, pdf_gradG] = getGradGaussianSamples(nsamples_real, sigma, antithetic_checkbox.checked);
  
    Plotly.update('plot2', {x: [xsampled_gauss], y: [ysampled_gauss]}, {}, 2);		
    Plotly.update('plot2', {x: [x_gradG], y: [pdf_gradG]}, {}, 3);
  }
  
  if (!smoothed_checkbox.checked) {
  	return;
  } else {
  	if (!resample) {return;}
  
    // go through all x's, for every x make a "smoothed" y-val by sampling N pts from the current
    // x coordinate, and then query and avg their fn val 
    var smoothed = []
    for(var i = 0; i < x.length; i+=1) {
      var theta = x[i]		// go from -5 to 5 

			// we concolve with the Gaussian, not the grad.gaussian! 
      //const [xg, yg, pdf_g] = getGradGaussianSamples(nsamples_real, sigma, antithetic_checkbox.checked);
      const [xg, yg] = getGaussianSamples(nsamples_real, sigma, antithetic_checkbox.checked);

      var fn_avg; fn_avg = 0.0;
      for (var j=0; j < xg.length; j+=1) {
        var theta_perturbed = theta - xg[j]; 
        fn_avg += stepEdge(theta_perturbed);
      }

      smoothed.push(fn_avg / numSamples); 
    }

    Plotly.update('plot', {x: [x], y: [smoothed]}, {}, 1);
  }
}


</script>