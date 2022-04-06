function [BINNED_MATRIX]=cara_beaner2(matrix,bin_size)
L = length(matrix);
bin_number = L/bin_size;
BINNED_MATRIX=[];
BINNED_MATRIX{end+1} =  matrix(:,(1:bin_size));
for i = 2:bin_number
    if i<=bin_number & i~= 1
        BINNED_MATRIX{end+1} = matrix(:,(i*bin_size-bin_size+1):(i*bin_size));
        i=i+1;
    else 
        i = i+1;
    end
end
end
