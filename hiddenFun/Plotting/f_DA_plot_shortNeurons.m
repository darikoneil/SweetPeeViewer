function f_DA_plot_shortNeurons(app)

% Darik ONeil function to plot non-longitudinal neurons 04/08/2022

set(app.DroppedNeurons, 'NextPlot', 'replacechildren');
ROI_contours = app.ImData.ROI_conoturs; %Let's use all so we don't have to refactor the index at the moment :(
ROI_bounds = app.ImData.ROI_bounds;

% Grab Overlay Option
CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;

C = jet(size(ROI_contours.xpix,2));
C = flipud(C);
ShortNeurons = app.ImData.ShortNeurons;
i = ShortNeurons(1);

if strcmp(app.OverlayDropDown.Value, 'No Overlay')
    %first first
    fill(app.DroppedNeurons,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
    hold(app.DroppedNeurons,'on');
    for i = 2:length(ShortNeurons)
        fill(app.DroppedNeurons,ROI_contours.xpix{ShortNeurons(i)}(ROI_contours.boundaryOutlines{ShortNeurons(i)}),ROI_contours.ypix{ShortNeurons(i)}(ROI_contours.boundaryOutlines{ShortNeurons(i)}),C(ShortNeurons(i),:),'FaceAlpha',0.25);
    end
else
    fill(app.DroppedNeurons,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha', 1, 'LineJoin', 'round', 'LineWidth', 1);
    hold(app.DroppedNeurons,'on');
    for i = 2:length(ShortNeurons)
        fill(app.DroppedNeurons,ROI_contours.xpix{ShortNeurons(i)}(ROI_contours.boundaryOutlines{ShortNeurons(i)}),ROI_contours.ypix{ShortNeurons(i)}(ROI_contours.boundaryOutlines{ShortNeurons(i)}),C(ShortNeurons(i),:),'FaceAlpha',0, 'EdgeAlpha', 1, 'LineJoin', 'round', 'LineWidth', 1);
    end
    
       % Parse and Plot Overlay
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.DroppedNeurons, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.DroppedNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        if app.ImData.imParams.suite2p.fops.anatomical_only==1
            image(app.DroppedNeurons, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        else
            image(app.DroppedNeurons, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        end
        colormap(app.DroppedNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
        image(app.DroppedNeurons, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.DroppedNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
        image(app.DroppedNeurons, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.DroppedNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
        image(app.DroppedNeurons, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.DroppedNeurons, CDMap);
   elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
        image(app.DroppedNeurons, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.DroppedNeurons, CDMap);
    else
       f_DA_update_log(app,'Im Confused');
    end
    
end
    
hold(app.DroppedNeurons,'off');

xlim(app.DroppedNeurons,[0 ROI_bounds(1)]);
ylim(app.DroppedNeurons,[0 ROI_bounds(2)]);

app.DroppedNeurons.YDir = 'reverse';
end