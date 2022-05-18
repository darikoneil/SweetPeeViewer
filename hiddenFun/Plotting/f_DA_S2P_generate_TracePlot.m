function f_DA_S2P_generate_TracePlot(app)

app.TracePlot = axes('Parent', app.ROIsTab, 'Units', 'pixels',...
                'OuterPosition', [381          18        1060         307], 'InnerPosition', [409.866666666667 67.2000000000000 1019.63333333333 247.800000000000],...
                'Box', 'on');
%app.TracePlot.Title.String = 'Selected ROI';
app.TracePlot.Title.FontName = 'Arial';
app.TracePlot.Title.FontSize = 12;
app.TracePlot.TitleFontWeight='normal';
app.TracePlot.TitleFontSizeMultiplier=1.1;
app.TracePlot.LabelFontSizeMultiplier=1.1;
app.TracePlot.NextPlot = 'replacechildren';
%app.TracePlot.XTick=[];
%app.TracePlot.XTickLabel=[];
app.TracePlot.XLabel.String = 'Time (s)';
%app.TracePlot.YTick=[];
%app.TracePlot.YTickLabel=[];
%app.TracePlot.YLabel.String = 'Neurons';
app.TracePlot.FontName='Arial';
app.TracePlot.FontSize=12;
app.TracePlot.FontWeight = 'bold';
%app.TracePlot.ZTick=[];
%app.TracePlot.ZTickLabel=[];
%app.TracePlot.ZLabel=[];
app.TracePlot.Color=[1 1 1];

end
