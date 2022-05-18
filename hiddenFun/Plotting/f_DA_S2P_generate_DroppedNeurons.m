function f_DA_S2P_generate_DroppedNeurons(app)

app.DroppedNeurons = axes('Parent', app.LongitudinalRegistrationTab, 'Units', 'pixels',...
                'OuterPosition', [976   326   400   390], 'InnerPosition', [981.0000  331.0000  390.0000  359.6000],...
                'Box', 'on');
app.DroppedNeurons.Title.String = 'Dropped Neurons';
app.DroppedNeurons.Title.FontName = 'Arial';
app.DroppedNeurons.Title.FontSize = 16;
app.DroppedNeurons.TitleFontWeight='bold';
app.DroppedNeurons.TitleFontSizeMultiplier=1;
app.DroppedNeurons.LabelFontSizeMultiplier=1;
app.DroppedNeurons.NextPlot = 'replacechildren';
app.DroppedNeurons.XTick=[];
app.DroppedNeurons.XTickLabel=[];
%app.DroppedNeurons.XLabel.String = 'Samples';
app.DroppedNeurons.YTick=[];
app.DroppedNeurons.YTickLabel=[];
%app.DroppedNeurons.YLabel.String = 'Neurons';
app.DroppedNeurons.FontName='Arial';
app.DroppedNeurons.FontSize=16;
app.DroppedNeurons.ZTick=[];
app.DroppedNeurons.ZTickLabel=[];
app.DroppedNeurons.ZLabel=[];
app.DroppedNeurons.Color=[1 1 1];

end