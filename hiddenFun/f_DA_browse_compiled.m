function ops = f_DA_browse_compiled(app)


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

end

