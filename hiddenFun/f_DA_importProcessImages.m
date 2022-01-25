function [ImData] = f_DA_importProcessImages(app,procFlags,f1,f2)
%% Documentation Contents
% Darik O'Neil 01-18-2022
% Function to import and process 2P calcium imaging data and organize in a
% structure compatible for CRF generation & analysis
%
% Function modified on 01-24-2022 for app log reporting
%
% Inputs (optional):
% f1 is the filename of a suite2P matlab-export
% f2 is the filename of a Fissa matlab-export
%
% Outputs:
% ImData is a structure containing the following
% 
% fr: imaging framerate
% NeuronIndex: index of neuronal ROIs
% RemovedIndex: index of non-neuronal ROIs
% fTrace: neuropil-decontaminated traces of the form neurons x frames
% TimeStamps: timestamps for each frame
% SNR: signal-to-noise-ratios in the form neuron x 1
% ROI_bounds: image dimensions (2D)
% ROI_conoturs: a structure of ROI contours that is delightfully misspelled
%
% ROI_conoturs contains the following
%
% xpix: cells of the form ROIs x 1 containing xpixels
% ypix: cells of the form ROIs x 1 containing ypixels
% boundaryOutline: cell of the form ROIs x 1 indexing the boundaries of
% the pixels for plotting
%
% imData contains the structure of parameters imParams that are passed from
% your imported imaging files
%
% imParams parameter structure which contains three substructures
%
% suite2p is a structure of parameters from the passed suite2p file
% F: original fluorescent traces from suite2P
% Fneu: original neuropil traces from suite2P
% stat: Suite2P ROI statistics
% IC: Suite2P Neuronal ROI indexing
% fops: Suite2P options
% spks: Suite2P deconvolution (if available)
% cF: corrected Suite2P traces
% nM: neuropil multiplier
% AdcF: edge-preserving smoothed suite2P traces
%
% fissa is a structure of parameters from the optional fissa file
% info: Fissa Cell Info
% nRegions: Fissa Number of Neuropil Regions
% raw: Fissa Raw Traces (ROI/Neuropil)
% result: Fissa Demixed Traces (ROI/Neuropil)
% sep: Fissa Demixed Singal (ROI/Neuropil) before ranked-matching
% mixmat: Fissa Mixing Matrix
% roi_polys: Fissa ROI polygons (not recommended)
% alpha: Fissa alpha (sparsity regularizer)
% method: Fissa demixing method
% expansion: Fissa expansion factor to determine neuropil size
% tol: Fissa stopping tolerance
% means: Fissa block means
% cFF: Demixed Traces
% AdcFF: edge-preserving smoothed demixed traces
% rawF: raw ROI traces
% nPil: demixed neuropil traces
% rawPil: raw neuropil traces
%
% procFlags is a structure containing user-supplied parameters
% useFissa: flag to use fissa
% gradient: gradient for anisotropic diffusion
% numPeaks: number of peaks for SNR calculations
% lockout: lockout for SNR calculations
% thresholdSNR: flag to threshold SNR in ROIs --Darik 01/19/2022 not
% implemented
% Process: flag to conduct processing of traces (anisotropic diffusion &
% correct neuropil contamination)
%
% Steps
% (1, Parse Inputs)
% (2, Process ROIs)
% (3, Process Traces)
% (4, Optional Fissa Processing)
% (5, Package & Export)
%
% TO-DO
% Abstract out steps into functions to save limit caller memory-overhead

%% (1, Parse Inputs)

