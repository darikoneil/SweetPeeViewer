function [imParams] = f_DA_parseImagingInfo(varargin)

%% Documentation Contents
% Darik O'Neil 01-18-2022
% Function to parse imaging data for preprocessing
% 
% Steps
% (1, Construct the Parsers)
% (2, Suite2P)
% (3, Fissa)
% (4, Preprocessing flags)
% (5, Do the actual parsing)


%*Note that text is stored as type char to limit overhead* 
%-- Darik %12-13-2021

% Modified for app 01-24-2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Construct the Parser: Here we construct a parser to parse the
%provided inputs, flag if a full parameter set was passed, and initialize
%default parameters. 

%template
s2p=inputParser(); %construct
s2p.KeepUnmatched=true; %accept the garbage & toss later --Darik 01/18/2022

fp = inputParser();
fp.KeepUnmatched=true;

pp = inputParser();
pp.KeepUnmatched=true;

%% (2, Suite2P): Here we establish the interesting variables of the Suite2P imaging file
%Fluorescent Traces
addParameter(s2p,'F',@(x) isa(x,'single'));
%Neuropil Traces
addParameter(s2p,'Fneu',@(x) isa(x,'single'));
%ROI Statistics
addParameter(s2p,'stat',@(x) iscell(x));
%Neuronal Index
addParameter(s2p,'IC', @(x) isa(x,'double')); %this is iscell
%Imaging Ops
addParameter(s2p,'fops',@(x) isstruct(x)); %this is ops
%Suite2P spikes
addParameter(s2p,'spks',@(x) isa(x,'single'));
%Neuropil Multiplier
addParameter(s2p,'nM',0.7,@(x) isnumeric(x));
% I don't care about the other variables
% I don't parse or import them to save memory
% --Darik 01/18/2022
%
%% (3, Fissa): Here we establish the interesting variables of the Fissa imaging file

%cell info
addParameter(fp,'info',@(x) iscell(x));
%Number of Neuropil Subregions
addParameter(fp,'nRegions',@(x)  isa(x,'int32'));
%Raw traces for ROI and "n" neuropil components
addParameter(fp,'raw',@(x) iscell(x));
%Demixed traces for ROI and "n" neuropil components
addParameter(fp,'result',@(x) iscell(x));
%Demixed signals before match-ranking to ROI/neuropil
addParameter(fp,'sep',@(x) iscell(x));
%Mixing matrix
addParameter(fp,'mixmat',@(x) iscell(x));
%ROI Polygons of Fissa neuropil/roi
% *THESE ARE OFTEN OF ABNORMAL SHAPE AND SHOULD BE TREATED WITH CAUTION*
% --Darik 01/18/2022
addParameter(fp,'roi_polys',@(x) iscell(x));
%Fissa sparsity regularizer
addParameter(fp,'alpha',@(x) isa(x,'double'));
%Method of demixing
addParameter(fp,'method',@(x) ischar(x) && (strcmp(x,'nmf')||strcmp(x,'ICA')));
%Expansion factor for neuropil 
%* Neuropil Area = nRegions * Expansions * Area(ROI)*
% --Darik 01/18/2022
addParameter(fp,'expansion',@(x) isa(x,'double'));
%Stopping tolerance
addParameter(fp,'tol', @(x) isa(x,'double'));
%Mean Image per block
addParameter(fp,'means', @(x) isa(x,'double'));
%block size
addParameter(fp,'blocksize',7000,@(x) isnumeric(x));
%offset
addParameter(fp,'offset',79,@(x) isnumeric(x));

%
% I don't care about the other variables
% I don't parse or import them to save memory
% --Darik 01/18/2022
%
%% (4, Preprocessing Flags)
%Indicate to import Fissa
addParameter(pp,'useFissa',false,@(x) islogical(x));
%SNR threshold for ROI processing
addParameter(pp,'thresholdSNR',true,@(x) islogical(x));
%gradient threshold for anisotropic diffusion
addParameter(pp,'gradient',15,@(x) isnumeric(x)&&(x>0)&&(x<100));
%numPeaks
addParameter(pp,'numPeaks',5,@(x) isnumeric(X));
%lockout
addParameter(pp,'lockout',30,@(x) isnumeric(x));
%Flag to indicate to process the data
addParameter(pp,'Process',true,@(x) islogical(x));


%% (5, Do the actual parsing)

%parse
parse(s2p,varargin{:});
parse(fp,varargin{:});
parse(pp,varargin{:});

%send to structure
imParams.suite2p = s2p.Results;
imParams.fissa = fp.Results;
imParams.procFlags = pp.Results;
end





