function f_DA_calculate_spikes(app,value)
%% Documentation Contents
% DAO today
%function

v= value;
SAMPLES = app.ImData.MCMC{v};

tmpSpikes = SAMPLES.ss;
accSpikes = [];
for i = 1:length(tmpSpikes)
    accSpikes = [accSpikes tmpSpikes{i}];
end
accSpikes = unique(round(accSpikes));
accSpikes(accSpikes==0)=[];
app.ImData.accSpikes{v}=accSpikes;
end
