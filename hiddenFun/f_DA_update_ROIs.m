function f_DA_update_ROIs(app)

%% Documentation Contents
% Darik O'Neil 01-21-2022
% Function to Update ROIs Visuals
%
% There are five different Visuals

% Selected Cell
% Neuropil of Selected Cell
% Close-Up of Selected Cell


%% Selected Cell

cla(app.CellSelected,'reset');
app.CellSelected.YTickLabel=[];%clear axes
app.CellSelected.XTickLabel=[];%clear axes
app.CellSelected.XTick=[];%clear ticks
app.CellSelected.YTick=[];%clear ticks
app.CellSelected.Title.String = 'ROI'; %Set Title
app.CellSelected.Box = 'on';


% Grab
ROI_contours = app.ImData.ROI_conoturs;
ROI_bounds = app.ImData.ROI_bounds;
% Make Colors
C = jet(size(ROI_contours.xpix,2));

hold(app.CellSelected,'on');

for i = 1:length(ROI_contours.xpix)
    fill(app.CellSelected,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
end

% Now plot the selected

v = app.SelectedCell.Value;

fill(app.CellSelected,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0.25);

xlim(app.CellSelected,[0 ROI_bounds(1)]);
ylim(app.CellSelected,[0 ROI_bounds(2)]);

hold(app.CellSelected,'off');

%% Close-Up

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
    fill(app.UIAxes,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
end

% Now plot the selected

v = app.SelectedCell.Value;

fill(app.UIAxes,ROI_contours.xpix{v}(ROI_contours.boundaryOutlines{v}),ROI_contours.ypix{v}(ROI_contours.boundaryOutlines{v}),C(v,:),'FaceAlpha',0.25);

xlim(app.UIAxes,[min(ROI_contours.xpix{v})-25 max(ROI_contours.xpix{v})+25]);
ylim(app.UIAxes,[min(ROI_contours.ypix{v})-25 max(ROI_contours.ypix{v})+25]);

hold(app.UIAxes,'off');

%% Neuropil

if app.ImData.imParams.procFlags.useFissa
    

%% Stats
app.SNREditField.Value = app.ImData.SNR(v);
app.RadiusEditField.Value = app.ImData.imParams.suite2p.stat{v}.radius;
app.SolidityEditField.Value = app.ImData.imParams.suite2p.stat{v}.solidity;
app.FootprintEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.footprint);
app.CompactnessEditField.Value = app.ImData.imParams.suite2p.stat{v}.compact;
app.CellProbabilityEditField.Value = app.ImData.imParams.suite2p.IC(v,2);
app.SkewEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.skew);
app.AspectEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.aspect_ratio);
app.TotalPixelsEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.npix);
app.SomaPixelsEditField.Value = double(app.ImData.imParams.suite2p.stat{v}.npix_soma);

%% Index

if ismember(v,app.ImData.NeuronIndex)
    app.Switch.Value = 'Neuron';
else
    app.Switch.Value = 'Drop';
end

end
