function f_DA_binData(app)

binSize = app.BinSizeEditField.Value;
data = accSpikesToRaster(app.ImData.accSpikes,app.ImData.NeuronIndex,size(app.ImData.imParams.suite2p.F,2));

if binSize > 1
    binnedData = cara_beaner2(data, binSize);
    binnedData = binsa(binnedData,length(binnedData));
    binnedData(binnedData>1)=1;
else
    binnedData = data;
end
app.PreProcData.data = data;
app.PreProcData.binnedData = binnedData;

app.PreProcData.sumActivity = sum(app.PreProcData.binnedData,1);
app.PreProcData.sumActivity = (app.PreProcData.sumActivity./size(app.PreProcData.binnedData,1)).*100;
app.meanHAField.Value = mean(app.PreProcData.sumActivity);
app.stdevHAField.Value = std(app.PreProcData.sumActivity);
app.PreProcData.sumNeurons = ((sum(app.PreProcData.binnedData,2))./size(app.PreProcData.binnedData,2)).*100;
app.meanLAField.Value = mean(app.PreProcData.sumNeurons);
app.stdevLAField.Value = std(app.PreProcData.sumNeurons);
end
