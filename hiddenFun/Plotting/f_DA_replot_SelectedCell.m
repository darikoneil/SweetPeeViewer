function f_DA_replot_SelectedCell(app)
% Darik ONeil function to replot single cell 04/06/2022

% Grab the data
ROI_contours = app.ImData.ROI_conoturs;

% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

% Grab Overlay Option
CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;

%Overwrite but keep labels
set(app.CellSelected,'NextPlot','replacechildren');

%Plot
if strcmp(app.OverlayDropDown.Value,'No Overlay')
    i=1;
    %first first
    fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
    hold(app.CellSelected,'on');
    for i = 2:length(ROI_contours.xpix)
        fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
    end
    % Now plot the selected
    v = app.SelectedCell.Value;
    fill(app.CellSelected,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0.25);
    app.CellSelected.YDir = 'reverse';
    hold(app.CellSelected,'off');
else
    %first first
    i = 1;
    fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round', 'LineWidth',1);
    hold(app.CellSelected,'on');
    for i = 2:length(ROI_contours.xpix)
        fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round', 'LineWidth',1);
    end

    % Parse and Plot Overlay
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.CellSelected, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.CellSelected, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        if app.ImData.imParams.suite2p.fops.anatomical_only==1
            image(app.CellSelected, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        else
            image(app.CellSelected, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        end
        colormap(app.CellSelected, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
        image(app.CellSelected, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.CellSelected, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
        image(app.CellSelected, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.CellSelected, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
        image(app.CellSelected, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.CellSelected, CDMap);
   elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
        image(app.CellSelected, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.CellSelected, CDMap);
    else
       f_DA_update_log(app,'Im Confused');
    end
    v = app.SelectedCell.Value;
    fill(app.CellSelected,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),[0.87 0.27 0.27],'FaceAlpha',0, 'EdgeColor',[0.87 0.27 0.27], 'EdgeAlpha',1, 'LineJoin', 'round', 'LineWidth', 2);
    app.CellSelected.YDir = 'reverse';
    hold(app.CellSelected,'off');
    
    app.CellSelected.XLim=[0 app.ImData.ROI_bounds(1)];
    app.CellSelected.YLim= [0 app.ImData.ROI_bounds(2)];
end
