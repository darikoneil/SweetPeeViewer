function f_DA_overlay(app)

%% CELL SELECTED (PART ONE)

CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;
if strcmp(app.OverlayDropDown.Value,'No Overlay')
    f_DA_update_ROIs(app);
    f_DA_initialize_ROIs(app);
else
    cla(app.CellSelected,'reset');
    app.CellSelected.YTickLabel=[];%clear axes
    app.CellSelected.XTickLabel=[];%clear axes
    app.CellSelected.XTick=[];%clear ticks
    app.CellSelected.YTick=[];%clear ticks
    app.CellSelected.Title.String = 'ROI'; %Set Title
    app.CellSelected.Box = 'on';
    ROI_contours = app.ImData.ROI_conoturs;
    ROI_bounds = app.ImData.ROI_bounds;
    C = jet(size(ROI_contours.xpix,2));
    hold(app.CellSelected,'on');
    for i = 1:length(ROI_contours.xpix)
        fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0,'EdgeAlpha',0.25);
    end
    v = app.SelectedCell.Value;
    fill(app.CellSelected,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0,'EdgeAlpha',1, 'LineJoin', 'round', 'LineWidth', 2);
    xlim(app.CellSelected,[0 ROI_bounds(1)]);
    ylim(app.CellSelected,[0 ROI_bounds(2)]);
    
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.CellSelected, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.CellSelected, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        image(app.CellSelected, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
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
    
  hold(app.CellSelected,'off');
  
  %% NEURONAL PART TWO

CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;
if strcmp(app.OverlayDropDown.Value,'No Overlay');
    f_DA_update_ROIs(app);
    f_DA_initialize_ROIs(app);
else
  % Initialize
cla(app.NeuronalROIs,'reset');
app.NeuronalROIs.YTickLabel=[];%clear axes
app.NeuronalROIs.XTickLabel=[];%clear axes
app.NeuronalROIs.XTick=[];%clear ticks
app.NeuronalROIs.YTick=[];%clear ticks
app.NeuronalROIs.Title.String = 'Identified Neurons'; %Set Title
app.NeuronalROIs.Box = 'on';
% Grab
ROI_contours = app.ImData.neuronalROIs;
ROI_bounds = app.ImData.ROI_bounds;
% Make Colors
C = jet(size(ROI_contours.xpix,2));

% Plot them
hold(app.NeuronalROIs,'on');

for i = 1:length(ROI_contours.xpix)
    fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round', 'LineWidth',1);
end

xlim(app.NeuronalROIs,[0 ROI_bounds(1)]);
ylim(app.NeuronalROIs,[0 ROI_bounds(2)]);

    
    if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.NeuronalROIs, CDMap);
    elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        image(app.NeuronalROIs, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
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
end
  hold(app.NeuronalROIs,'off');
  
   %% NON-NEURONAL PART THREE
   
   CDataMapping = app.Scaling.Value;
   CDMap = app.CDMapDropDown.Value;
   if strcmp(app.OverlayDropDown.Value,'No Overlay')
       f_DA_update_ROIs(app);
       f_DA_initialize_ROIs(app);
   else
       cla(app.RemovedROIs,'reset');
       app.RemovedROIs.YTickLabel=[];%clear axes
       app.RemovedROIs.XTickLabel=[];%clear axes
       app.RemovedROIs.XTick=[];%clear ticks
       app.RemovedROIs.YTick=[];%clear ticks
       app.RemovedROIs.Title.String = 'Non-Neuronal ROIs'; %Set Title
       app.RemovedROIs.Box = 'on';
       %plot background
       ROI_contours = app.ImData.neuronalROIs;
       ROI_bounds = app.ImData.ROI_bounds;
       nROI_contours = app.ImData.removedROIs;
       nROI_bounds = app.ImData.ROI_bounds;
       % Make Colors
       C = jet(size(nROI_contours.xpix,2));
       % Plot them
       hold(app.RemovedROIs,'on');
       for i = 1:length(nROI_contours.xpix)
           fill(app.RemovedROIs,nROI_contours.xpix{i}(nROI_contours.boundaryOutlines{i}),nROI_contours.ypix{i}(nROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0, 'EdgeAlpha',1,'LineJoin','round','LineWidth',1);
       end
       xlim(app.RemovedROIs,[0 nROI_bounds(1)]);
       ylim(app.RemovedROIs,[0 nROI_bounds(2)]);

        if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.RemovedROIs, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        image(app.RemovedROIs, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
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
end

hold(app.RemovedROIs,'off');

  %% CLOSE-UP
  
   CDataMapping = app.Scaling.Value;
   CDMap = app.CDMapDropDown.Value;
   if strcmp(app.OverlayDropDown.Value,'No Overlay')
       f_DA_update_ROIs(app);
       f_DA_initialize_ROIs(app);
   else
       cla(app.UIAxes,'reset');app.CellSelected.YTickLabel=[];%clear axes
       app.UIAxes.XTickLabel=[];%clear axes
       app.UIAxes.XTick=[];%clear ticks
       app.UIAxes.YTick=[];%clear ticks
       app.UIAxes.Title.String = 'ROI'; %Set Title
       app.UIAxes.Box = 'on';
       % Grab
       ROI_contours = app.ImData.ROI_conoturs;
       ROI_bounds = app.ImData.ROI_bounds;
       % Make Colors
       C = jet(size(ROI_contours.xpix,2));
       hold(app.UIAxes,'on');
       for i = 1:length(ROI_contours.xpix)
           fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0,'EdgeAlpha',0.25);
       end
       % Now plot the selected
       v = app.SelectedCell.Value;
       fill(app.UIAxes,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0,'EdgeAlpha',1,'LineJoin','round','LineWidth',2);
       xlim(app.UIAxes,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
       ylim(app.UIAxes,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);
       
        if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.UIAxes, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.UIAxes, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        image(app.UIAxes, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
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
   end
        hold(app.UIAxes,'off')
        
        
         %% NEUROPIL
  
   CDataMapping = app.Scaling.Value;
   CDMap = app.CDMapDropDown.Value;
   if strcmp(app.OverlayDropDown.Value,'No Overlay')
       f_DA_update_ROIs(app);
       f_DA_initialize_ROIs(app);
   else
       cla(app.Neuropil_Close,'reset');app.CellSelected.YTickLabel=[];%clear axes
       app.Neuropil_Close.XTickLabel=[];%clear axes
       app.Neuropil_Close.XTick=[];%clear ticks
       app.Neuropil_Close.YTick=[];%clear ticks
       app.Neuropil_Close.Title.String = 'Neuropil'; %Set Title
       app.Neuropil_Close.Box = 'on';
       % Grab
       ROI_contours = app.ImData.ROI_conoturs;
       ROI_bounds = app.ImData.ROI_bounds;
       % Make Colors
       C = jet(size(ROI_contours.xpix,2));
       hold(app.Neuropil_Close,'on');
       for i = 1:length(ROI_contours.xpix)
           fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0,'EdgeAlpha',0.25);
       end
       % Now plot the selected
       v = app.SelectedCell.Value;
       fill(app.Neuropil_Close,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0,'EdgeAlpha',1,'LineJoin','round','LineWidth',2);
       xlim(app.Neuropil_Close,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
       ylim(app.Neuropil_Close,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);

        [X,Y] = f_DA_convertLinearIndexToMat(app.ImData.imParams.suite2p.fops.Lx,app.ImData.imParams.suite2p.stat{v}.neuropil_mask);
        neuropilBoundaries = boundary(double(transpose(X)),double(transpose(Y)));
        randC = randsample(length(ROI_contours), 1);
        fill(app.Neuropil_Close,Y(neuropilBoundaries),X(neuropilBoundaries), randC, 'FaceAlpha',0, 'EdgeAlpha',1, 'LineJoin','round','LineWidth',2);
    
        if strcmp(app.OverlayDropDown.Value,'Max Projection')
        image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
        colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
        image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
        colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
        image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
        image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
        image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.UIAxes, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
        image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
        colormap(app.Neuropil_Close, CDMap);
        else
        f_DA_update_log(app,'Im Confused');
        end
   end
        hold(app.Neuropil_Close,'off')
        
       
end



