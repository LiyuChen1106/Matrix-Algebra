close all; clc;

[x,y]=meshgrid(-2:0.2:3.5, -2:0.2:3.5);
f1 = 2*x+3*y+1;
f2 = x.^2+y.^2-x*y-5;
f3 = (x-5)*cos(y-5)-(y-5)*sin(x-5);

%figure(1)
%plot_contour(x,y,f1,-10);

%figure(2)
%plot_contour(x,y,f2);

%figure(1)
%plot_contour(x,y,f1,-10);


%contour3(x,y,f1)
%grad_vec1 = subs(grad_f1,[x,y],[0,1]);
[~,h] = contour(x,y,f2,25);
h.ContourZLevel=-10;
hold on

[dx,dy] = gradient(f2,.2,.2);
x0 = 1;
y0 = 0;
t = (x == x0) & (y == y0);
indt = find(t);
f_grad2 = [dx(indt) dy(indt)];
gradX = linespace(1,2);
tangentX = linespace(-1,1);

gradY = dy(indt)/dx(indt)*gradX 
%plot(xx,ylim,'b--o');
hold off;
%plot_contour(x,y,f1);

%figure(2)
%surfc(x,y,f2)
%contour3(x,y,f2)
%grad_f2 = gradient(f2,[x,y]);
%grad_vec2 = subs(grad_f2,[x,y],[0,1]);
%plot3(x,y,grad_vec2);

%figure(3)
%surfc(x,y,f3)
%contour3(x,y,f3)
