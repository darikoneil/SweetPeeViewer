function f_DA_threshold_ROIs(app)

%% Documentation Contents
% Darik O'Neil 02/28/2022
% Function to threshold ROIs


%% Update Indices
for i = 1:size(app.ImData.imParams.suite2p.F,1)
    %if fate = 1 then we remove
    fate = f_DA_thresholdInner(app.ThresholdValueEditField.Value, app.GreaterThanButton.Value, app.ImData.imParams.suite2p, i, app.ThresholdTypeDropDown.Value);
    if fate == 1
        app.ImData.RemovedIndex = [app.ImData.RemovedIndex;i];
        app.ImData.RemovedIndex = sort(app.ImData.RemovedIndex,'ascend');
        tempIdx = find(app.ImData.NeuronIndex==i);
        app.ImData.NeuronIndex(tempIdx)=[]; 
    end
end

%% Update ROI Structures
ROI_contours = app.ImData.ROI_conoturs;
RemovedIndex = app.ImData.RemovedIndex;
%NeuronIndex = app.ImData.NeuronIndex; not needed 02-28-2022

%Store non-Neuronal ROIs
removedROIs = struct();
removedROIs.xpix = cell(1,length(RemovedIndex));
removedROIs.ypix = cell(1,length(RemovedIndex));
removedROIs.boundaryOutlines=cell(1,length(RemovedIndex));

for i = 1:length(RemovedIndex)
    removedROIs.xpix{i} = ROI_contours.xpix{RemovedIndex(i)};
    removedROIs.ypix{i}  = ROI_contours.ypix{RemovedIndex(i)};
    removedROIs.boundaryOutlines{i} = ROI_contours.boundaryOutlines{RemovedIndex(i)};
end
%Store neuronal ROIs
neuronalROIs = ROI_contours;
neuronalROIs.xpix(RemovedIndex)=[];
neuronalROIs.ypix(RemovedIndex)=[];
neuronalROIs.boundaryOutlines(RemovedIndex)=[];

app.ImData.neuronalROIs = neuronalROIs;
app.ImData.removedROIs = removedROIs;

app.NeuronsEditField.Value = length(app.ImData.NeuronIndex);
app.DroppedEditField.Value = length(app.ImData.RemovedIndex);
app.TotalEditField.Value = numel(app.ImData.NeuronIndex)+numel(app.ImData.RemovedIndex);

end