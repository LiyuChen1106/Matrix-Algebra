close all; clc;

[x,y]=meshgrid(-2:0.2:3.5, -2:0.2:3.5);
f1 = 2*x+3*y+1;
f2 = x.^2+y.^2-x*y-5;
f3 = (x-5)*cos(y-5)-(y-5)*sin(x-5);
[px,py] = gradient(f1,.2,.2);


figure(1)
surf(x,y,f1)
hold on
%contour3(x,y,f1)
%grad_vec1 = subs(grad_f1,[x,y],[0,1]);
[~,h] = contour(x,y,f1,20);
h.ContourZLevel=-10;
hold on
quiver(x,y,px,py)

x0=1;
y0=0;
condition = (x == x0)&&(y == y0);
[indx,indy] = find(condition)

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
