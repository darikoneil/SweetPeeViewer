function f_DA_initialize_PP(app)

f_DA_binData(app);
app.BinSizeEditField.Value = 1;
app.BinDurationEditField.Value=(1/app.ImData.fr)*1000;
app.PreProcData.sumActivity = sum(app.PreProcData.binnedData,1);
app.PreProcData.sumActivity = (app.PreProcData.sumActivity./size(app.PreProcData.binnedData,1)).*100;
app.meanHAField.Value = mean(app.PreProcData.sumActivity);
app.stdevHAField.Value = std(app.PreProcData.sumActivity);
app.PreProcData.sumNeurons = ((sum(app.PreProcData.binnedData,2))./size(app.PreProcData.binnedData,2)).*100;
app.meanLAField.Value = mean(app.PreProcData.sumNeurons);
app.stdevLAField.Value = std(app.PreProcData.sumNeurons);
end

