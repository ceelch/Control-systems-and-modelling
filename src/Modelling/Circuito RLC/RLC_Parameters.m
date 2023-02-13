%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% César Hernández Hernández
%
% This script makes a simulation of a circuit RLC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
clear variables
clc
close all
%%
% RLC circuit parameters
v=5; %v
R=2; %Ohms
C= 1; %F
L= 1; %H
%%
sim('RLC_Sim')