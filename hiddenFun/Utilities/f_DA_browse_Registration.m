function f_DA_browse_Registration(app)

[file,path] = uigetfile();
app.reg_filename = fullfile(path,file);
app.RegistrationPath.Value = app.reg_filename;
end


