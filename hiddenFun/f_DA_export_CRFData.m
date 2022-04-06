function f_DA_export_CRFData(app)

data = app.PreProcData.binnedData;
UDF  = app.PreProcData.processedUDF;
data = transpose(data);
UDF = transpose(UDF);
coords = randi(512,size(data,2),2);
save(app.suite2p_filename, 'data', 'UDF', 'coords');

end