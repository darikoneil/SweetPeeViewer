function [X,Y] = f_DA_convertLinearIndexToMat(Lx, Lidx)

%% Documentation Contents Darik 02/15/22
%converts linear index to pixels, used in neuropil plotting

%converts int32 to int64
%% Function Contents

%typeset
Lidx = int64(Lidx);
Lx = int64(Lx);

X = Lidx./Lx;
Y = rem(Lidx, Lx);

end

