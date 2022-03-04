function f_DA_export_CRFData(app)

data = app.PreProcData.binnedData;
save(app.suite2p_filename, 'data');

end