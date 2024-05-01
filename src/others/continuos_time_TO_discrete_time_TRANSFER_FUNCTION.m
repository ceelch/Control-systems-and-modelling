%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% César Hernández Hernández
%
% This script transform a transfer function to discrete time space state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
clear variables
clc
%%
num=[1.3]
den=[13.9 1]

sysc=tf(num,den)
sysd=c2d(sysc,0.71)

