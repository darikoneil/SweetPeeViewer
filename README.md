# Sweet Pee Viewer v0.95
App for sorting, refining, deconvolving, and post-processing Suite2P & Fissa datasets

Not finished & hastily coded. Unsure if will tidy up & finalize as I've moved my pipeline to python.

Inspired by Yuriy Shymkiv's [caiman sorter](https://github.com/shymkivy/caiman_sorter)      

External dependencies:      
[Matlab 2020b](https://www.mathworks.com/products/new_products/release2020b.html)     
[CVX](http://cvxr.com/cvx/download/)      

Internal dependencies:      
["MCMC Spike Inference in Continuous Time"](https://github.com/flatironinstitute/CaImAn-MATLAB/tree/master/deconvolution/MCMC)      
["Constrained Deconvolution - FOOPSI"](https://github.com/epnev/constrained-foopsi)     

# Update Log:  
02/24/22 -> Fixed bug in overlays. Made some options not implemented un-editable      
03/03/2022 -> thresholding, neuropil      
03/04/22-> preproccessing the code works but is ugly      
03/18/2022-> quick fix to accommate bug in neuropil mask export of suite2p when using manual labels     
04/06/2022 -> Significant Update -> refactored several functions and ROI plotting for better speed and memory usage, fixed coordinates of motion-cropped overlays (v0.83)      
04/08/2022 -> Added Import for Longitudinal Tracking (must already be registered on my multi-day alignment tool) (v0.85)      
04/11/2022 -> Sped up deconvolution plotting      
04/12/2022 -> Re-added mascot to encourage Ras to update to the latest version (v0.86)
05/18/2022 -> Refactored the app to be much more snappy     
07/29/2022 -> is ded rip?

# Preview

### EXAMPLE OF HIPPOCAMPAL INTERNEURONS - ROI SORTING     
![example1](https://github.com/darikoneil/SweetPeeViewer/blob/main/Example1.PNG)

### EXAMPLE OF HIPPOCAMPAL INTERNEURONS - DECONVOLUTION    
![example3](https://github.com/darikoneil/SweetPeeViewer/blob/main/Example3.PNG)

### EXAMPLE OF HIPPOCAMPAL INTERNEURONS - LONGITUDINAL TRACKING    
![example2](https://github.com/darikoneil/SweetPeeViewer/blob/main/Example2.PNG)

# To-Do:
* full parameter decon functionality      
* tidy up / beautify the design (eventually---when I need to procrastinate)     
* refactor the super ugly repeated code blocks / spaghetti 

