function f_DA_S2P_generate_CellSelected(app)

app.CellSelected = axes('Parent', app.ROIsTab, 'Units', 'pixels',...
                'OuterPosition', [1043         330         400         400], 'InnerPosition', [1048 335 390 368.6],...
                'Box', 'on');
app.CellSelected.Title.String = 'Selected ROI';
app.CellSelected.Title.FontName = 'Arial';
app.CellSelected.Title.FontSize = 12;
app.CellSelected.TitleFontWeight='bold';
app.CellSelected.TitleFontSizeMultiplier=1;
app.CellSelected.LabelFontSizeMultiplier=1;
app.CellSelected.NextPlot = 'replacechildren';
app.CellSelected.XTick=[];
app.CellSelected.XTickLabel=[];
%app.CellSelected.XLabel.String = 'Samples';
app.CellSelected.YTick=[];
app.CellSelected.YTickLabel=[];
%app.CellSelected.YLabel.String = 'Neurons';
app.CellSelected.FontName='Arial';
app.CellSelected.FontSize=16;
app.CellSelected.ZTick=[];
app.CellSelected.ZTickLabel=[];
app.CellSelected.ZLabel=[];
app.CellSelected.Color=[1 1 1];

end
