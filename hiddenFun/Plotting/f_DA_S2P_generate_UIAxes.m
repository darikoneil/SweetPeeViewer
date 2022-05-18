function f_DA_S2P_generate_UIAxes(app)

app.UIAxes = axes('Parent', app.SelectedROIDetails, 'Units', 'pixels',...
                'OuterPosition', [32   253   152   152], 'InnerPosition', [37.0000  258.0000  142.0000  124.1500],...
                'Box', 'on');
app.UIAxes.Title.String = 'Close-Up';
app.UIAxes.Title.FontName = 'Arial';
app.UIAxes.Title.FontSize = 12;
app.UIAxes.TitleFontWeight='bold';
app.UIAxes.TitleFontSizeMultiplier=1;
app.UIAxes.LabelFontSizeMultiplier=1;
app.UIAxes.NextPlot = 'replacechildren';
app.UIAxes.XTick=[];
app.UIAxes.XTickLabel=[];
%app.UIAxes.XLabel.String = 'Time (s)';
app.UIAxes.YTick=[];
app.UIAxes.YTickLabel=[];
%app.UIAxes.YLabel.String = 'Neurons';
app.UIAxes.FontName='Arial';
app.UIAxes.FontSize=16;
app.UIAxes.FontWeight = 'normal';
app.UIAxes.ZTick=[];
app.UIAxes.ZTickLabel=[];
app.UIAxes.ZLabel=[];
app.UIAxes.Color=[1 1 1];

end
