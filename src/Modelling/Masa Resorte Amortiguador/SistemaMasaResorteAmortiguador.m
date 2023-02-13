%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% César Hernández Hernández
%
% This script makes a simulation of a damping spring mass system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
clear variables
clc
close all
%%
% damping spring mass system parameters
m=2;   %[kg]
c=10;   %[N s/m]
k=20;  %[N/m]
F=1;   %[N]
tsim=5; 
%%
sim('MRA')