% first we find % import the imaging files
switch nargin
    case 2
        [file,path] = uigetfile('*.mat','Select Suite2P File');
        f1 = fullfile(path,file);
        suite2p = load(f1);
        try
            suite2p.IC = suite2p.iscell;
            clear suite2p.iscell;
        catch
            f_DA_update_log(app,'Could not locate ROI Index');
        end
        try
            suite2p.fops = suite2p.ops;
            clear suite2p.ops;
        catch
            f_DA_update_log(app,'Could not locate imaging parameters');
        end
        [imParams] = f_DA_parseImagingInfo(procFlags,suite2p);
    case 3
        suite2p = load(f1);
        try
            suite2p.IC = suite2p.iscell;
            clear suite2p.iscell;
        catch
            f_DA_update_log(app,'Could not locate ROI Index');
        end
        try
            suite2p.fops = suite2p.ops;
            clear suite2p.ops;
        catch
            f_DA_update_log(app,'Could not locate imaging parameters');
        end
        [imParams] = f_DA_parseImagingInfo(procFlags,suite2p);
    case 4
        suite2p = load(f1);
        try
            suite2p.IC = suite2p.iscell;
            clear suite2p.iscell;
        catch
            f_DA_update_log(app,'Could not locate ROI Index');
        end
        try
            suite2p.fops = suite2p.ops;
            clear suite2p.ops;
        catch
             f_DA_update_log(app,'Could not locate imaging parameters');
        end
        fissa = load(f2);
        try
             fissa.blocksize = size(fissa.result{1,1},2);
        catch
             f_DA_update_log(app,'Could not interpret fissa block size');
        end
        try
            fissa.offset = size(fissa.result{1,end},2);
        catch
            f_DA_update_log(app,'Could not interpret fissa offset size');
        end
        [imParams] = f_DA_parseImagingInfo(procFlags,suite2p,fissa);
end

f_DA_update_log(app,'Imaging Parameters Parsed & Validated');

%% (2, Process ROIs)

f_DA_update_log(app,'Processing ROIs');
% Identify current ROIs

numROIs = size(imParams.suite2p.IC(:,1),1);
NeuronIndex = (imParams.suite2p.IC(:,1)).*transpose(1:size(imParams.suite2p.IC(:,1),1));
RemovedIndex = find(NeuronIndex==0);
NeuronIndex(NeuronIndex==0)=[];


%Grab image bounds
ROI_bounds = [imParams.suite2p.fops.Lx imParams.suite2p.fops.Ly];

%Make ROI_conotours substructure
ROI_contours = struct(); %temporary
ROI_contours.xpix = cell(1,length(numROIs));
ROI_contours.ypix = cell(1,length(numROIs));
ROI_contours.boundaryOutline = cell(1,length(numROIs));
%Fill substructures
for i = 1:numROIs
    ypix = (double(imParams.suite2p.stat{(i)}.ypix)+1);%.*double(~(stat{NeuronIndex(i)}.overlap)); % grab ypixels and zero overlaps
    xpix = (double(imParams.suite2p.stat{(i)}.xpix)+1);%.*double(~(stat{NeuronIndex(i)}.overlap)); %grab xpixels and zero overlaps
    %ypix(ypix==0)=[]; %remove overlaps
    %xpix(xpix==0)=[]; %remove overlaps
    boundaryOutlines = boundary(transpose(xpix),transpose(ypix)); %generate boundary outline
    ROI_contours.xpix{i}=xpix; %store xpix
    ROI_contours.ypix{i}=ypix; %store ypix
    ROI_contours.boundaryOutlines{i}=boundaryOutlines; %store boundary outlines
end
% --Darik Removed overlaps default 01/13/2022

%correction for offsetfor i = 1:numel(NeuronIndex)
for i = 1:numROIs
    ROI_contours.xpix{i}=ROI_contours.xpix{i}-1;
    ROI_contours.ypix{i}=ROI_contours.ypix{i}-1;
    ROI_contours.boundaryOutlines{i}=ROI_contours.boundaryOutlines{i};
end

%Store non-Neuronal ROIs
removedROIs = struct();
removedROIs.xpix = cell(1,length(RemovedIndex));
removedROIs.ypix = cell(1,length(RemovedIndex));
removedROIs.boundaryOutlines=cell(1,length(RemovedIndex));

for i = 1:length(RemovedIndex)
    removedROIs.xpix{i} = ROI_contours.xpix{RemovedIndex(i)};
    removedROIs.ypix{i}  = ROI_contours.ypix{RemovedIndex(i)};
    removedROIs.boundaryOutlines{i} = ROI_contours.boundaryOutlines{RemovedIndex(i)};
end
%Store neuronal ROIs
neuronalROIs = ROI_contours;
neuronalROIs.xpix(RemovedIndex)=[];
neuronalROIs.ypix(RemovedIndex)=[];
neuronalROIs.boundaryOutlines(RemovedIndex)=[];
%
%Remove non-Neuronal ROIs
%ROI_contours.xpix(RemovedIndex)=[];
%ROI_contours.ypix(RemovedIndex)=[];
%ROI_contours.boundaryOutlines(RemovedIndex)=[];
% Indexing Changed Darik 01-21-2022

