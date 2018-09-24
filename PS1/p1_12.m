close all; clc;

origin=[0 0]';
x = [3 2]';
v0 = [-2 -4]'; % offset
v = [-2 5]'; % slope
t=linspace(-3,3);

A = v(2)/v(1)*t + v0(2)/v0(1);
figure;

drawArrow = @(j,k) quiver(j(1),j(2),k(1),k(2),0);
drawArrow(origin,x); 
text(3,2,'x');
hold on
plot(t, A); hold on;

syms alpha;
l2_norm=sqrt((v(2)/v(1)*(t) + v0(2)/v0(1)-2).^2+(t-3).^2);
[~,ind]=min(l2_norm);
drawcircle(x(1, :), x(2, :), l2_norm(ind))
axis equal
hold on
y_norm2=[12/29 28/29];
plot(12/29,28/29,'x');


function drawcircle(x,y,r)
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit, yunit);
end