function f_DA_update_bin_times(app)

binSize = app.BinSizeEditField.Value;

binTime = binSize/(app.ImData.fr);

app.BinDurationEditField.Value = binTime*1000;

end
