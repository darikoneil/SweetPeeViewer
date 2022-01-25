function f_DA_update_MCMC_plot(app)

%% Documentation Contents
% DArik O'Neil 01-25-22

%% Function Contents

% Set new Colors

 newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.9600 1.0000 0.4900
      0.6510 0.6510 0.6510];
  

%First reset 
cla(app.MCMC_Axes_1,'reset');
%cla(app.MCMC_Axes_2,'reset'); MERGED
cla(app.MCMC_Axes_3,'reset');

%grab
v = app.SelectedCell.Value;
SAMPLES = app.ImData.MCMC{v};

%% Plot Raw & Mean Traces + Spikes

plot(app.MCMC_Axes_1,app.ImData.TimeStamps,app.ImData.imParams.suite2p.AdcF(v,:),'LineWidth',2,'Color',[newcolors(1,:) 0.75]);
hold(app.MCMC_Axes_1,'on');
plot(app.MCMC_Axes_1,app.ImData.TimeStamps,app.ImData.Decon(v,:),'LineWidth',2,'Color',[newcolors(2,:) 0.75]);
hold(app.MCMC_Axes_1,'off');

%Now plot spike underlay
hold(app.MCMC_Axes_1,'on');
MinF = min(app.ImData.imParams.suite2p.AdcF(v,:));
accSpikes = app.ImData.accSpikes{v};
for i = 1:length(app.ImData.accSpikes{v})
    line(app.MCMC_Axes_1,[app.ImData.TimeStamps(accSpikes(i)) app.ImData.TimeStamps(accSpikes(i))],[0 MinF],'LineWidth',0.1,'Color',newcolors(3,:));
end
hold(app.MCMC_Axes_1,'off');
    
%% Plot Spike Raster

imagesc(app.MCMC_Axes_3,app.ImData.TimeStamps, length(SAMPLES.ns),samples_cell2mat(SAMPLES.ss,length(app.ImData.Decon(v,:))));


%% MCMC 1 Settings
%% Conserved Plot Settings
 %tighten axes
 axis(app.MCMC_Axes_1,'tight');
 axis(app.MCMC_Axes_3,'tight');
 
% if app.plotTraceStyles.normalize
 %    YData = app.TracePlot.Children.YData;
  %   for i = 1:length(YDataLine)
   %      YData(i,:)=normalize(YData(i,:),'range');
    %     app.TracePlot.Children(i).YData = YData;
    % end
    % app.TracePlot.Children.YData=YData;
 %end
 
%check for limit usage
 if app.MCMC_X.Value==1
        app.MCMC_Axes_1.XLim = [app.MCMC_X_Min.Value app.MCMC_X_Max.Value];
        app.MCMC_Axes_3.XLim =app.MCMC_Axes_1.XLim;
 end
 
 if app.MCMC_Y.Value==1
        app.MCMC_Axes_1.YLim = [app.MCMC_Y_Min.Value app.MCMC_Y_Max.Value];
        app.MCMC_Axes_3.YLim =app.MCMC_Axes_1.YLim;
 end
 
 %unbox
 app.MCMC_Axes_1.Box='off';
  app.MCMC_Axes_3.Box='off';
 %set X label
 app.MCMC_Axes_1.XLabel.String = 'Time (s)';
 app.MCMC_Axes_3.XLabel.String = 'Time (s)';
 %arrange colors
 %app.MCMC_Axes_1.ColorOrder=newcolors;
 colormap(app.MCMC_Axes_3,'turbo');
 
 app.MCMCCellEditField.Value=v;