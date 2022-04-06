function f_DA_thresholdLA(app)

threshold = app.LowActivityThresholdEditField.Value;
S = app.PreProcData.sumNeurons;

dropthisdata = find(S<threshold);

app.PreProcData.binnedData(dropthisdata,:)=[];
app.PreProcData.removedNeurons = [app.PreProcData.removedNeurons; app.PreProcData.keptNeurons(dropthisdata)];
app.PreProcData.keptNeurons(dropthisdata)=[];

end
 