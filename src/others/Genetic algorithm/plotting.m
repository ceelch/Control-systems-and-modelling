clear variables
clc
close all
%%
x1=-5:0.1:5;
x2=-5:0.1:5;

y=100*(x1.^2-x2).^2+(1-x1).^2;
%%
figure(1)
plot3(x1,x2,y)
xlabel('x1')
ylabel('x2')
zlabel('y')
grid

