function [spikeMat] = accSpikesToRaster(accSpikes,neuronIndex,totalFrames)

Spikes = accSpikes(neuronIndex);

spikeMat = zeros(length(neuronIndex), totalFrames);

for i = 1:length(neuronIndex)
    for j = 1:length(Spikes{i})
        spikeMat(i,Spikes{i}(j)) = 1;
    end
end

end

