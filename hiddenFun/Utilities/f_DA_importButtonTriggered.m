function f_DA_importButtonTriggered(app)
% Darik O'Neil import button trigger
% 04/06/2022

f_DA_import_parse_imaging(app);
f_DA_initialize_ROIs(app);
f_DA_update_trace_plots(app);
f_DA_update_ROIs(app);
f_DA_collect_stat_distributions(app);
f_DA_plotStatDistribution(app);
app.FilenameEditField.Value = app.suite2p_filename;
f_DA_update_log(app,'READY TO PLAY 0w0')
f_DA_adjust_overlays(app);
end
