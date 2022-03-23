# Sweet Pee Viewer
BETA Calcium Imaging Sorter &amp; Deconvolver for Suite2P & Fissa Files

### IMPORTANT NOTE      
Latest update broke the build's ROI plotting order in regards to overlays. Specifically, sometimes when switching ROIs the overlay defaults back to blank white space instead of the user selected overlay. In this case, simply re-select the overlay. Will be fixed ASAP.

to-do:
full param decon functionality      
tidy up / beautify the design (eventually---when I need to procrastinate)     
refactor the super ugly repeated code blocks / spaghetti      
replace UIAxes with UIfigures to reduce lag when using large datatsets      

done: sort rois, examine overlays, traces, run MCMC, preprocess, threshold rois, check distributions      

Pushes:
02/24/22 -> Fixed bug in overlays. Made some options not implemented un-editable      
03/03/2022 -> thresholding, neuropil      
03/04/22-> preproccessing the code works but is ugly      
03/18/2022-> quick fix to accommate bug in neuropil mask export of suite2p when using manual labels



### EXAMPLE     
![example](https://https://github.com/darikoneil/SweetPeeViewer/blob/main/Ignore/Example1.PNG)
