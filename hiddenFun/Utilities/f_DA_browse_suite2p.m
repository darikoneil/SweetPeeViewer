function f_DA_browse_suite2p(app)
% Darik O'Neil 04/06/2022

% function to browse for suite2p file
[file_name,path] = uigetfile({'*.mat'},'Select Suite2P File');
app.suite2p_filename = file_name;
app.file_loc_suite2p = fullfile(path,file_name);
app.file_path_suite2p = path;
app.Suite2PPath.Value = app.file_loc_suite2p;
%WHY DO I NEED SO MANY OF THESE WHAT WAS I DOING
end
