function f_DA_update_ROIs(app)

%% Documentation Contents
% Darik O'Neil 01-21-2022
% Function to Update

% Selected Cell
% Neuropil of Selected Cell
% Close-Up of Selected Cell


%% Selected Cell

%cla(app.CellSelected,'reset');
set(app.CellSelected,'NextPlot','replacechildren')
%app.CellSelected.YTickLabel=[];%clear axes
%app.CellSelected.XTickLabel=[];%clear axes
%app.CellSelected.XTick=[];%clear ticks
%app.CellSelected.YTick=[];%clear ticks
%app.CellSelected.Title.String = 'ROI'; %Set Title
%app.CellSelected.Box = 'on';


% Grab
ROI_contours = app.ImData.ROI_conoturs;
ROI_bounds = app.ImData.ROI_bounds;

% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

%first first
i = 1;
fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);

hold(app.CellSelected,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
end

% Now plot the selected

v = app.SelectedCell.Value;

fill(app.CellSelected,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0.25);

hold(app.CellSelected,'off');

app.CellSelected.YDir = 'reverse';

%% Close-Up

%cla(app.UIAxes,'reset');app.CellSelected.YTickLabel=[];%clear axes
%app.UIAxes.XTickLabel=[];%clear axes
%app.UIAxes.XTick=[];%clear ticks
%app.UIAxes.YTick=[];%clear ticks
%app.UIAxes.Title.String = 'ROI'; %Set Title
%app.UIAxes.Box = 'on';
set(app.UIAxes, 'NextPlot', 'replacechildren');
% Grab
ROI_contours = app.ImData.ROI_conoturs;
ROI_bounds = app.ImData.ROI_bounds;
% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

%first first
i=1;
fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);

hold(app.UIAxes,'on');
for i = 2:length(ROI_contours.xpix)
    fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
end

% Now plot the selected

v = app.SelectedCell.Value;

fill(app.UIAxes,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0.25);

xlim(app.UIAxes,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
ylim(app.UIAxes,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);

hold(app.UIAxes,'off');

app.UIAxes.YDir = 'reverse';

%% Neuropil
 set(app.Neuropil_Close, 'NextPlot', 'replacechildren');
%if app.ImData.imParams.procFlags.useFissa
debug=1;
if debug==0
     C = [0 0.56 1.00];
     %cla(app.Neuropil_Close,'reset'); 
     %app.Neuropil_Close.XTickLabel=[];%clear axes
     %app.Neuropil_Close.YTickLabel=[];
     %app.Neuropil_Close.XTick=[];%clear ticks
     %app.Neuropil_Close.YTick=[];%clear ticks
     %app.Neuropil_Close.Title.String = 'Neuropil';    
     %app.Neuropil_Close.Box = 'on';
     
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
  
else
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
       C = [0.87 0.27 0.27];
       fill(app.Neuropil_Close,Y(neuropilBoundaries),X(neuropilBoundaries), C, 'FaceAlpha',0.25);
       hold(app.Neuropil_Close,'off');
   catch
       f_DA_update_log(app,'Suite2P did not export neuropil mask for this ROI');
       hold(app.Neuropil_Close,'off');
   end
   
end

app.Neuropil_Close.YDir = 'reverse';

%% Stats
try
app.SNREditField.Value = app.ImData.SNR(v);
catch
    f_DA_update_log(app,'SOMETHING WEIRD GOIN ON HERE...');
    f_DA_update_log(app,'NEGATIVE SIGNAL-TO-NOISE DETECTED!');
    f_DA_update_log(app,'SETTING SNR FOR THIS NEURON TO ZERO');
    app.SNREditField.Value = 0;
    app.ImData.SNR(v)=0;
    app.ImData.imParams.suite2p.SNR(v)=0;
end
app.RadiusEditField.Value = app.ImData.imParams.suite2p.stat{v}.radius;
app.SolidityEditField.Value = app.ImData.imParams.suite2p.stat{v}.solidity;
app.FootprintEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.footprint);
app.CompactnessEditField.Value = app.ImData.imParams.suite2p.stat{v}.compact;
app.CellProbabilityEditField.Value = app.ImData.imParams.suite2p.IC(v,2);
app.SkewEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.skew);
app.AspectEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.aspect_ratio);
app.TotalPixelsEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.npix);
app.SomaPixelsEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.npix_soma);
app.NormTotal_EditField.Value = double(app.ImData.imParams.suite2p.stat{v}.npix_norm_no_crop);
app.NormSoma_EditField.Value = double(app.ImData.imParams.suite2p.stat{v}.npix_norm);
app.NoiseStd_EditField.Value = double(app.ImData.imParams.suite2p.stat{v}.std);
app.SNRS2P_EditField.Value = double(max(app.ImData.imParams.suite2p.AdcF(v,:)))/double(app.ImData.imParams.suite2p.stat{v}.std);

%% Index

if ismember(v,app.ImData.NeuronIndex)
    app.Switch.Value = 'Neuron';
else
    app.Switch.Value = 'Drop';
end

end
