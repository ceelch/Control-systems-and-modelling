% http:// controlautomaticoeducacion.com
 
% ____________________________________________________________________
 
%
 
clc
clear all
close all
 
p=menu('EEMPC','Con Restricciones','Sin Restricciones');
 
%Parametros de Sintonia del MPC
 
Np=20;              %Horizonte de prediccion
Nc=4;               %Horizonte de Control
lambda=1;           %Parametro de ponderacion
delta=1;            %Parametro de ponderacion
Ql=eye(Nc)*lambda;  %Matriz de Ponderacion
Qd=eye(Np)*delta;
 
%Variables de Estado caso Integrador
 
%X(k+1)=AX(k)+Bu(k) 
 
Am=[1 1;0 1];
Bm=[0.5;1];
Cm=[1 1];
 
Na=size(Am);
Om=zeros(1,Na(1)); %Numero de zeros para completar la matriz aumentada
 
%Espacio de estados
 
A=[Am Om';Cm*Am 1];
B=[Bm;Cm*Bm];
C=[Om 1];
 
%Calculo de la matriz G y vector de respuesta libre F
h(1,:)=C;       %Auxiliar para calcular G
F(1,:)=C*A;     %Calculo del vector F
for kk=2:Np
    h(kk,:)=h(kk-1,:)*A;  %Voy calculado C*A aumentando el indice de A
    F(kk,:)= F(kk-1,:)*A; %Voy aumentando el indice de A
end
v=h*B;              %Multiplico por B para obter la primera columna de G
G=zeros(Np,Nc);   %Creo la Matriz G
G(:,1)=v;         %Coloco los datos en la matriz G
for i=2:Nc
    G(:,i)=[zeros(i-1,1);v(1:Np-i+1,1)]; %Expando en toda la Matriz G
end
 
%% Loop de Control
 
%% inicializa parametros de Simulacion
nit=160;    %Numero de interacciones
inc_u=0;
u_ant(1:10) = 0;
u(1:20) = 0; ym(1:20) = 0; r(1:20) = 0;
 
% Referencia
r(5:40) = 1; r(41:80) = 3; r(81:120) = 4; r(120:nit) = 2;
 
[n,n_in]=size(B);       %Salvo la dimencion de B
xm=[0;0];               %Estados iniciales del Processo
Xf=zeros(n,1);          %Realimentacion de estados
 
for k=2:nit;
    %----------- Restriccion en la Señal de Control -----------------%
    Triang=tril(ones(Nc));  
    T=ones(Nc,1);
    u_max=0.3*ones(Nc,1);  
    u_min=-0.3*ones(Nc,1);
    %----------- Restriccion en la salida (estados) -----------------%
    x_max=5*ones(Np,1);  
    x_min=-5*ones(Np,1);
    
    
    a=[Triang; -Triang;G;-G];
    b=[u_max-T*u(k-1); T*u(k-1)-u_min;x_max-F*Xf; F*Xf-x_min];
    
    H=(G'*Qd*G+Ql);
    Fo=(F*Xf-r(k)*ones(Np,1))'*Qd*G;
    
    %Calculo del Control
    
    if p==1
    %---------------------------Con restriccion --------------------------
        options = optimset('LargeScale','off');
        [x,fval,exitflag] = quadprog(H,Fo,a,b,[],[],[],[],[],options);
        inc_u=x(1);
    end
    if p==2
    %---------------------------Sin restriccion --------------------------
        Mn=inv(H)*G'*Qd;
        K1=Mn(1,:);            %Tomo a primeira linha del incremento de control
        inc_u=K1*(r(k)-F*Xf);  %Incremento de control    
    end
    %-----------------------------------------------------------------------------------
    
    u(k)=u(k-1)+inc_u;            %Calculo de la ley de control
    xm_old=xm;                      %Guardo los estados anteriores
    xm=Am*xm+Bm*u(k);                  %Calculo los estados actuales
    ym(k)=Cm*xm;                   %Salida atual
    Xf=[xm-xm_old;ym(k)];              %Calculo los estados realimentados
end
 
nm=nit;
t = 0:T:(nm-1)*T;
figure
subplot(2,1,1)
stairs(t,r,'--k','Linewidth',2),hold on
stairs(t,ym,'-r','Linewidth',2)
xlabel('Tiempo (s)');
ylabel('Salida');
legend('y_r','y','Location','SouthEast')
grid on;
hold
subplot(2,1,2)
stairs(t,u,'b','Linewidth',2)
xlabel('Tiempo (s)');
ylabel('Control');
legend('u')
grid on;