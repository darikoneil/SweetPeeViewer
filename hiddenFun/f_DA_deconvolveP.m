function f_DA_deconvolveP(app)
%% Documentation Contents
% deconvolution function

%% Function Contents

%% Grab params

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

params.g = [];
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
    traces = app.ImData.imParams.fissa.AdcFF;
    traces = double(traces); %type check
else
    traces = app.ImData.imParams.suite2p.AdcF;
    traces = double(traces); %type check
end

%% Deconv
f_DA_update_log(app,'Starting MCMC');
f_DA_update_log(app,'Check CMD for Details')

% init waitbar
N = size(app.ImData.LongNeurons,1);
LongNeurons = app.ImData.LongNeurons;
MCMC = cell(1,numel(LongNeurons));
wb = parwaitbar(N, 'BarLength', N);


parfor i = 1:N
    SAMPLES = cont_ca_sampler(traces(LongNeurons(i),:),params);
    MCMC{1,i} = SAMPLES;
    wb.progress();
end

for i = 1:numel(LongNeurons)
    app.ImData.MCMC{LongNeurons(i)}= MCMC{1,i};
end

%% Clean/Update/Record

for i = 1:N
    %f_DA_update_log(app,'New Neuron Being Deconvolved');
    f_DA_update_log(app,num2str(i));
    f_DA_calculate_decon(app,LongNeurons(i));
    f_DA_calculate_spikes(app,LongNeurons(i));
    %f_DA_update_log(app,'Moving to Next Neuron');
end


%% Done
f_DA_update_log(app,'Finished MCMC');

end



