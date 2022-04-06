function [cF,nPil,rawF,rawPil, Sep] = extractFissa(result,raw,sep,blockSize,offset,numComponents)

%% Documentation Contents
% Darik O'Neil 1-12-2022
% Function to extract Fissa contents
[S1,S2] = size(result);

%% Function Contents

if nargin<5
    numComponents=4;
end

blockSize = [7265 7000 7000 7000 7000];
L = sum(blockSize);

cF = nan(1123,L);
rawF = cF;

%preallocate
for a = 1:S1
    runningIndex = 1;
    for b = 1:S2
        if b==1
            cF(a,1:blockSize(1))=result{a,b}(1,:);
            runningIndex = runningIndex+blockSize(1);
        elseif b>1
            cF(a,runningIndex:runningIndex+blockSize(b)-1)=result{a,b}(1,:);
            runningIndex=runningIndex+blockSize(b);
        else
            fprintf('fuck');
        end
    end
end
    

%iterate each neuron
for a = 1:S1
    runningIndex = 1;
    for b = 1:S2
        if b==1
            rawF(a,1:blockSize(1))=result{a,b}(1,:);
            runningIndex = runningIndex+blockSize(1);
        elseif b>1
            rawF(a,runningIndex:runningIndex+blockSize(b)-1)=result{a,b}(1,:);
            runningIndex=runningIndex+blockSize(b);
        else
            fprintf('fuck');
        end
    end
end

%sep neuropil
nPil = cell(4,1);
for c = 1:numComponents
    nPil{c} = nan(size(cF));
    runningIndex = 1;
    for b = 1:S2
        if b==1
            nPil{c}(a,1:blockSize(1))=result{a,b}(1,:);
            runningIndex = runningIndex+blockSize(1);
        elseif b>1
            nPil{c}(a,runningIndex:runningIndex+blockSize(b)-1)=result{a,b}(1,:);
            runningIndex=runningIndex+blockSize(b);
        else
            fprintf('fuck');
        end
    end
end

    

%raw neuropil
rawPil = cell(4,1);
for c = 1:numComponents
    rawPil{c} = nan(size(cF));
    runningIndex = 1;
    for b = 1:S2
        if b==1
            rawPil{c}(a,1:blockSize(1))=result{a,b}(1,:);
            runningIndex = runningIndex+blockSize(1);
        elseif b>1
            rawPil{c}(a,runningIndex:runningIndex+blockSize(b)-1)=result{a,b}(1,:);
            runningIndex=runningIndex+blockSize(b);
        else
            fprintf('fuck');
        end
    end
end

%unmatched
Sep = cell(4,1);
for c = 1:(numComponents)
    Sep{c} = nan(size(cF));
    runningIndex = 1;
    for b = 1:S2
        if b==1
            Sep{c}(a,1:blockSize(1))=result{a,b}(1,:);
            runningIndex = runningIndex+blockSize(1);
        elseif b>1
            Sep{c}(a,runningIndex:runningIndex+blockSize(b)-1)=result{a,b}(1,:);
            runningIndex=runningIndex+blockSize(b);
        else
            fprintf('fuck');
        end
    end
end


end


