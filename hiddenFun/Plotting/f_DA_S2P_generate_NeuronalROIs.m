function f_DA_S2P_generate_NeuronalROIs(app)

app.NeuronalROIs = axes('Parent', app.ROIsTab, 'Units', 'pixels',...
                'OuterPosition', [213   331   400   400], 'InnerPosition', [218.0000  336.0000  390.0000  368.6000],...
                'Box', 'on');
app.NeuronalROIs.Title.String = 'Neuronal ROIs';
app.NeuronalROIs.Title.FontName = 'Arial';
app.NeuronalROIs.Title.FontSize = 12;
app.NeuronalROIs.TitleFontWeight='bold';
app.NeuronalROIs.TitleFontSizeMultiplier=1;
app.NeuronalROIs.LabelFontSizeMultiplier=1;
app.NeuronalROIs.NextPlot = 'replacechildren';
app.NeuronalROIs.XTick=[];
app.NeuronalROIs.XTickLabel=[];
%app.NeuronalROIs.XLabel.String = 'Samples';
app.NeuronalROIs.YTick=[];
app.NeuronalROIs.YTickLabel=[];
%app.NeuronalROIs.YLabel.String = 'Neurons';
app.NeuronalROIs.FontName='Arial';
app.NeuronalROIs.FontSize=16;
app.NeuronalROIs.ZTick=[];
app.NeuronalROIs.ZTickLabel=[];
app.NeuronalROIs.ZLabel=[];
app.NeuronalROIs.Color=[1 1 1];

end
