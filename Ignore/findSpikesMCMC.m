function [spikeRaster] = findSpikesMCMC(traces,fr)

params.f = fr;
params.print_flag=0;
spikeRaster = zeros(size(traces));
pb = CmdLineProgressBar('Inferring Spikes...');
for i = 1:size(traces,1)
    pb.print(i,size(traces,1));
    tmpStructure = cont_ca_sampler(traces(i,:),params);
    tmpSpikes = tmpStructure.ss;
    accSpikes = [];
    for ii = 1:length(tmpSpikes)
        accSpikes = [accSpikes tmpSpikes{ii}];
    end
    accSpikes = unique(round(accSpikes));
    accSpikes(accSpikes==0)=[];
    %tmpSpikes = unique(round(reshape(cell2mat(tmpStructure.ss),[],1)));
    spikeRaster(i,accSpikes)=1;
end

fprintf('Finished Inferring Spikes');
end

