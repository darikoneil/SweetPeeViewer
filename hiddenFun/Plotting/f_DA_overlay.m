function f_DA_overlay(app)

% Darik ONeil function 04/06/2022
% We must update all five ROI plots to change the overlay

% Neuronal ROIs
f_DA_update_NeuronalROIs(app);

% Non-Neuronal ROIs
f_DA_update_NonNeuronalROIs(app);

% Cell Selected
f_DA_replot_SelectedCell(app);

%Close up
f_DA_replot_CloseUp(app);

%Neuropil
f_DA_replot_NeuropilClose(app);

end



