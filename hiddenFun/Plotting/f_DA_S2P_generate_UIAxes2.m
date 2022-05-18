function f_DA_S2P_generate_UIAxes2(app)

app.UIAxes2 = axes('Parent', app.Preprocessing, 'Units', 'pixels',...
                'OuterPosition', [499   234   887   489], 'InnerPosition', [538.4000  269.4000  839.1000  434.3000],...
                'Box', 'on');
%app.UIAxes2.Title.String = 'Selected ROI';
app.UIAxes2.Title.FontName = 'Arial';
app.UIAxes2.Title.FontSize = 12;
app.UIAxes2.TitleFontWeight='bold';
app.UIAxes2.TitleFontSizeMultiplier=1;
app.UIAxes2.LabelFontSizeMultiplier=1;
app.UIAxes2.NextPlot = 'replacechildren';
%app.UIAxes2.XTick=[];
%app.UIAxes2.XTickLabel=[];
%app.UIAxes2.XLabel.String = 'Samples';
%app.UIAxes2.YTick=[];
%app.UIAxes2.YTickLabel=[];
%app.UIAxes2.YLabel.String = 'Neurons';
app.UIAxes2.FontName='Arial';
app.UIAxes2.FontSize=16;
app.UIAxes2.FontWeight='normal';
app.UIAxes2.ZTick=[];
app.UIAxes2.ZTickLabel=[];
app.UIAxes2.ZLabel=[];
app.UIAxes2.Color=[1 1 1];

end