%% (3, Process Traces)

f_DA_update_log(app,'Looking at Suite2P Data');
%Grab framerate
fr = imParams.suite2p.fops.fs;
%Construct TimeStamps
TimeStamps = [(1:length(imParams.suite2p.F))]*(1/fr) ;%find timestamps by multiply frames x time per frame

f_DA_update_log(app,'Correcting Neuropil Contamination in Suite2P Data');
cF = nan(size(imParams.suite2p.F));
    for i = 1:size(cF,1)
        cF(i,:) = correct_FT(imParams.suite2p.F(i,:),imParams.suite2p.Fneu(i,:),imParams.suite2p.nM);
    end
    
if imParams.procFlags.Process
    %Pre-allocate and correct suite2p traces
    f_DA_update_log(app,'Processing Suite2P Data');
    
 
    
    f_DA_update_log(app,'Conducting Anisotropic Diffusion on Suite2P Data');
    % Conduct Edge-Preserving Smoothing on suite2p traces
    AdcF = ad(imParams.procFlags.gradient,cF,fr);
    
    % Hoist Neuronal Traces to Upper Level
    ImData.fTrace = AdcF(NeuronIndex,:);
    
    % Find SNR using findSNR function using the top 5 peaks of the fTrace
    % constrained to five to the being in seperate events using the tau of the
    % indicator
    
    f_DA_update_log(app,'Calculating SNR in Suite2P Data');
    %tau = imParams.suite2p.fops.tau;
    numPeaks = imParams.procFlags.numPeaks;
    lockout = imParams.procFlags.lockout;
    SNR = findSNR(AdcF, numPeaks, lockout);
    imParams.suite2p.SNR = SNR; %store
    imParams.suite2p.cF = cF;
    imParams.suite2p.AdcF = AdcF;
else
    f_DA_update_log(app,'Calculating SNR in Suite2P Data');
    SNR = findSNR(cF, imParams.procFlags.numPeaks, imParams.procFlags.lockout);
    imParams.suite2p.SNR = SNR; %store
    imParams.suite2p.cF = cF; %store
end

%% (4, Optional Fissa Processing)


if imParams.procFlags.useFissa
    f_DA_update_log(app,'Looking at Fissa Data');
    %extract Fissa
    [cFF, nPil, rawF, rawPil] = extractFissa(imParams.fissa.result,imParams.fissa.raw,imParams.fissa.blocksize,imParams.fissa.offset,imParams.fissa.nRegions);
    %export
       
        imParams.fissa.cFF = cFF;
        imParams.fissa.nPil = nPil;
        imParams.fissa.rawF = rawF;
        imParams.fissa.rawPil = rawPil;
        %find SNR
        f_DA_update_log(app,'Finding SNR in Fissa Data');
        %tau = imParams.suite2p.fops.tau;
        numPeaks = imParams.procFlags.numPeaks;
        lockout = imParams.procFlags.lockout;
        imParams.fissa.SNR = findSNR(cFF, numPeaks, lockout); %store
      
        
    if imParams.procFlags.Process
        f_DA_update_log(app,'Processing Fissa Data');
        %Edge-Preserving Smoothing
        f_DA_update_log(app,'Conducting Anisotropic Diffusion on Fissa Data');
        AdcFF = ad(imParams.procFlags.gradient,cFF,fr);
        %export
        imParams.fissa.AdcFF = AdcFF;
        %hoist to upper level to replace suitep
        f_DA_update_log(app,'Re-Finding SNR in Fissa Data');
        imParams.fissa.SNR = findSNR(AdcFF, numPeaks, lockout); %store
    end
end

%% (5, Package & Export)
%Now let's package it all for export from the caller memory
if imParams.procFlags.useFissa
    ImData.SNR = imParams.fissa.SNR;
else
    ImData.SNR = imParams.suite2p.SNR;
end

ImData.ROI_conoturs = ROI_contours;
ImData.removedROIs = removedROIs;
ImData.neuronalROIs = neuronalROIs;
ImData.ROI_bounds = ROI_bounds;
ImData.NeuronIndex=NeuronIndex;
ImData.RemovedIndex = RemovedIndex;
ImData.fr = fr;
ImData.TimeStamps = TimeStamps;
ImData.imParams=imParams;

end
