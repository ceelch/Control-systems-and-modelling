clear variables
clc
close all
%%
% Parametros del sistema Masa-Resorte-Amortiguador
m=2;   %[kg]
c=10;   %[N s/m]
k=20;  %[N/m]
F=1;   %[N]
tsim=5; 
%%
sim('MRA')