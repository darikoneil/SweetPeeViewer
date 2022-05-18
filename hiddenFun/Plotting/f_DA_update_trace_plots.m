function f_DA_update_trace_plots(app)

%% Documentation Contents
% Darik O'Neil 01/20/2022
% Function for plotting calcium traces

%% Initialize
numPlots = 1;

% grab flags
plotTraceStyles = app.plotTraceStyles;
% grab the cell
v = app.SelectedCell.Value;

%reset
%cla(app.TracePlot,'reset');
set(app.TracePlot, 'NextPlot','replacechildren');

%set colors
 newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.9600 1.0000 0.4900
      0.6510 0.6510 0.6510];
  
%% Suite2P Plots

if plotTraceStyles.PlotF_suite2p
    if numPlots > 1
        hold(app.TracePlot,'on');
        plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.F(v,:),'LineWidth',2);
        hold(app.TracePlot,'off');
        numPlots = numPlots+1;
    else
        plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.F(v,:),'LineWidth',2);
        numPlots = numPlots+1;
    end
end

if plotTraceStyles.PlotFNeu_suite2p
    if numPlots > 1
       hold(app.TracePlot,'on');
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.Fneu(v,:),'LineWidth',2);
       hold(app.TracePlot,'off')
       numPlots = numPlots+1;
    else
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.Fneu(v,:),'LineWidth',2);
       numPlots = numPlots+1;
    end
end

if plotTraceStyles.PlotcF_suite2p
    if numPlots > 1
       hold(app.TracePlot,'on');
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.cF(v,:),'LineWidth',2);
       hold(app.TracePlot,'off')
       numPlots = numPlots+1;
    else
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.cF(v,:),'LineWidth',2);
       numPlots=numPlots+1;
    end
end

if plotTraceStyles.PlotAdcF_suite2p
    if numPlots > 1
       hold(app.TracePlot,'on');
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.AdcF(v,:),'LineWidth',2);
       hold(app.TracePlot,'off')
       numPlots = numPlots+1;
    else
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.AdcF(v,:),'LineWidth',2);
       numPlots = numPlots+1;
    end
end

if plotTraceStyles.PlotdFdT_suite2p
    if numPlots > 1
       hold(app.TracePlot,'on');
       try
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.dFdT(v,:),'LineWidth',2);
       catch
           app.ImData.imParams.suite2p.dFdT(v,:) = [0 diff(app.ImData.imParams.suite2p.AdcF(v,:))];
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.dFdT(v,:),'LineWidth',2);
       end
       hold(app.TracePlot,'off')
       numPlots=numPlots+1;
    else
        try
            plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.dFdT(v,:),'LineWidth',2);
        catch
            app.ImData.imParams.suite2p.dFdT(v,:) = [0 diff(app.ImData.imParams.suite2p.AdcF(v,:))];
            plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.dFdT(v,:),'LineWidth',2);
        end
       numPlots=numPlots+1;
    end
end

if plotTraceStyles.dFoF_suite2p
    if numPlots >1
       hold(app.TracePlot,'on');
       %plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.suite2p.dFoF(v,:),'LineWidth',2);
       %%not implemented as of yet 01/25/2022
       hold(app.TracePlot,'off')
       numPlots=numPlots+1;
    else
        %
        numPlots=numPlots+1;
    end
end

if plotTraceStyles.Decon_suite2p
    if numPlots > 1
        try
            hold(app.TracePlot,'on');
            plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.Decon(v,:),'LineWidth',2);
            hold(app.TracePlot,'off')
        catch
            f_DA_update_log(app,'No Deconvolution Found');
        end
        numPlots=numPlots+1;
    else
        try
            plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.Decon(v,:),'LineWidth',2);
        catch
            f_DA_update_log(app, 'No Deconvolution Found');
        end
        numPlots=numPlots+1;
    end
end

%% Fissa Plots

if plotTraceStyles.PlotF_fissa
       hold(app.TracePlot,'on');
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.rawF(v,:),'LineWidth',2);
       hold(app.TracePlot,'off')
end

if plotTraceStyles.PlotFNeu_fissa
       hold(app.TracePlot,'on');
       for i = 1:app.ImData.imParams.fissa.nRegions
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.rawPil{i}(v,:),'LineWidth',2);
       end
       hold(app.TracePlot,'off')
end

if plotTraceStyles.PlotcF_fissa
       hold(app.TracePlot,'on');
       plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.cFF(v,:),'LineWidth',2);
       hold(app.TracePlot,'off')
end

if plotTraceStyles.PlotAdcF_fissa
       if numPlots >1
           hold(app.TracePlot,'on');
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.AdcFF(v,:),'LineWidth',2);
           hold(app.TracePlot,'off')
           numPlots=numPlots+1;
       else
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.AdcFF(v,:),'LineWidth',2);
           numPlots=numPlots+1;
       end
           
end

if plotTraceStyles.PlotSep_fissa
       hold(app.TracePlot,'on');
       for i = 1:app.ImData.imParams.fissa.nRegions
           plot(app.TracePlot, app.ImData.TimeStamps, app.ImData.imParams.fissa.sep{i}(v,:), 'LineWidth', 2);
       end
       hold(app.TracePlot,'off')
end

if plotTraceStyles.PlotnPil_fissa
       hold(app.TracePlot,'on');
       for i = 1:app.ImData.imParams.fissa.nRegions
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.nPil{i}(v,:),'LineWidth',2);
       end
       hold(app.TracePlot,'off')
end

if plotTraceStyles.PlotdFdT_fissa
       hold(app.TracePlot,'on');
       try
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.dFdT(v,:),'LineWidth',2);
       catch
           app.ImData.imParams.fissa.dFdT(v,:) = [0 diff(app.ImData.imParams.fissa.AdcFF(v,:))];
           plot(app.TracePlot,app.ImData.TimeStamps,app.ImData.imParams.fissa.dFdT(v,:),'LineWidth',2);
       end
       hold(app.TracePlot,'off')
end

if plotTraceStyles.dFoF_fissa
       hold(app.TracePlot,'on');
       %%not implemented as of yet 01/25/2022
       hold(app.TracePlot,'off')
end

%% Conserved Plot Settings
 %tighten axes
 axis(app.TracePlot,'tight');
 
% if app.plotTraceStyles.normalize
 %    YData = app.TracePlot.Children.YData;
  %   for i = 1:length(YDataLine)
   %      YData(i,:)=normalize(YData(i,:),'range');
    %     app.TracePlot.Children(i).YData = YData;
    % end
    % app.TracePlot.Children.YData=YData;
 %end
 
%check for limit usage
 if app.limitTracePlot_X
        app.TracePlot.XLim = [app.XLimitLower.Value app.XLimitUpper.Value];
 end
 
 if app.limitTracePlot_Y
        app.TracePlot.YLim = [app.YLimitLower.Value app.YLimitUpper.Value];
 end
 
 %unbox
 app.TracePlot.Box='off';
 %set X label
 app.TracePlot.XLabel.String = 'Time (s)';
 %arrange colors
 app.TracePlot.ColorOrder=newcolors;


end
