function f_DA_load_compiled(app)
% Function to load compiled --Darik 01/19/2022

indicatorMsg = ['Loading Pre-Compiled File'];
f_DA_update_log(app,indicatorMsg);

try
    file_loc_compiled = app.file_loc_compiled;
    load(file_loc_compiled,'ImData');
    app.ImData = ImData;
    tryMsg = ['Loading Pre-Compiled File Successful'];
    f_DA_update_log(app,tryMsg);
catch
    catchMsg = ['Properly Compiled File Not Identified'];
    f_DA_update_log(app,catchMsg);
end

end
