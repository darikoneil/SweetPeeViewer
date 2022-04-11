function f_DA_deconvolve(app)
%% Documentation Contents
% deconvolution function

%% Function Contents

%% Grab params
v = app.SelectedCell.Value;
tau_r = app.RiseEditField.Value;
tau_d = app.DecayEditField.Value;
fr = app.ImData.fr;
dT = 1/(fr);
app.DtEditField.Value = dT;
p = app.AROrderEditField.Value;
B = app.BurnInEditField.Value;
%convert to discrete
[g,~] = tau_c2d(tau_r,tau_d,dT);

app.gEditField_2.Value = g(1);
app.gEditField.Value = g(2);

%params.b_1b=app.BaselineEditField.Value;
%params.A_lb=app.AmplitudeEditField.Value;

params.p = p;
params.f = fr;
params.B = B;
if app.forceTau
    if app.AROrderEditField.Value==2
        params.g = g;
    else
        params.g=g(2);
    end
else
    params.g=[];
end



if app.ImData.imParams.procFlags.useFissa
    trace = app.ImData.imParams.fissa.AdcFF(v,:);
    trace = double(trace); %type check
else
    trace = app.ImData.imParams.suite2p.AdcF(v,:);
    trace = double(trace); %type check
end

%% Deconv
f_DA_update_log(app,'Starting MCMC');
drawnow;
SAMPLES = cont_ca_sampler(trace,params);
app.ImData.MCMC{v}=SAMPLES;

%% Clean/Update/Record
f_DA_update_log(app,'Cleaning Up & Updating Records');
f_DA_calculate_decon(app,v);
f_DA_calculate_spikes(app,v);
f_DA_update_MCMC_plot(app);

%% Done
f_DA_update_log(app,'Finished MCMC');
drawnow;

end



