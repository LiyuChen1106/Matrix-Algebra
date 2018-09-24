close all; clc;

x=linspace(-2,2);
y=linspace(-1,1);
origin=[0;0];
x1=[3;-1];
b1=[-1;1];
v1=[1;2];

%(c)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
xlabel('x');
ylabel('y');
axis equal
hold on


%(d)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a1=[0;1;2;0;0];
a2=[1;3;0;1;0];
a3=[0;1;5;0;1];

q1=a1/norm(a1);
q2_t=a2-dot(q1,a2)*q1;
q2=q2_t/norm(q2_t);
q3_t=a3-dot(q1,a3)*q1-dot(q2,a3)*q2;
q3=q3_t/norm(q3_t);

x3=[3;0;-1;2;2];
b3=[-1;0;1;-2;1];
Q=[q1 q2 q3];
syms t1 t2 t3 t1_a t2_a t3_a;
E_V=[t1;t2;t3];
E_A=[t1;t2;t3];
for i=1:3
    E_V(i)= dot(x3,Q(:,i)) == t1*dot(Q(:,i),Q(:,1))+t2*dot(Q(:,i),Q(:,2))+t3*dot(Q(:,i),Q(:,3));
end
for i=1:3
    E_A(i)= dot(x3,Q(:,i)) == t1_a*dot(Q(:,i),Q(:,1))+t2_a*dot(Q(:,i),Q(:,2))+t3_a*dot(Q(:,i),Q(:,3))+dot(Q(:,i),b3);
end
[G_V,H_V]= equationsToMatrix(E_V, [t1,t2,t3]);
A_V= linsolve(G_V,H_V);

[G_A,H_A]= equationsToMatrix(E_A, [t1_a,t2_a,t3_a]);
A_A= linsolve(G_A,H_A);