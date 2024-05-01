%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% César Hernández Hernández
%
% This script transform a continuous time space state to discrete time
% space state
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 
clear variables
clc
%% Continuous time matrices 
Ac = [0 1 0; 3 0 1; 0 1 0 ];
Bc= [1; 1; 3];
Cc=[0 1 0];
Dc=zeros(1,1);
%% Sample time
Delta_t=1;
%% Transform to discrete
[Ad,Bd,Cd,Dd]=c2dm(Ac,Bc,Cc,Dc,Delta_t);
%% Getting the discrete time matrices
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