function f_DA_estimateLowerBounds(app)
% Darik ONeil 04/09/2022 Function to estimate lower bounds for MCMC
trace=app.ImData.imParams.suite2p.AdcF(app.SelectedCell.Value,:);
% s2ponly atm
amp_bound = 0.1*range(trace);
app.AmplitudeEditField.Value=amp_bound;

base_bound = prctile(trace,1);
app.BaselineEditField.Value=base_bound;
end