function [] = plot_contour(x,y,z)
%[x,y] = meshgrid(-2:0.1:2,-2:0.1:2);
figure
hold on
grad_f=gradient(z)
d=subs(grad_f, {x,y},{0,1});
d
%surfc(x,y,z);
%contour(x,y,z);
%[px,py] = gradient(z,.2,.2);
%quiver(px,py);
%figure
%surfc(x,y,z)
end