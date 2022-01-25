function [SNR] = findSNR(FluoroMat,numPeaks,lockout)

%Darik O'Neil 11//22/2021
%Function to determine SNR of calcium traces

%FluoroMat: matrix or vector of the form Neuron x Time
%numPeaks, number of peaks to consider

%Uses GetSn function from Pengcheng Zhou, Carnegie Mellon University, 2016

%% First find Peaks

%preallocate
foundPeaks = nan(1,size(FluoroMat,1));

%iterate through traces
for a = 1:size(FluoroMat,1)
    [tmp_pks,~,~,~] = findpeaks(FluoroMat(a,:),'SortStr','descend','MinPeakDistance',lockout); %find peaks, sorted
    foundPeaks(a)=mean(tmp_pks(1:numPeaks)); %take average of top numPeaks
end

%% Now Find Noise
%preallocate
noise_sd = nan(1,size(FluoroMat,10));
%iterate through traces
for b = 1:size(FluoroMat,1)
   %noise_sd(b)=GetSn(FluoroMat(b,:)); %get noise
   noise_sd(b)=std(FluoroMat(b,:));
end

%%Now calculate SNR

SNR = foundPeaks./noise_sd;

end

    

