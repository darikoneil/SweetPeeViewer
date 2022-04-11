function f_DA_grab_longReg(app, mappingIndex)

longReg = load(app.reg_filename);

%FOR REF/CURRENT == FIRST FILE

LongIndex = longReg.roiMatchData.allSessionMapping(:,mappingIndex);
LongNeurons = app.ImData.NeuronIndex(LongIndex);
LongNeurons = sort(unique(LongNeurons),'ascend');
ShortIndex = setdiff([1:numel(app.ImData.NeuronIndex)],sort(unique(LongIndex),'ascend'));
app.ImData.LongNeurons = LongNeurons;
app.ImData.ShortNeurons = app.ImData.NeuronIndex(ShortIndex);

%plot
f_DA_plot_longNeurons(app);
f_DA_plot_shortNeurons(app);

app.LongitudinalNeuronsEditField.Value = numel(LongNeurons);
app.DroppedNeuronsEditField.Value = numel(ShortIndex);
app.PercentRegisteredEditField.Value = (numel(LongNeurons))/(numel(LongNeurons)+numel(ShortIndex))*100;
end
