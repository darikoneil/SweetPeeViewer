function [fate] = f_DA_thresholdInner(threshold, operator, stats, neuron, flagger)

%inner loop for thresholding (sorry gross code)
% darik oneil's crap on 02/28/2022

%pre-allocate
fate = 0;

% shoulda used case switch oh well
if strcmp(flagger, 'SNR')
    if operator == 0 && (stats.SNR(neuron) > threshold)
        fate=1;
    else
        if stats.SNR(neuron) < threshold
            fate = 1;
        end
    end 
elseif strcmp(flagger, 'Radius')
    if operator == 0 && (stats.stat{neuron}.radius > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.radius < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Solidity')
    if operator == 0 && (stats.stat{neuron}.solidity > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.solidity < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Footprint')
    if operator ==0 && (stats.stat{neuron}.footprint > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.footprint < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Compactness')
    if operator ==0 && (stats.stat{neuron}.compact > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.compact < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Cell Probability')
    if operator == 0 && (stats.IC(neuron,2) > threshold)
        fate = 1;
    else
        if stats.IC(neuron,2) < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'SNR (S2P)')
    if operator == 0 && ((max(stats.AdcF(neuron,:))/stats.stat{neuron}.std) > threshold)
        fate = 1;
    else
        if ((max(stats.AdcF(neuron,:))/stats.stat{neuron}.std) < threshold)
            fate = 1;
        end
    end   
elseif strcmp(flagger, 'Noise (Std)')
    if operator == 0 && (stats.stat{neuron}.std > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.std < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Skew')
    if operator == 0 && (stats.stat{neuron}.skew > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.skew < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Aspect')
    if operator == 0 && (stats.stat{neuron}.aspect_ratio > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.aspect_ratio < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Total Pixels')
    if operator == 0 && (stats.stat{neuron}.npix > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.npix < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Soma Pixels')
    if operator && (stats.stat{neuron}.npix_soma > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.npix_soma < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Norm Total')
    if operator && (stats.stat{neuron}.npix_norm_no_crop > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.npix_norm_no_crop < threshold
            fate = 1;
        end
    end
elseif strcmp(flagger, 'Norm Soma')
    if operator == 0 && (stats.stat{neuron}.npix_norm > threshold)
        fate = 1;
    else
        if stats.stat{neuron}.npix_norm < threshold
            fate = 1;
        end
    end
else
    fprintf("IM CONFUSED")
end

%return the fate
end

    
    


