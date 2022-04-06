function f_DA_replot_CloseUp(app)

%overwrite instead of re-do
set(app.UIAxes, 'NextPlot', 'replacechildren');

% Grab
ROI_contours = app.ImData.ROI_conoturs;
ROI_bounds = app.ImData.ROI_bounds;

% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);


% Grab Overlay Option
CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;


%Plot
if strcmp(app.OverlayDropDown.Value,'No Overlay')
    i=1;
    fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
    hold(app.UIAxes,'on');
    for i = 2:length(ROI_contours.xpix)
        fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
    end
    % Now plot the selected
    v = app.SelectedCell.Value;
    fill(app.UIAxes,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0.25);
    
    %Probably not need to redo bounds but we'll be safe here
    xlim(app.UIAxes,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
    ylim(app.UIAxes,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);
    
    hold(app.UIAxes,'off');
    
    app.UIAxes.YDir = 'reverse';
else
    i=1;
    fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0,'EdgeAlpha',1, 'LineJoin','round','LineWidth',1);
    hold(app.UIAxes,'on');
    
    for i = 2:length(ROI_contours.xpix)
        fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0,'EdgeAlpha',1, 'LineJoin','round','LineWidth',1);
    end
        % Parse and Plot Overlay
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.UIAxes, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.UIAxes, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        if app.ImData.imParams.suite2p.fops.anatomical_only==1
            image(app.UIAxes, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        else
            image(app.UIAxes, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        end
        colormap(app.UIAxes, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
        image(app.UIAxes, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.UIAxes, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
        image(app.UIAxes, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.UIAxes, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
        image(app.UIAxes, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.UIAxes, CDMap);
   elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
        image(app.UIAxes, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.UIAxes, CDMap);
    else
       f_DA_update_log(app,'Im Confused');
    end
    
    % Now plot the selected
    v = app.SelectedCell.Value;
    fill(app.UIAxes,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(i,:),'FaceAlpha',0,'EdgeAlpha',1,'EdgeColor',[0.87 0.27 0.27], 'LineJoin','round','LineWidth',2);
    
    %Probably not need to redo bounds but we'll be safe here
    xlim(app.UIAxes,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
    ylim(app.UIAxes,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);
    
    hold(app.UIAxes,'off');
end
end

