function f_DA_update_NeuronalROIs(app)
% Darik ONeil 04/06/2022 Function to update NeuronalROIs / Overlay

% Grab the data
ROI_contours = app.ImData.neuronalROIs;

% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

% Grab Overlay Option
CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;

%Overwrite but keep labels
set(app.NeuronalROIs,'NextPlot','replacechildren');

%Plot
if strcmp(app.OverlayDropDown.Value,'No Overlay')
    i=1;
    fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
    hold(app.NeuronalROIs,'on');
    for i = 2:length(ROI_contours.xpix)
        fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
    end
    hold(app.NeuronalROIs,'off');
else
    %first first
    i = 1;
    fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round', 'LineWidth',1);
    hold(app.NeuronalROIs,'on');
    for i = 2:length(ROI_contours.xpix)
        fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round', 'LineWidth',1);
    end

    % Parse and Plot Overlay
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.NeuronalROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        if app.ImData.imParams.suite2p.fops.anatomical_only==1
            image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        else
            image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        end
        colormap(app.NeuronalROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
        image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.NeuronalROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
        image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.NeuronalROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
        image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.NeuronalROIs, CDMap);
   elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
        image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.NeuronalROIs, CDMap);
    else
       f_DA_update_log(app,'Im Confused');
    end
    hold(app.NeuronalROIs,'off');
end

app.NeuronalROIs.XLim=[0 app.ImData.ROI_bounds(1)];
app.NeuronalROIs.YLim= [0 app.ImData.ROI_bounds(2)];

end
