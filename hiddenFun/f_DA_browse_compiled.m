function ops = f_DA_browse_compiled(app)

q = figure('Renderer', 'painters', 'Position', [-5000 -5000 0 0]); %create a dummy figure so that uigetfile doesn't minimize our GUI
% see
% https://www.mathworks.com/matlabcentral/answers/296305-appdesigner-window-ends-up-in-background-after-uigetfile
% Onur Ozdemir solution 
% Hacky but whatever, at least it doesn't blink

[file_name,path] = uigetfile({'*.mat'},'Select Pre-Compiled File');
drawnow; pause(0.05);
app.UIFigure.Visible = 'off';
app.UIFigure.Visible = 'on';

if isequal(file_name,0)
   disp('User selected Cancel');
else
   app.file_loc_compiled = fullfile(path,file_name);
   app.CompiledPath.Value = app.file_loc_compiled;
end
delete(q);
end

