function f_DA_S2P_generate_RemovedROIs(app)

app.RemovedROIs = axes('Parent', app.ROIsTab, 'Units', 'pixels',...
                'OuterPosition', [628   331   400   400], 'InnerPosition', [633.0000  336.0000  390.0000  368.6000],...
                'Box', 'on');
app.RemovedROIs.Title.String = 'Removed ROIs';
app.RemovedROIs.Title.FontName = 'Arial';
app.RemovedROIs.Title.FontSize = 12;
app.RemovedROIs.TitleFontWeight='bold';
app.RemovedROIs.TitleFontSizeMultiplier=1;
app.RemovedROIs.LabelFontSizeMultiplier=1;
app.RemovedROIs.NextPlot = 'replacechildren';
app.RemovedROIs.XTick=[];
app.RemovedROIs.XTickLabel=[];
%app.RemovedROIs.XLabel.String = 'Samples';
app.RemovedROIs.YTick=[];
app.RemovedROIs.YTickLabel=[];
%app.RemovedROIs.YLabel.String = 'Neurons';
app.RemovedROIs.FontName='Arial';
app.RemovedROIs.FontSize=16;
app.RemovedROIs.ZTick=[];
app.RemovedROIs.ZTickLabel=[];
app.RemovedROIs.ZLabel=[];
app.RemovedROIs.Color=[1 1 1];

end
