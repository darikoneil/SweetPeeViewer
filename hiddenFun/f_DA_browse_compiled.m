function ops = f_DA_browse_compiled(app)

ops=app.ops;
browse_exist=0;

if isfield(ops, 'browse_path')
    browse_path = ops.browse_path;
    if exist(browse_path, 'dir')
        browse_exist = 1;
    end
end


if browse_exist
    [file_name,path] = uigetfile([browse_path '*.mat']);
else
    [file_name,path] = uigetfile({'*.mat'},'Select Pre-Compiled File');
end

if path
    ops.browse_path = path;
end


drawnow; pause(0.05);
app.UIFigure.Visible = 'off';
app.UIFigure.Visible = 'on';

if isequal(file_name,0)
   disp('User selected Cancel');
else
   app.file_loc_compiled = fullfile(path,file_name);
   disp(['User selected ', app.file_loc_compiled]);
   app.OptionsPath.Value = app.file_loc_compiled;
end

app.ops = ops;


end

