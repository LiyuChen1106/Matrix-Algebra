close all; clc;

drawArrow = @(j,k) quiver(j(1),j(1),k(1),k(2),0);
x = [3 2]';
v0 = [-2 -4]'; % offset
v = [-2 5]'; % slope
t=linspace(-3,3);

A = v(2)/v(1)*t + v0(2)/v0(1);
figure; hold on
axis equal

drawArrow(origin,x); 
text(3,2,'x');
hold on
plot(t, A); hold on;

syms alpha;
l2_norm=sqrt((v(2)/v(1)*(t) + v0(2)/v0(1)-2).^2+(t-3).^2);
[~,ind]=min(l2_norm_sq);
drawcircle(x(1, :), x(2, :), l2_norm(ind))

function drawcircle(x,y,r)
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit, yunit);
end