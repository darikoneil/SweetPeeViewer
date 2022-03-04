function f_DA_update_processing_plots(app)

cla(app.UIAxes2,'reset');

switch app.PlotOptionsDropDown.Value
     case 'Raster'
        imagesc(app.UIAxes2,app.PreProcData.data);
        axis(app.UIAxes2,'tight');
        colormap(app.UIAxes2,'gray');
        app.UIAxes2.Title.String = 'Raster';
        app.UIAxes2.XLabel.String = 'Frames';
        app.UIAxes2.YLabel.String = 'Neurons';
    case 'Binned Raster'
        imagesc(app.UIAxes2,app.PreProcData.binnedData);
        axis(app.UIAxes2,'tight');
        colormap(app.UIAxes2,'gray');
        app.UIAxes2.Title.String = 'Binned Raster';
        app.UIAxes2.XLabel.String = 'Frames';
        app.UIAxes2.YLabel.String = 'Neurons';
    case 'Activity Distribution (Sum)'
        S = sum(app.PreProcData.binnedData,1);
        [f,xi] = ksdensity(S,'Function','pdf');
        f = f.*100;
        plot(app.UIAxes2,xi,f, 'LineWidth', 2, 'Color', [0 0.56 1]);
        app.UIAxes.YDir='normal';
        app.UIAxes2.Title.String = 'Activity Distribution (Sum)';
        app.UIAxes2.YLabel.String = 'Percent of Samples';
    case 'Activity Distribution (Percent)'
         S = sum(app.PreProcData.binnedData,1);
         S = S./numel(app.ImData.NeuronIndex);
         S = S.*100;
        [f,xi] = ksdensity(S,'Function','pdf');
        f = f.*100;
        plot(app.UIAxes2,xi,f, 'LineWidth', 2, 'Color', [0 0.56 1]);
        app.UIAxes2.YDir='normal';
        app.UIAxes2.Title.String = 'Activity Distribution (Percent)';
        app.UIAxes2.XLabel.String = 'Percent Active';
        app.UIAxes2.YLabel.String = 'Percent of Samples';
    case 'Firing Distribution'
        [f,xi] = ksdensity(app.PreProcData.sumNeurons,'Function','pdf');
        f=f.*100;
        plot(app.UIAxes2,xi,f,'LineWidth', 2, 'Color', [0 0.56 1]);
        app.UIAxes2.YDir='normal';
        app.UIAxes2.Title.String = 'Firing Distribution (Percent)';
        app.UIAxes2.XLabel.String = 'Percent of Frames Active';
        app.UIAxes2.YLabel.String = 'Percent of Samples';
end

axis(app.UIAxes2,'tight');
end
