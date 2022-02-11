function [nPilROIs] = findNeuropilROIs(roi_polys)
% Function to find ROI POLYS

ROIs = roi_polys(:,1);
ROIfixed = cell(length(ROIs),5);
for i = 1:length(ROIs)
    tmpROI = ROIs{i,1};
    if isa(tmpROI,'double')
        continue
    else
        for j = 1:5
            tmpSize = size(tmpROI{j});
            if numel(tmpSize)==2
                if iscell(tmpROI{j})
                    tmpTmpROI = [];
                    for k = 1:length(tmpROI{j})
                        tmpTmpROI = [tmpTmpROI; tmpROI{j}{k}];
                    end
                    ROIfixed{i,j}=[tmpTmpROI(:,2) tmpROI{j}(:,1)];
                elseif tmpSize(1)>tmpSize(2)
                ROIfixed{i,j} = [tmpROI{j}(:,2) tmpROI{j}(:,1)];
                else
                    tmpTmpROI = transpose(tmpROI{j});
                    ROIfixed{i,j} = [tmpTmpROI(:,2) tmpTmpROI(:,1)];
                end
            elseif numel(tmpSize)==3
                if tmpSize(2)>tmpSize(3)
                    tmpTmpROI = permute(tmpROI{j},[2,3,1]);
                    ROIfixed{i,j} = [tmpTmpROI(:,2) tmpTmpROI(:,1)];
                elseif tmpSize(3)>tmpSize(2)
                    tmpTmpROI = permute(tmpROI{j},[3,2,1]);
                    ROIfixed{i,j} = [tmpTmpROI(:,2) tmpTmpROI(:,1)];
                end
            elseif numel(tmpSize)==4
                fprintf("SKIP");
            elseif isa(tmpROI{j},'double')
                fprintf("SKIP")
            else
                fprintf("CRY");
            end
        end
    end
    fprintf('\n');
    fprintf(num2str(i));
    fprintf('\n');
end
end

        