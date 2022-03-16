function f_DA_thresholdHA(app)


threshold = app.HighActivityThresholdEditField.Value;
S = app.PreProcData.sumActivity;

keepthisdata = find(S>threshold);

app.PreProcData.binnedData = app.PreProcData.binnedData(:,keepthisdata);
app.PreProcData.keptFrames = keepthisdata;

end
 