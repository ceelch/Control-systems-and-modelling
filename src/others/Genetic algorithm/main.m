%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% César Hernández Hernández
%
% This script minimises a function using genetic algorithms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 
clear variables
clc
close all
%%
%rng default For reproducibility
FitFcn=@myFitness;
nvar=2;
%%
opts = optimoptions(@ga, ...
                    'PopulationSize', 150, ...
                    'MaxGenerations', 200, ...
                    'EliteCount', 10, ...
                    'FunctionTolerance', 1e-8, ...
                    'PlotFcn', @gaplotbestf);
%%
rng(0, 'twister');
%[x, fval]=ga(FitFcn,nvar);
[x,fval,exitflag,output,population,scores]=ga(FitFcn,nvar,opts);