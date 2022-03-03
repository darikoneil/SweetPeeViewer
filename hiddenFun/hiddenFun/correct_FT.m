function [cF] = correct_FT(F,Fneu,nM)
%Darik ONeil 5/31/2021
%Script to substract neuropil from traces
cF = F - (nM*Fneu);

end