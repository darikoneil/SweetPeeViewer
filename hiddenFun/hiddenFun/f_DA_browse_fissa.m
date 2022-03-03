function ops = f_DA_browse_fissa(app)

[file_name,path] = uigetfile({'*.mat'},'Select Fissa File');

app.file_loc_fissa = fullfile(path,file_name);
disp(['User selected ', app.file_loc_fissa]);
app.FIssaPath.Value = app.file_loc_fissa;

end

