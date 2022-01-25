function f_DA_import_parse_imaging(app)
% Function to load compiled --Darik 01/19/2022

%% FIRST SEARCH
indicatorMsg = ['Searching for Imaging Files'];
f_DA_update_log(app,indicatorMsg);

tryMsg  = ['Searching for Suite2P File'];
f_DA_update_log(app,tryMsg);
try
    if ~strcmp('Suite2P File Path (.mat)',app.Suite2PPath.Value)
        f1 = app.Suite2PPath.Value;
    end
    exist(f1);
    tryMsg = ['Found Suite2P File Path'];
    f_DA_update_log(app,tryMsg);
catch
    catchMsg = ['Could Not Find Suite2P File Path'];
    f_DA_update_log(app,catchMsg);
end


tryMsg = ['Searching for Options Path'];
f_DA_update_log(app,tryMsg);
try
    if ~strcmp('Load Options File (.mat)',app.OptionsPath.Value)
        f_DA_load_options(app);
    end
    exist(procFlag);
    tryMsg = ['Found Options File (.mat)'];
    f_DA_update_log(app,tryMsg);
catch
    catchMsg = ['Compatible Options File Not Identified'];
    f_DA_update_log(app,catchMsg);
    procFlag=struct();
end

tryMsg = ['Searching for Fissa Path'];
f_DA_update_log(app,tryMsg);
try
    if ~strcmp('Fissa File Path (.mat)',app.FIssaPath.Value)
        f2 = app.FIssaPath.Value;
        tryMsg = ['Found Fissa File Path'];
        f_DA_update_log(app,tryMsg);
        procFlag.useFissa = true;
    else
        procFlag.useFissa = false;
    end
   
catch
    catchMsg = ['Could Not Find Fissa File Path (Optional)'];
    f_DA_update_log(app,catchMsg);
    procFlag.useFissa=false;
end

%% NOW IMPORT & PARSE
indicatorMsg = ['Beginning Import'];
f_DA_update_log(app,indicatorMsg)

    if(exist('f1'))
        if(exist('f2'))
            [ImData] = f_DA_importProcessImages(app,procFlag,f1,f2);
        else
            [ImData] = f_DA_importProcessImages(app,procFlag,f1);
        end
    else
        [ImData] = f_DA_importProcessImages(app,procFlag);
    end

indicatorMsg = ['Exporting Formatted Structure'];    
f_DA_update_log(app,indicatorMsg);


%% Now export caller memory
app.ImData=ImData;


end
