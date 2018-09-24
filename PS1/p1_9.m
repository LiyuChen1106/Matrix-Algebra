close all; clc;

[x,y]=meshgrid(-2:0.2:3.5, -2:0.2:3.5);
f1 = 2*x+3*y+1;
f2 = x.^2+y.^2-x.*y-5;
f3 = (x-5)*cos(y-5)-(y-5)*sin(x-5);

figure(1)
plotContour(x,y,f1,1);
plotContour(x,y,f2,2);
plotContour(x,y,f3,3);

figure(2)
plotTangentPlane(x,y,f1,1);

plotTangentPlane(x,y,f2,2);

plotTangentPlane(x,y,f3,3);

function plotContour(x,y,f,subPlotInd)
subplot(1,3,subPlotInd);

contour(x,y,f,21);
hold on

[dx,dy] = gradient(f,.2,.2);
x0 = 1;
y0 = 0;
t = (x == x0) & (y == y0);
indt = find(t);
%f_grad2 = [dx(indt) dy(indt)];
gradX = linspace(1,1.5);
tangentX = linspace(0.5,1.5);

gradY = dy(indt)/dx(indt)*(gradX - 1);
tangentY = -dx(indt)/dy(indt)*(tangentX - 1);
plot(gradX,gradY);
hold on
plot(tangentX,tangentY);
axis equal
xlabel('x');
ylabel('y');
hold off;
end

function plotTangentPlane(x,y,f,subPlotInd)
subplot(1,3,subPlotInd);
surf(x,y,f)
hold on

[dx,dy] = gradient(f,.2,.2);
x0 = 1;
y0 = 0;
t = (x == x0) & (y == y0);
indt = find(t);
f_grad = [dx(indt) dy(indt)];
f_plane=f(indt)+f_grad(1)*(x-1)+f_grad(2)*y;
surf(x,y,f_plane);
xlabel('x');
ylabel('y');
zlabel('z');
end
