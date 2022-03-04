function f_DA_removeHyperactive(app)

threshold = app.HyperactiveThresholdEditField.Value;
S = app.PreProcData.sumNeurons;

dropthisdata = find(S>threshold);

app.PreProcData.binnedData(dropthisdata,:)=[];
end