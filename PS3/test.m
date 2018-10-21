%% ========================= Initialization ========================
close all; clear; clc;

load('yalefaces.mat')
% imshow(M(:, :, 1)/225)

% N is number of images. 
N = size(M, 3);
% d is number of pixels.
d = 1024;
X = zeros(d, N);
sum = zeros(d, 1);

% Build up norm_X matrix. 
for i = 1:N
    E = M(:, :, i);
    X(:, i) = reshape(E, [d, 1]);
    sum = sum + X(:, i);
    mean_X = sum/N;
end

for i = 1:N
    
    norm_X(:, i) = X(:, i) - mean_X;
end

C = norm_X*norm_X';

%% ========================= Part b ===========================
[V, D] = eig(C);
count_eig = size(D, 1);
eigenvalues = zeros(count_eig, 1);
for idx = 1:count_eig
    eigenvalues(idx) = D(idx, idx);
end

[B, I] = sort(eigenvalues, 'descend');

dec_V = zeros(size(V));
dec_D = zeros(size(D));

for idx = 1: count_eig
   dec_V(:, idx) = V(:, I(idx));
   dec_D(idx, idx) = D(I(idx), I(idx));
end
log_eig = zeros(size(D, 1), 1);
for idx = 1: count_eig
    log_eig(idx, 1) = log(dec_D(idx, idx));
end

plot(log_eig);    
%% ========================= Part c===========================
figure(2)
eigenFaces = zeros(32, 32, 1024);

for i = 1:d
    dec_Vcol = dec_V(:, i);
    eigenFaces(:, :, i) = reshape(dec_Vcol, [32, 32]);
end

for i = 1: 10
    subplot(2, 10, i)
    imshow(eigenFaces(:, :, i)*15)
end
for i = 1: 10
    subplot(2, 10, i+10)
    imshow(eigenFaces(:, :, end-10+i)*15)
end

%% ========================= Part d ===========================

Y1 = zeros(size(D, 1), 30);
temp1 = norm_X(:, 1);

for idx = 1:10
    iter = 2^idx;
    for i = 1:iter
        Y1(:, idx) = Y1(:, idx) + ...
            ((dot(dec_V(:, iter), temp1))/norm(dec_V(:, iter)))*dec_V(:, iter);
    end
    Y1(:, idx) = Y1(:, idx) + mean_X;
end

temp2 = norm_X(:, 1076);
for idx = 1:10
    iter = 2^idx;
    for i = 1:iter
        Y1(:, idx+10) = Y1(:, idx+10) + ...
            ((dot(dec_V(:, iter), temp2))/norm(dec_V(:, iter)))*dec_V(:, iter);
    end
    Y1(:, idx+10) = Y1(:, idx+10) + mean_X;
end

temp3 = norm_X(:, 2043);
for idx = 1:10
    iter = 2^idx;
    for i = 1:iter
        Y1(:, idx+20) = Y1(:, idx+20) + ...
            ((dot(dec_V(:, iter), temp3))/norm(dec_V(:, iter)))*dec_V(:, iter);
    end
    Y1(:, idx+20) = Y1(:, idx+20) + mean_X;
end

projectFaces = zeros(32, 32, 30);
for i = 1:30
    ele_Y1 = Y1(:, i);
    projectFaces(:, :, i) = reshape(ele_Y1, [32, 32]);
end

figure(3)
for i = 1: 10
    subplot(3, 10, i)
    imshow(projectFaces(:, :, i)/255)
end
for i = 1: 10
    subplot(3, 10, i+10)
    imshow(projectFaces(:, :, 10+i)/255)
end
for i = 1: 10
    subplot(3, 10, i+20)
    imshow(projectFaces(:, :, 20+i)/255)
end

%% ========================== Part e ============================

coeff_matrix = zeros(25, 6);
count = 1;
for i = [1 2 7 2043 2044 2045]
    person_img = norm_X(:, i);
    for iter = 1:25
       coeff_matrix(iter, count) = dot(person_img, dec_V(:, iter))/norm(dec_V(:, iter));
    end
    count = count + 1;
end

E_distance = zeros(6, 6)
for i = 1:6
    a = coeff_matrix(:, i);
   for j = i+1:6
       b = coeff_matrix(:, j)
       E_distance(i, j) = norm(a-b, 2);
   end
    
end