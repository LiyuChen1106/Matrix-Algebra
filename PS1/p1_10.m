close all; clc;
%[x,y] = meshgrid(-2:0.2:2,-2:0.2:2);
x=linspace(-2,2);
y=linspace(-2,2);
origin=[0 0];
x1=[3 -1];
x2=[2;1;-5];
x3=[3;0;-1;2;2];

v1=[1 2];

figure
drawArrow = @(j,k) quiver(j(1),j(1),k(1),k(2),0);
drawArrow(origin,x1); 
hold on
y=v1(2)/v1(1)*x;
l1=plot(x,y,'g--');
hold on
A1=v1(2)/v1(1)*(x+1)+1;
l2=plot(x,A1,'b--');
legend([l1,l2],'subspace V1','affeint set A1');
hold on

proj11=1/5.*v1;
q=drawArrow(origin,proj11);
q.LineWidth=2;
q.DisplayName='projection';

axis equal
hold on