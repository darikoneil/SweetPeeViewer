function [cF,nPil,rawF,rawPil] = extractFissa(result,raw,blockSize,offset,numComponents)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to extract Fissa contents
[S1,S2] = size(result);

%% Function Contents

if nargin<5
    numComponents=4;
end

%preallocate
cF = nan(S1,(blockSize*(S2-1)+offset));
%iterate each neuron
for a = 1:S1
    %iterate each block
    for b = 1:(S2-1)
        cF(a,(1+((b-1)*blockSize)):(blockSize+((b-1)*blockSize)))=result{a,b}(1,:);
    end
    cF(a,(1+(S2-1)*blockSize):end)=result{a,S2}(1,:);
end

%preallocate

rawF = nan(S1,(blockSize*(S2-1)+offset));
%iterate each neuron
for a = 1:S1
    %iterate each block
    for b = 1:(S2-1)
        rawF(a,(1+((b-1)*blockSize)):(blockSize+((b-1)*blockSize)))=raw{a,b}(1,:);
    end
    rawF(a,(1+(S2-1)*blockSize):end)=raw{a,S2}(1,:);
end

%sep neuropil
nPil = cell(4,1);
for c = 1:numComponents
    nPil{c} = nan(S1,(blockSize*(S2-1)+offset));
    for a = 1:S1
        for b = 1:(S2-1)
            nPil{c}(a,(1+((b-1)*blockSize)):(blockSize+((b-1)*blockSize)))=result{a,b}(c+1,:);
        end
    nPil{c}(a,(1+(S2-1)*blockSize):end)=result{a,S2}(c+1,:);
    end
end

    

%raw neuropil
rawPil = cell(4,1);
for c = 1:numComponents
    rawPil{c} = nan(S1,(blockSize*(S2-1)+offset));
    for a = 1:S1
        for b = 1:(S2-1)
            rawPil{c}(a,(1+((b-1)*blockSize)):(blockSize+((b-1)*blockSize)))=raw{a,b}(c+1,:);
        end
    rawPil{c}(a,(1+(S2-1)*blockSize):end)=raw{a,S2}(c+1,:);
    end
end

end


