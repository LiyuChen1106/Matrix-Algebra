close all; clc;

x=linspace(-2,2);
y=linspace(-1,1);
origin=[0 0];
x1=[3 -1];
b1=[-1 1];
v1=[1 2];

figure(1)
%Draw arrow vector x1
drawArrow = @(j,k) quiver(j(1),j(1),k(1),k(2),0);
drawArrow(origin,x1); 
text(2.5,-1,'x1');
hold on
%Draw the subspace V1
y=v1(2)/v1(1)*x;
l1=plot(x,y,'g--');
hold on
%Draw the affine set A1
A1=v1(2)/v1(1)*(x+1)+1;
l2=plot(x,A1,'b--');

legend([l1,l2],'Subspace V1','Affeint set A1');
hold on

%Draw projection on V1
proj_11=1/5.*v1;
q=drawArrow(origin,proj_11);
q.LineWidth=1;
q.DisplayName='projection';
text(0.2,0.2,'Proj_v_1(x1)');
%Draw projection on A1
proj_A11=b1;
q=drawArrow(origin,proj_A11);
q.LineWidth=1;
q.DisplayName='projection';
text(-1,1,'Proj_A_1(x1)');

xlim([-2 3])
ylim([-2 2])
axis equal
hold on