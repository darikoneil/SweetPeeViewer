function f_DA_thresholdLA(app)

threshold = app.LowActivityThresholdEditField.Value;
S = app.PreProcData.sumNeurons;

dropthisdata = find(S<threshold);

app.PreProcData.binnedData(dropthisdata,:)=[];

end
 