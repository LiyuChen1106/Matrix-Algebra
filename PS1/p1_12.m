close all; clc;

origin=[0 0]';
x = [3 2]';
v0 = [-2 -4]'; % offset
v = [-2 5]'; % slope
t=linspace(-3,3);

A=-v.*t+v0;


figure(1);

%l2 norm
xlabel('x');
ylabel('y');
plot(3,2,'o');
text(3.5,2,'x');
hold on
plot(A(1,:), A(2,:));
axis equal;
l2_norm=sqrt(dot(A-x,A-x));
[~,ind2]=min(l2_norm);
drawcircle(x(1, :), x(2, :), l2_norm(ind2))
plot(A(1,ind2),A(2,ind2),'o');
text(A(1,ind2)-2,A(2,ind2),'y_(_2_)');
axis equal;
axis([-15 15 -15 15])
title('l2 norm ball');

figure(2);
%l1 norm
subplot(1,2,1);
xlabel('x');
ylabel('y');
plot(3,2,'o');
text(3.5,2,'x');
hold on
plot(A(1,:), A(2,:));
axis equal;
l1_norm=sum(abs(A-x));
[~,ind1]=min(l1_norm);
drawdiamond(x(1, :), x(2, :), l1_norm(ind1))
plot(A(1,ind1),A(2,ind1),'o');
text(A(1,ind2)-2,A(2,ind2),'y_(_2_)');
axis equal;
axis([-15 15 -15 15])
title('l1 norm ball');

%linf norm
subplot(1,2,2);
xlabel('x');
ylabel('y');
plot(3,2,'o');
text(3.5,2,'x');
hold on
plot(A(1,:), A(2,:));
axis equal;
linf_norm=max(abs(A-x));
[~,ind_inf]=min(linf_norm);
drawsquare(x(1, :), x(2, :), linf_norm(ind_inf))
plot(A(1,ind_inf),A(2,ind_inf),'o');
text(A(1,ind2)-2,A(2,ind2),'y_(_2_)');
axis equal;
axis([-15 15 -15 15])
title('linf norm ball');

function drawcircle(x,y,r)
%(x,y) -center
%r - radius
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit, yunit);
end

function drawdiamond(x,y,r)
%(x,y) -center
%r - from center to vertices
ver=[x-r y;x y-r;x+r y;x y+r];
pgon=polyshape(ver);
plot(pgon);
end

function drawsquare(x,y,r)
%(x,y) -center
%r - from center to 4 sides
ver=[x-r y+r;x-r y-r;x+r y-r;x+r y+r];
pgon=polyshape(ver);
plot(pgon);
end