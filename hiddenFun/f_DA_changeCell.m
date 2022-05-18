function f_DA_changeCell(app)

    
    value = app.SelectedCell.Value;
    f_DA_update_trace_plots(app);
    f_DA_update_ROIs(app);
    f_DA_overlay(app);
    Msg = ['ROI ' num2str(value) ' Now Displayed'];
    f_DA_update_log(app,Msg);
end