function [bin_averages] = binsa(BINNED_MATRIX,L);
bin_averages = [];
for i = 1:L
    if i <= L
        bin_averages = [bin_averages sum(BINNED_MATRIX{i},2)];
        i = i+1;
    else
        i=i+1;
    end
end
end