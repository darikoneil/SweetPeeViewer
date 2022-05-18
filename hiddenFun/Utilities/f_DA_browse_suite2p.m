function f_DA_browse_suite2p(app)
% Darik O'Neil 04/06/2022

%make a dummy figure

q = figure('Renderer', 'painters', 'Position', [-5000 -5000 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink
% function to select rois
% function to browse for suite2p file
[file_name,path] = uigetfile({'*.mat'},'Select Suite2P File');
app.suite2p_filename = file_name;
app.file_loc_suite2p = fullfile(path,file_name);
app.file_path_suite2p = path;
app.Suite2PPath.Value = app.file_loc_suite2p;


%WHY DO I NEED SO MANY OF THESE WHAT WAS I DOING
delete(q); %delete the dummy figure
end

