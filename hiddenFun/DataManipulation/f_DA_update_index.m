function f_DA_update_index(app,value)
%% Documentation Contents
% Darik O'Neil 01-25-2022
% Function to change ROI Index

%% Function Contents
switchState = value;
v = app.SelectedCell.Value;

if strcmp(switchState,'Neuron')
    app.ImData.NeuronIndex = [app.ImData.NeuronIndex; v];
    app.ImData.NeuronIndex = sort(app.ImData.NeuronIndex,'ascend');
    tempIdx = find(app.ImData.RemovedIndex==v);
    app.ImData.RemovedIndex(tempIdx)=[];
    RemovedIndex = app.ImData.RemovedIndex;
else
    app.ImData.RemovedIndex = [app.ImData.RemovedIndex;v];
    app.ImData.RemovedIndex = sort(app.ImData.RemovedIndex,'ascend');
    tempIdx = find(app.ImData.NeuronIndex==v);
    app.ImData.NeuronIndex(tempIdx)=[];
    RemovedIndex = app.ImData.RemovedIndex;
end

ROI_contours = app.ImData.ROI_conoturs;
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

% Now update the neuronal/nonneuronal plots
f_DA_update_NeuronalROIs(app);
f_DA_update_NonNeuronalROIs(app);

% Now Update the ROI panel
%% Index

if ismember(v,app.ImData.NeuronIndex)
    app.Switch.Value = 'Neuron';
else
    app.Switch.Value = 'Drop';
end

f_DA_update_log(app,'Neuronal Index Updated');

end

