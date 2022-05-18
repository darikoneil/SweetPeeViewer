function f_DA_S2P_generate_Neuropil_Close(app)

app.Neuropil_Close = axes('Parent', app.SelectedROIDetails, 'Units', 'pixels',...
                'OuterPosition', [221   253   152   152], 'InnerPosition', [226.0000  258.0000  142.0000  124.1500],...
                'Box', 'on');
app.Neuropil_Close.Title.String = 'Neuropil';
app.Neuropil_Close.Title.FontName = 'Arial';
app.Neuropil_Close.Title.FontSize = 12;
app.Neuropil_Close.TitleFontWeight='bold';
app.Neuropil_Close.TitleFontSizeMultiplier=1;
app.Neuropil_Close.LabelFontSizeMultiplier=1;
app.Neuropil_Close.NextPlot = 'replacechildren';
app.Neuropil_Close.XTick=[];
app.Neuropil_Close.XTickLabel=[];
%app.Neuropil_Close.XLabel.String = 'Time (s)';
app.Neuropil_Close.YTick=[];
app.Neuropil_Close.YTickLabel=[];
%app.Neuropil_Close.YLabel.String = 'Neurons';
app.Neuropil_Close.FontName='Arial';
app.Neuropil_Close.FontSize=16;
app.Neuropil_Close.FontWeight = 'normal';
app.Neuropil_Close.ZTick=[];
app.Neuropil_Close.ZTickLabel=[];
app.Neuropil_Close.ZLabel=[];
app.Neuropil_Close.Color=[1 1 1];

end
