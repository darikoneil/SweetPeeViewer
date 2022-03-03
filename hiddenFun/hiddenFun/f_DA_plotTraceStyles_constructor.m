function f_DA_plotTraceStyles_constructor(app)

% construct structure
plotTraceStyles=struct();

% construct each flag

%suite2p
plotTraceStyles.PlotF_suite2p=1;
plotTraceStyles.PlotFNeu_suite2p=0;
plotTraceStyles.PlotcF_suite2p=0;
plotTraceStyles.PlotAdcF_suite2p=0;
plotTraceStyles.PlotdFdT_suite2p=0;
plotTraceStyles.dFoF_suite2p=0;
plotTraceStyles.Decon_suite2p=0;

%Fissa
plotTraceStyles.PlotF_fissa=0;
plotTraceStyles.PlotFNeu_fissa=0;
plotTraceStyles.PlotcF_fissa=0;
plotTraceStyles.PlotAdcF_fissa=0;
plotTraceStyles.PlotdFdT_fissa=0;
plotTraceStyles.dFoF_fissa=0;
plotTraceStyles.PlotSep_fissa=0;
plotTraceStyles.PlotnPil_fissa=0;

%export
app.plotTraceStyles = plotTraceStyles;
end

