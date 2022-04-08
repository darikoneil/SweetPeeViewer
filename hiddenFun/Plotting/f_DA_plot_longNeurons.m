function f_DA_plot_longNeurons(app)

% Darik ONeil function to plot longitudinal neurons 04/08/2022

set(app.LongitudinalNeurons, 'NextPlot', 'replacechildren');
ROI_contours = app.ImData.ROI_conoturs; %Let's use all so we don't have to refactor the index at the moment :(
ROI_bounds = app.ImData.ROI_bounds;

% Grab Overlay Option
CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;

C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

LongNeurons = app.ImData.LongNeurons;
i = LongNeurons(1);
if strcmp(app.OverlayDropDown.Value, 'No Overlay')
    %first first
    fill(app.LongitudinalNeurons,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
    hold(app.LongitudinalNeurons,'on');
    for i = 2:length(LongNeurons)
        fill(app.LongitudinalNeurons,ROI_contours.xpix{LongNeurons(i)}(ROI_contours.boundaryOutlines{LongNeurons(i)}),ROI_contours.ypix{LongNeurons(i)}(ROI_contours.boundaryOutlines{LongNeurons(i)}),C(LongNeurons(i),:),'FaceAlpha',0.25);
    end
else
    fill(app.LongitudinalNeurons,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha', 1, 'LineJoin', 'round', 'LineWidth', 1);
    hold(app.LongitudinalNeurons,'on');
    for i = 2:length(LongNeurons)
        fill(app.LongitudinalNeurons,ROI_contours.xpix{LongNeurons(i)}(ROI_contours.boundaryOutlines{LongNeurons(i)}),ROI_contours.ypix{LongNeurons(i)}(ROI_contours.boundaryOutlines{LongNeurons(i)}),C(LongNeurons(i),:),'FaceAlpha',0, 'EdgeAlpha', 1, 'LineJoin', 'round', 'LineWidth', 1);
    end
      % Parse and Plot Overlay
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.LongitudinalNeurons, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.LongitudinalNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        if app.ImData.imParams.suite2p.fops.anatomical_only==1
            image(app.LongitudinalNeurons, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        else
            image(app.LongitudinalNeurons, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        end
        colormap(app.LongitudinalNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
        image(app.LongitudinalNeurons, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.LongitudinalNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
        image(app.LongitudinalNeurons, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.LongitudinalNeurons, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
        image(app.LongitudinalNeurons, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.LongitudinalNeurons, CDMap);
   elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
        image(app.LongitudinalNeurons, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.LongitudinalNeurons, CDMap);
    else
       f_DA_update_log(app,'Im Confused');
    end
end

xlim(app.LongitudinalNeurons,[0 ROI_bounds(1)]);
ylim(app.LongitudinalNeurons,[0 ROI_bounds(2)]);

hold(app.LongitudinalNeurons,'off');
app.LongitudinalNeurons.YDir = 'reverse';
end