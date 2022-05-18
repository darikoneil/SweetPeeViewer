function f_DA_S2P_generate_StatDistribution(app)

app.StatDistribution = axes('Parent', app.Threshold, 'Units', 'pixels',...
                'OuterPosition', [15   155   345   227], 'InnerPosition', [35.7333  183.7333  315.7667  200.7667],...
                'Box', 'on');
%app.StatDistribution.Title.String = 'Selected ROI';
app.StatDistribution.Title.FontName = 'Arial';
app.StatDistribution.Title.FontSize = 12;
app.StatDistribution.TitleFontWeight='bold';
app.StatDistribution.TitleFontSizeMultiplier=1;
app.StatDistribution.LabelFontSizeMultiplier=1;
app.StatDistribution.NextPlot = 'replacechildren';
app.StatDistribution.XTick=[];
app.StatDistribution.XTickLabel=[];
%app.StatDistribution.XLabel.String = 'Samples';
app.StatDistribution.YTick=[];
app.StatDistribution.YTickLabel=[];
%app.StatDistribution.YLabel.String = 'Neurons';
app.StatDistribution.FontName='Arial';
app.StatDistribution.FontSize=16;
app.StatDistribution.ZTick=[];
app.StatDistribution.ZTickLabel=[];
app.StatDistribution.ZLabel=[];
app.StatDistribution.Color=[1 1 1];

end
