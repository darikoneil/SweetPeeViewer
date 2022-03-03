function f_DA_initialize_data(app)


f_DA_update_log(app,'Initializing & Pre-allocating UnDefined Data');

try
    A = app.ImData.imParmas.suite2p.dFdT(1,:);
catch
    app.ImData.imParams.suite2p.dFdT = zeros(size(app.ImData.imParams.suite2p.F));
end

try
    B = app.ImData.imParams.suite2p.dFoF(1,:);
catch
    app.ImData.imParams.suite2p.dFoF = zeros(size(app.ImData.imParams.suite2p.F));
end

try
    C = app.ImData.Decon(1,:);
catch
    app.ImData.Decon = zeros(size(app.ImData.imParams.suite2p.F));
end

try
    D = app.ImData.accSpikes{1};
catch
    app.ImData.accSpikes = cell(size(app.ImData.imParams.suite2p.stat),1);
end

end
