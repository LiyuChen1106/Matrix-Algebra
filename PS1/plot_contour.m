function [] = plot_contour(x,y,f)
close all; clc;
%surf(x,y,f)
%hold on
%contour3(x,y,f1)
%grad_vec1 = subs(grad_f1,[x,y],[0,1]);
[~,h] = contour(x,y,f,25);
%h.ContourZLevel=shift;
hold on


[dx,dy] = gradient(f,.1,.1);
x0 = 1;
y0 = 0;
t = (x == x0) & (y == y0);
indt = find(t);
f_grad = [dx(indt) dy(indt)]
f_grad_norm = f_grad/norm(f_grad);
quiver(x0,y0,f_grad_norm(1),f_grad_norm(2));
hold on
[xx]=meshgrid(-2:0.2:3.5);
yy=(-f_grad(1).*(xx-x0)+f_grad(2).*y0)/f_grad(2);
plot(xx,yy,'b--o','linewidth',3);
hold off;
end