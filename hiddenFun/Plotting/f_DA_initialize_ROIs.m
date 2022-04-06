function f_DA_initialize_ROIs(app)

%% Documentation Contents
% Darik O'Neil 01-21-2022
% Function to Update ROIs Visuals
%
% There are five different Visuals
% Neuronal ROIs
% Non_Neuronal ROIs
% Selected Cell
% Neuropil of Selected Cell
% Close-Up of Selected Cell

%% Neuronal ROIs
% Initialize
%cla(app.NeuronalROIs,'reset');
%app.NeuronalROIs.YTickLabel=[];%clear axes
%app.NeuronalROIs.XTickLabel=[];%clear axes
%app.NeuronalROIs.XTick=[];%clear ticks
%app.NeuronalROIs.YTick=[];%clear ticks
%app.NeuronalROIs.Title.String = 'Identified Neurons'; %Set Title
%app.NeuronalROIs.Box = 'on';
set(app.NeuronalROIs, 'NextPlot', 'replacechildren');

% Grab
ROI_contours = app.ImData.neuronalROIs;
ROI_bounds = app.ImData.ROI_bounds;
% Make Colors
C = jet(size(ROI_contours.xpix,2));
C = flipud(C);

% Plot them (One first to properly use replace children feature
i = 1;
fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
  
hold(app.NeuronalROIs,'on');

for i = 2:length(ROI_contours.xpix)
    fill(app.NeuronalROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
end

xlim(app.NeuronalROIs,[0 ROI_bounds(1)]);
ylim(app.NeuronalROIs,[0 ROI_bounds(2)]);

hold(app.NeuronalROIs,'off');
app.NeuronalROIs.YDir='reverse';

%% Non-Neuronal ROIs

%cla(app.RemovedROIs,'reset');
%app.RemovedROIs.YTickLabel=[];%clear axes
%app.RemovedROIs.XTickLabel=[];%clear axes
%app.RemovedROIs.XTick=[];%clear ticks
%app.RemovedROIs.YTick=[];%clear ticks
%app.RemovedROIs.Title.String = 'Non-Neuronal ROIs'; %Set Title
%app.RemovedROIs.Box = 'on';

set(app.RemovedROIs, 'NextPlot', 'replacechildren');

%plot background
%ROI_contours = app.ImData.neuronalROIs;
%ROI_bounds = app.ImData.ROI_bounds;

% Plot them
%hold(app.RemovedROIs,'on');

%for i = 1:length(ROI_contours.xpix)
 %   fill(app.RemovedROIs,ROI_contours.xpix{i}(ROI_contours.boundaryOutlines{i}),ROI_contours.ypix{i}(ROI_contours.boundaryOutlines{i}),'w','FaceAlpha',0.25,'EdgeAlpha',0.25);
%end

%hold(app.RemovedROIs,'off');


nROI_contours = app.ImData.removedROIs;
nROI_bounds = app.ImData.ROI_bounds;

% Make Colors
C = jet(size(nROI_contours.xpix,2));
C=flipud(C);

% Plot them (again plot the first first)
i=1;
fill(app.RemovedROIs,nROI_contours.xpix{i}(nROI_contours.boundaryOutlines{i}),nROI_contours.ypix{i}(nROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);

hold(app.RemovedROIs,'on');

for i = 2:length(nROI_contours.xpix)
    fill(app.RemovedROIs,nROI_contours.xpix{i}(nROI_contours.boundaryOutlines{i}),nROI_contours.ypix{i}(nROI_contours.boundaryOutlines{i}),C(i,:),'FaceAlpha',0.25);
end

xlim(app.RemovedROIs,[0 nROI_bounds(1)]);
ylim(app.RemovedROIs,[0 nROI_bounds(2)]);

hold(app.RemovedROIs,'off');
app.RemovedROIs.YDir = 'reverse';

% Set limits of CellSelected
xlim(app.CellSelected,[0 ROI_bounds(1)]);
ylim(app.CellSelected,[0 ROI_bounds(2)]);

end
