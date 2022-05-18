function ops = f_DA_browse_fissa(app)

q = figure('Renderer', 'painters', 'Position', [-5000 -5000 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink

[file_name,path] = uigetfile({'*.mat'},'Select Fissa File');

app.file_loc_fissa = fullfile(path,file_name);
app.FIssaPath.Value = app.file_loc_fissa;
delete(q);
end

