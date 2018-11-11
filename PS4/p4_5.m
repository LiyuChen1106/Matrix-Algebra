clear; close all; clc;
h = 50;
w = 50;
n = h * w;
m = 1950;

%(a)-----------------------------------------------------------------------
A = zeros(m,n);

for i = 1:n
    x = zeros(n,1);
    x(i) = 1;
    x_reshape = reshape(x, [h,w]);
    A(:,i) = scanImage(x_reshape);
end

figure(1)
subplot(1, 2, 1)
imshow(A,[],'InitialMagnification','fit');
subplot(1, 2, 2)
imshow(-A,[],'InitialMagnification','fit');

%(b)-----------------------------------------------------------------------
figure(2)
Y = scanImage;
[U, S, V] = svd(A);
s_diag = diag(S);
inv_s_diag = 1./s_diag;

subplot(1, 2, 1)
plot(s_diag)
xlabel('i');
ylabel('sigma_i');

r = 1300;
inv_new_S = diag(inv_s_diag(1:r));
inv_A = V(:, 1:r)*inv_new_S*U(:, 1:r)';
x_um = inv_A*Y;
M_um = reshape(x_um, [h,w]);

subplot(1, 2, 2)
imshow(M_um,[],'InitialMagnification','fit');
