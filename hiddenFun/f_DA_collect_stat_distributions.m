function f_DA_collect_stat_distributions(app)

% Function to collect stat distributions hastily written 03/3/22

% preallocate
cellStats = struct();

radius = zeros(1,size(app.ImData.imParams.suite2p.F,1));
aspect_ratio = radius;
npix_soma = radius;
npix = radius;
npix_norm_no_crop = radius;
npix_norm = radius;
skew = radius;
std = radius;
compact = radius;
footprint = radius;
solidity = radius;
SNR_S2P = radius;

for i = 1:size(app.ImData.imParams.suite2p.F,1)
    radius(i) = app.ImData.imParams.suite2p.stat{i}.radius;
    aspect_ratio(i) = app.ImData.imParams.suite2p.stat{i}.aspect_ratio;
    npix_soma(i) = app.ImData.imParams.suite2p.stat{i}.npix_soma;
    npix(i) = app.ImData.imParams.suite2p.stat{i}.npix;
    npix_norm_no_crop(i) = app.ImData.imParams.suite2p.stat{i}.npix_norm_no_crop;
    npix_norm(i) = app.ImData.imParams.suite2p.stat{i}.npix_norm;
    skew(i) = app.ImData.imParams.suite2p.stat{i}.skew;
    std(i) = app.ImData.imParams.suite2p.stat{i}.std;
    compact(i) = app.ImData.imParams.suite2p.stat{i}.compact;
    footprint(i) = app.ImData.imParams.suite2p.stat{i}.footprint;
    solidity(i) = app.ImData.imParams.suite2p.stat{i}.solidity;
    SNR_S2P(i) = max(app.ImData.imParams.suite2p.AdcF(i,:))./std(i);
end

cellStats.radius=radius;
cellStats.aspect_ratio = aspect_ratio;
cellStats.npix_soma = npix_soma;
cellStats.npix = npix;
cellStats.npix_norm_no_crop = npix_norm_no_crop;
cellStats.npix_norm = npix_norm;
cellStats.skew = skew;
cellStats.std = std;
cellStats.compact = compact;
cellStats.footprint = footprint;
cellStats.solidity = solidity;
cellStats.SNR_S2P = SNR_S2P;


app.ImData.imParams.suite2p.cellStats = cellStats;


end
