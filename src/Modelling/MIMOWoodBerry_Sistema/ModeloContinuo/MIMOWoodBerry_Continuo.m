clear variables 
clc
close all 
%%
%Modelo nominal en funcion de transferencia del Proceso
Ps=[tf(12.8,[16.7 1]) tf(-18.9,[21 1]);
    tf(6.6,[10.9 1]) tf(-19.4,[14.4 1])];
Ps.iodelay=[1 3;7 3];
%%
%Modelo en Espacio de Estados
sys = ss(Ps)
A=sys.A;
B=sys.B;
C=sys.C;
D=sys.D;
%%
sim('MIMOWoodBerry.slx')