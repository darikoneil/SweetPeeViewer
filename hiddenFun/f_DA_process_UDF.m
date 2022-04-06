function f_DA_process_UDF(app)

UDF = app.PreProcData.UDF;
binSize = app.BinSizeEditField.Value;

if binSize>1
    binnedUDF = cara_beaner2(UDF,binSize);
    binnedUDF = binsa(binnedUDF,length(binnedUDF));
    binnedUDF(binnedUDF>1)=1;
else
    binnedUDF = UDF;
end

app.PreProcData.processedUDF = binnedUDF(:,app.PreProcData.keptFrames);

end