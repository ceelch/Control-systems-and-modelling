clear variables 
clc
close all 
%%
%Modelo nominal del Proceso
Ps=[tf(12.8,[16.7 1]) tf(-18.9,[21 1]);
    tf(6.6,[10.9 1]) tf(-19.4,[14.4 1])];
Ps.iodelay=[1 3;7 3];

Pz = c2d(Ps,0.5)

%Espacio de Estados
sys = ss(Ps)
A=sys.A;
B=sys.B;
C=sys.C;
D=sys.D;
%%
%Espacio de Estados Discreto
sysZ = ss(Pz)
Ad=sysZ.A;
Bd=sysZ.B;
Cd=sysZ.C;
Dd=sysZ.D;