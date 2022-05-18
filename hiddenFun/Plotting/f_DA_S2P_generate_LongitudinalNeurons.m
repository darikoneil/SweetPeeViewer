function f_DA_S2P_generate_LongitudinalNeurons(app)

app.LongitudinalNeurons = axes('Parent', app.LongitudinalRegistrationTab, 'Units', 'pixels',...
                'OuterPosition', [554   324   400   390], 'InnerPosition', [559.0000  329.0000  390.0000  359.6000],...
                'Box', 'on');
app.LongitudinalNeurons.Title.String = 'Longitudinal Neurons';
app.LongitudinalNeurons.Title.FontName = 'Arial';
app.LongitudinalNeurons.Title.FontSize = 16;
app.LongitudinalNeurons.TitleFontWeight='bold';
app.LongitudinalNeurons.TitleFontSizeMultiplier=1;
app.LongitudinalNeurons.LabelFontSizeMultiplier=1;
app.LongitudinalNeurons.NextPlot = 'replacechildren';
app.LongitudinalNeurons.XTick=[];
app.LongitudinalNeurons.XTickLabel=[];
%app.LongitudinalNeurons.XLabel.String = 'Samples';
app.LongitudinalNeurons.YTick=[];
app.LongitudinalNeurons.YTickLabel=[];
%app.LongitudinalNeurons.YLabel.String = 'Neurons';
app.LongitudinalNeurons.FontName='Arial';
app.LongitudinalNeurons.FontSize=16;
app.LongitudinalNeurons.ZTick=[];
app.LongitudinalNeurons.ZTickLabel=[];
app.LongitudinalNeurons.ZLabel=[];
app.LongitudinalNeurons.Color=[1 1 1];

end