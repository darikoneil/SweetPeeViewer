function f_DA_saveFun(app)

%% Documentation Contents
%  Darik O'Neil 02/15/2022
%   Function to save app data

%% Function Contents

% Grab Data
ImData = app.ImData;

%grab filename 
filename = app.suite2p_filename;

%set new ID
newID = 'SniffedPee_';

%grab path
path = app.file_path_suite2p;


save([path '\' newID filename], 'ImData');

end
