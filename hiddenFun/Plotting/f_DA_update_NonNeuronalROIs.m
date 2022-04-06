function f_DA_update_NonNeuronalROIs(app)
% Darik ONeil 04/06/2022 Function to update RemovedROIs / Overlay

% Grab the data
nROI_contours = app.ImData.removedROIs;

% Make Colors
C = jet(size(nROI_contours.xpix,2));
C = flipud(C);

% Grab Overlay Option
CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;

%Overwrite but keep labels
%Plot
if strcmp(app.OverlayDropDown.Value,'No Overlay')
    i=1;
    fill(app.RemovedROIs,nROI_contours.xpix{i}(nROI_contours.boundaryOutlines{i}),nROI_contours.ypix{i}(nROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
    hold(app.RemovedROIs,'on');
    for i = 2:length(nROI_contours.xpix)
        fill(app.RemovedROIs,nROI_contours.xpix{i}(nROI_contours.boundaryOutlines{i}),nROI_contours.ypix{i}(nROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
    end
    hold(app.RemovedROIs,'off');
else
    %first first
    i=1;
    fill(app.RemovedROIs,nROI_contours.xpix{i}(nROI_contours.boundaryOutlines{i}),nROI_contours.ypix{i}(nROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round', 'LineWidth',1);
    hold(app.RemovedROIs,'on');
    for i = 2:length(nROI_contours.xpix)
        fill(app.RemovedROIs,nROI_contours.xpix{i}(nROI_contours.boundaryOutlines{i}),nROI_contours.ypix{i}(nROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round', 'LineWidth',1);
    end

    % Parse and Plot Overlay
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.RemovedROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        if app.ImData.imParams.suite2p.fops.anatomical_only==1
            image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        else
            image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        end
        colormap(app.RemovedROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
        image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.RemovedROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
        image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.RemovedROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
        image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.RemovedROIs, CDMap);
   elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
        image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.RemovedROIs, CDMap);
    else
       f_DA_update_log(app,'Im Confused');
    end
    hold(app.RemovedROIs,'off');
end

end
