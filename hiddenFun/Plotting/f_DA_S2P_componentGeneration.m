function f_DA_S2P_componentGeneration(app)

%ROIs Tab
f_DA_S2P_generate_NeuronalROIs(app);
f_DA_S2P_generate_RemovedROIs(app);
f_DA_S2P_generate_CellSelected(app);
f_DA_S2P_generate_TracePlot(app);
f_DA_S2P_generate_UIAxes(app);
f_DA_S2P_generate_Neuropil_Close(app);
f_DA_S2P_generate_StatDistribution(app)

%Longitudinal Registration Tab
f_DA_S2P_generate_LongitudinalNeurons(app);
f_DA_S2P_generate_DroppedNeurons(app);

%Deconvolution Tab
f_DA_S2P_generate_MCMC_Axes_1(app);
f_DA_S2P_generate_MCMC_Axes_3(app);

%Preprocessing Tab
f_DA_S2P_generate_UIAxes2(app);
end