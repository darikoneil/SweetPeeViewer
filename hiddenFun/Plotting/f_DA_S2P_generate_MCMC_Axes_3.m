function f_DA_S2P_generate_MCMC_Axes_3(app)

app.MCMC_Axes_3 = axes('Parent', app.Deconvolution, 'Units', 'pixels',...
                'OuterPosition', [430    16   956   225], 'InnerPosition', [458.8667   65.2000  915.6333  165.8000],...
                'Box', 'on');
%app.MCMC_Axes_3.Title.String = 'Dropped Neurons';
app.MCMC_Axes_3.Title.FontName = 'Arial';
app.MCMC_Axes_3.Title.FontSize = 16;
app.MCMC_Axes_3.TitleFontWeight='normal';
app.MCMC_Axes_3.TitleFontSizeMultiplier=1;
app.MCMC_Axes_3.LabelFontSizeMultiplier=1;
app.MCMC_Axes_3.NextPlot = 'replacechildren';
%app.MCMC_Axes_3.XTick=[];
%app.MCMC_Axes_3.XTickLabel=[];
app.MCMC_Axes_3.XLabel.String = 'Time (s)';
%app.MCMC_Axes_3.YTick=[];
%app.MCMC_Axes_3.YTickLabel=[];
%app.MCMC_Axes_3.YLabel.String = 'Neurons';
app.MCMC_Axes_3.FontName='Arial';
app.MCMC_Axes_3.FontSize=12;
app.MCMC_Axes_3.FontWeight='bold';
app.MCMC_Axes_3.ZTick=[];
app.MCMC_Axes_3.ZTickLabel=[];
app.MCMC_Axes_3.ZLabel=[];
app.MCMC_Axes_3.Color=[1 1 1];

end