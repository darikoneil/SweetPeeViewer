# Sweet Pee Viewer v0.85
BETA app for sorting, refining, deconvolving, and post-processing Suite2P & Fissa Datasets

Inspired by Yuriy Shymkiv's [caiman sorter](https://github.com/shymkivy/caiman_sorter)      

external dependencies:      
[Matlab 2020b](https://www.mathworks.com/products/new_products/release2020b.html)     
[CVX](http://cvxr.com/cvx/download/)      

internal dependencies:      
["MCMC Spike Inference in Continuous Time"](https://github.com/flatironinstitute/CaImAn-MATLAB/tree/master/deconvolution/MCMC)      
["Constrained Deconvolution - FOOPSI"](https://github.com/epnev/constrained-foopsi)     

# TO-DO:
full param decon functionality      
tidy up / beautify the design (eventually---when I need to procrastinate)     
refactor the super ugly repeated code blocks / spaghetti          


# PUSHES:  
02/24/22 -> Fixed bug in overlays. Made some options not implemented un-editable      
03/03/2022 -> thresholding, neuropil      
03/04/22-> preproccessing the code works but is ugly      
03/18/2022-> quick fix to accommate bug in neuropil mask export of suite2p when using manual labels     
04/06/2022 -> Significant Update -> refactored several functions and ROI plotting for better speed and memory usage, fixed coordinates of motion-cropped overlays (v0.83)      
04/08/2022 -> Added Import for Longitudinal Tracking (must already be registered on my multi-day alignment tool) (v0.85)      



### EXAMPLE OF HIPPOCAMPAL INTERNEURONS - ROI SORTING     
![example](https://github.com/darikoneil/SweetPeeViewer/blob/main/Example_1.PNG)

### EXAMPLE OF HIPPOCAMPAL INTERNEURONS - DECONVOLUTION    
![example](https://github.com/darikoneil/SweetPeeViewer/blob/main/Example_3.PNG)

### EXAMPLE OF HIPPOCAMPAL INTERNEURONS - LONGITUDINAL TRACKING     
![example](https://github.com/darikoneil/SweetPeeViewer/blob/main/Example_2.PNG)


