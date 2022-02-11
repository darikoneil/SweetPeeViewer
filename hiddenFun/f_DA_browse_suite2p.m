function f_DA_browse_suite2p(app)

%browse for suite2p file
[file_name,path] = uigetfile({'*.mat'},'Select Suite2P File');
app.suite2p_filename = file_name
app.file_loc_suite2p = fullfile(path,file_name);
disp(['User selected ', app.file_loc_suite2p]);
app.Suite2PPath.Value = app.file_loc_suite2p;

end

