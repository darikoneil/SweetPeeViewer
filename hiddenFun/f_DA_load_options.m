function f_DA_load_options(app)
% Function to load compiled --Darik 01/19/2022

indicatorMsg = ['Loading Options File'];
f_DA_update_log(app,indicatorMsg);

try
    file_loc_options = app.file_loc_options;
    load(file_loc_options,'procFlag');
    tryMsg = ['Loading Options File Successful'];
    f_DA_update_log(app,tryMsg);
catch
    catchMsg = ['Compatible Options File Not Identified'];
    f_DA_update_log(app,catchMsg);
end

end
