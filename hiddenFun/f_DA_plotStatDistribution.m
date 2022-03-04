function f_DA_plotStatDistribution(app)
% hastily written DAO 02/28/22

Type = app.ThresholdTypeDropDown.Value;
cla(app.StatDistribution,'reset');
app.StatDistribution.Title.String=[Type ' Kernel-Smoothed Distribution'];
app.StatDistribution.XLabel.String=[];
app.StatDistribution.YLabel.String=[];


if strcmp(Type, 'SNR')
    warning = find(app.ImData.imParams.suite2p.SNR < 0.0000000001);
    if numel(warning)>0
         f_DA_update_log(app,'SOMETHING WEIRD GOIN ON HERE...');
         f_DA_update_log(app,'NEGATIVE SIGNAL-TO-NOISE DETECTED!');
         f_DA_update_log(app,'SETTING SNR FOR THIS NEURON TO LIM ZERO');
        for i = 1:length(warning)
            app.ImData.imParams.suite2p.SNR(warning(i))=0.0000000001;
            app.ImData.SNR(warning(i))=0;
        end
    end
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.SNR,'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]);
    
elseif strcmp(Type, 'Radius')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.radius, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]);   
    
elseif strcmp(Type, 'Solidity')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.solidity, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 

elseif strcmp(Type, 'Footprint')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.footprint, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Compactness')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.compact, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Cell Probability')
    %[f,xi] = ksdensity(app.ImData.imParams.suite2p.IC(:,2), 'Function', 'pdf', 'Support', 'positive', 'BoundaryCorrection', 'reflection');
    histogram(app.StatDistribution, app.ImData.imParams.suite2p.IC(:,2)); % xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]);

elseif strcmp(Type, 'SNR (S2P)')
     [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.SNR_S2P, 'Function','pdf');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Noise (Std)')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.std, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Skew')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.skew, 'Function','pdf');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Aspect')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.aspect_ratio, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Total Pixels')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.npix, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Soma Pixels')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.npix_soma, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Norm Total')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.npix_norm_no_crop, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
    
elseif strcmp(Type, 'Norm Soma')
    [f,xi] = ksdensity(app.ImData.imParams.suite2p.cellStats.npix_norm, 'Function','pdf', 'Support', 'positive', 'BoundaryCorrection','reflection');
    plot(app.StatDistribution, xi, f, 'LineWidth', 2, 'LineStyle', '-', 'Color', [0.87 0.27 0.27]); 
end

axis(app.StatDistribution,'tight');
app.StatDistribution.Box = 'on';
app.StatDistribution.Title.String=[Type ' Kernel-Smoothed Distribution'];
app.StatDistribution.XLabel.String=[];
app.StatDistribution.YLabel.String=[];
end