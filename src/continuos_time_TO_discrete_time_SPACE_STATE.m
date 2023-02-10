%% ESTE PROGRAMA CONVIERTE DE continuos time space state 
%A discrete time space state

clc
clear 

%% MATRICES DEL TIEMPO CONTINUO

Ac = [0 1 0; 3 0 1; 0 1 0 ];
Bc= [1; 1; 3];
Cc=[0 1 0];
Dc=zeros(1,1);

%% TIEMPO DE MUESTREO
Delta_t=1;

%% CONVIERTE A DISCRETO
[Ad,Bd,Cd,Dd]=c2dm(Ac,Bc,Cc,Dc,Delta_t);

%% CALCULA MATRICES EN DISCRETO
[m1,n1]=size(Cd);
[n1,n_in]=size(Bd);

A_e=eye(n1+m1,n1+m1);
A_e(1:n1,1:n1)=Ad;
A_e(n1+1:n1+m1,1:n1)=Cd*Ad;

B_e=zeros(n1+m1,n_in);
B_e(1:n1,:)=Bd;
B_e(n1+1:n1+m1,:)=Cd*Bd;

C_e=zeros(m1,n1+m1);
C_e(:,n1+1:n1+m1)=eye(m1,m1);