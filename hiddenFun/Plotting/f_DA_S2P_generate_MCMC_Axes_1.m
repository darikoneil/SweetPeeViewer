function f_DA_S2P_generate_MCMC_Axes_1(app)

app.MCMC_Axes_1 = axes('Parent', app.Deconvolution, 'Units', 'pixels',...
                'OuterPosition', [430   268   956   450], 'InnerPosition', [458.8667  317.2000  915.6333  390.8000],...
                'Box', 'on');
%app.MCMC_Axes_1.Title.String = 'Dropped Neurons';
app.MCMC_Axes_1.Title.FontName = 'Arial';
app.MCMC_Axes_1.Title.FontSize = 16;
app.MCMC_Axes_1.TitleFontWeight='bold';
app.MCMC_Axes_1.TitleFontSizeMultiplier=1;
app.MCMC_Axes_1.LabelFontSizeMultiplier=1;
app.MCMC_Axes_1.NextPlot = 'replacechildren';
%app.MCMC_Axes_1.XTick=[];
%app.MCMC_Axes_1.XTickLabel=[];
app.MCMC_Axes_1.XLabel.String = 'Time (s)';
%app.MCMC_Axes_1.YTick=[];
%app.MCMC_Axes_1.YTickLabel=[];
%app.MCMC_Axes_1.YLabel.String = 'Neurons';
app.MCMC_Axes_1.FontName='Arial';
app.MCMC_Axes_1.FontSize=12;
app.MCMC_Axes_1.FontWeight='bold'
app.MCMC_Axes_1.ZTick=[];
app.MCMC_Axes_1.ZTickLabel=[];
app.MCMC_Axes_1.ZLabel=[];
app.MCMC_Axes_1.Color=[1 1 1];

end