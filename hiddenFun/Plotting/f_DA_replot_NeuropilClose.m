function f_DA_replot_NeuropilClose(app)

%overwrite instead of re-do
set(app.Neuropil_Close, 'NextPlot', 'replacechildren');

% Grab Overlay Option
CDataMapping = app.Scaling.Value;
CDMap = app.CDMapDropDown.Value;

ROI_contours = app.ImData.ROI_conoturs;
ROI_bounds = app.ImData.ROI_bounds;

debug=1;
%if app.ImData.imParams.procFlags.useFissa
if debug == 0
    if strcmp(app.OverlayDropDown.Value,'No Overlay')
        C = [0 0.56 1.00];
        %first first
        i=1;
        fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
        hold(app.Neuropil_Close,'on');
        for i = 2:length(ROI_contours.xpix)
            fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
        end
        v = app.SelectedCell.Value;
        fill(app.Neuropil_Close,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C,'FaceAlpha',0.25);

        xlim(app.Neuropil_Close,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
        ylim(app.Neuropil_Close,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);
        nPilROIs = f_DA_findNeuropilROIs(app.ImData.imParams.fissa.roi_polys);
        C = jet(double(100*app.ImData.imParams.fissa.nRegions));
        for i = 1:app.ImData.imParams.fissa.nRegions
            tmpROI = nPilROIs{v,1+i};
            for j = 1:length(tmpROI)
               b= boundary(tmpROI(:,1),tmpROI(:,2));
               fill(app.Neuropil_Close, tmpROI(b,1), tmpROI(b,2), [0.25 0.25 0.25], 'FaceAlpha', 0, 'EdgeAlpha',0.25, 'EdgeColor', C(i*100,:), 'LineWidth',2);
            end
        end
         v = app.SelectedCell.Value;
         fill(app.Neuropil_Close,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C,'FaceAlpha',0.25);

         xlim(app.Neuropil_Close,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
         ylim(app.Neuropil_Close,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);

         nPilROIs = f_DA_findNeuropilROIs(app.ImData.imParams.fissa.roi_polys);
         C = jet(double(100*app.ImData.imParams.fissa.nRegions));
         for i = 1:app.ImData.imParams.fissa.nRegions
             tmpROI = nPilROIs{v,1+i};
             for j = 1:length(tmpROI)
                 b= boundary(tmpROI(:,1),tmpROI(:,2));
                 fill(app.Neuropil_Close, tmpROI(b,1), tmpROI(b,2), [0.25 0.25 0.25], 'FaceAlpha', 0, 'EdgeAlpha',0.25, 'EdgeColor', C(i*100,:), 'LineWidth',2);
             end
         end
    else
        %first first
        i=1;
        fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}), 'k', 'FaceAlpha',0,'EdgeAlpha',0.75, 'LineJoin','round','LineWidth',1);
        hold(app.Neuropil_Close,'on');
        for i = 2:length(ROI_contours.xpix)
            fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'k', 'FaceAlpha',0,'EdgeAlpha',0.75, 'LineJoin','round','LineWidth',1);
        end
        v = app.SelectedCell.Value;
        fill(app.Neuropil_Close,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),'k', 'FaceAlpha',0,'EdgeAlpha',1,'EdgeColor',[0.87 0.27 0.27], 'LineJoin','round','LineWidth',2);
        
        xlim(app.Neuropil_Close,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
        ylim(app.Neuropil_Close,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);
        
        nPilROIs = f_DA_findNeuropilROIs(app.ImData.imParams.fissa.roi_polys);
        C = jet(double(100*app.ImData.imParams.fissa.nRegions));
         for i = 1:app.ImData.imParams.fissa.nRegions
            tmpROI = nPilROIs{v,1+i};
            for j = 1:length(tmpROI)
               b= boundary(tmpROI(:,1),tmpROI(:,2));
               fill(app.Neuropil_Close, tmpROI(b,1), tmpROI(b,2), [0.25 0.25 0.25], 'FaceAlpha', 0, 'EdgeAlpha',1, 'EdgeColor', [0.25 0.25 0.25], 'LineJoin', 'round', 'LineWidth',2);
            end
         end
         if strcmp(app.OverlayDropDown.Value,'Max Projection')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
            if app.ImData.imParams.suite2p.fops.anatomical_only==1
                image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
            else
                image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
            end
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        else
            f_DA_update_log(app,'Im Confused');
         end
         hold(app.Neuropil_Close,'off');
    end
else
    if strcmp(app.OverlayDropDown.Value,'No Overlay')
        %first first
         i=1;
         fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
         hold(app.Neuropil_Close,'on');
         for i = 2:length(ROI_contours.xpix)
             fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
         end

         % Now plot the selected
         v = app.SelectedCell.Value;
         C = [0 0.56 1.000];
         fill(app.Neuropil_Close,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C,'FaceAlpha',0.25);

         xlim(app.Neuropil_Close,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
         ylim(app.Neuropil_Close,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);

       % Suite2P doesn't export neuropil mask for manual ROIs
       try
           [X,Y] = f_DA_convertLinearIndexToMat(app.ImData.imParams.suite2p.fops.Lx,app.ImData.imParams.suite2p.stat{v}.neuropil_mask);
           neuropilBoundaries = boundary(double(transpose(X)),double(transpose(Y)));
           C = [0.25 0.80 0.54];
           fill(app.Neuropil_Close,Y(neuropilBoundaries),X(neuropilBoundaries), C, 'FaceAlpha',0.25, 'EdgeAlpha',0.75);
           hold(app.Neuropil_Close,'off');
       catch
           f_DA_update_log(app,'Suite2P did not export neuropil mask for this ROI');
           hold(app.Neuropil_Close,'off');
       end
    else
        i=1;
        fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0,'EdgeAlpha',1, 'LineJoin','round','LineWidth',1);
        hold(app.Neuropil_Close,'on');
        for i = 2:length(ROI_contours.xpix)
            fill(app.Neuropil_Close,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0,'EdgeAlpha',1, 'LineJoin','round','LineWidth',1);
        end
         if strcmp(app.OverlayDropDown.Value,'Max Projection')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.max_proj,'CDataMapping',CDataMapping, 'AlphaData',0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Correlation Map')
            if app.ImData.imParams.suite2p.fops.anatomical_only==1
                image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vmap, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
            else
                image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vmap{1}, 'CDataMapping',CDataMapping,'AlphaData', 0.5);
            end
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Mean Image')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.meanImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Enhanced Mean')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.meanImgE, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'Reference Image')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.refImg, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        elseif strcmp(app.OverlayDropDown.Value, 'VCorrelation')
            image(app.Neuropil_Close, app.ImData.imParams.suite2p.fops.Vcorr, 'CDataMapping',CDataMapping, 'AlphaData', 0.5);
            colormap(app.Neuropil_Close, CDMap);
        else
            f_DA_update_log(app,'Im Confused');
        end
         
        % Now plot the selected
        v = app.SelectedCell.Value;
        fill(app.Neuropil_Close,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),'w','FaceAlpha',0, 'EdgeAlpha',1,'LineJoin','round','LineWidth',2,'EdgeColor',[0.87 0.27 0.27]);

        xlim(app.Neuropil_Close,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
        ylim(app.Neuropil_Close,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);

       % Suite2P doesn't export neuropil mask for manual ROIs
        try
           [X,Y] = f_DA_convertLinearIndexToMat(app.ImData.imParams.suite2p.fops.Lx,app.ImData.imParams.suite2p.stat{v}.neuropil_mask);
           neuropilBoundaries = boundary(double(transpose(X)),double(transpose(Y)));
           C = [0.25 0.80 0.54];
           fill(app.Neuropil_Close,Y(neuropilBoundaries),X(neuropilBoundaries), C, 'FaceAlpha',0.25, 'EdgeAlpha',0.75, 'LineJoin', 'round', 'LineWidth', 2, 'EdgeColor', [0.25 0.8 0.54]);
        catch
           f_DA_update_log(app,'Suite2P did not export neuropil mask for this ROI');
        end
       hold(app.Neuropil_Close, 'off');
    end
end