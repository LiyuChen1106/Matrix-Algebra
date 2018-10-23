close all; clc; clear

load('yalefaces.mat')

d = 1024;
N = 2414;
% for i = 1:2414
%     J(:,i) = reshape(M(:,:,i),[1024,1]);
% end
J = reshape(M,[d,N]);

x_bar = sum(J,2)/N;

X = zeros([d,N]);

for i = 1:N
   X(:,i) = J(:,i) - x_bar; 
end

%(b)--------------------------------------------------------------------
C = X*X';
[U, lambda] = eig(C);
[U_sort, lambda_sort] = sortem(U, lambda);

lambda_j = diag(lambda_sort);
figure(1)
plot([1:d],log(lambda_j));
xlabel('j');
ylabel('log(lambda_j)')

%(c)--------------------------------------------------------------------
U_eigenfaces = zeros([32,32,d]);

for i = 1:d
    U_eigenfaces(:,:,i) = reshape(U_sort(:,i),[32,32]);
end

figure(2)

for j = 1:10
    subplot(2,10,j)
    imshow(U_eigenfaces(:,:,j)*20);
    
end
title('largest 10 eigenfaces')

for j = 1015:1024
    subplot(2,10,j-1004)
    imshow(U_eigenfaces(:,:,j)*20);
    
end
title('smallest 10 eigenfaces')

%(d)--------------------------------------------------------------------
I_i = [1, 1076, 2043];
J_j = [2^1, 2^2, 2^3, 2^4, 2^5, 2^6, 2^7, 2^8, 2^9, 2^10];
Y = zeros([d,30]);
Y_reshape = zeros([32,32,30]);

index = 1;
for i = 1:3
    x_i = X(:,I_i(i));
    for j = 1:10
        B_j_size = J_j(j);
        for k = 1:B_j_size
            Y(:,index) = Y(:,index) + dot(x_i, U_sort(:,k)) * U_sort(:,k) / (norm(U_sort(:,k))^2);
        end
        Y(:,index) = Y(:,index) + x_bar;
        index = index + 1;
    end
end

for i = 1:size(Y,2)
   Y_reshape(:,:,i) = reshape(Y(:,i),[32,32]); 
end

figure(3)
for i = 1:size(Y,2)
    subplot(3,10,i)
    imshow(Y_reshape(:,:,i) / 255);
end

%(e)--------------------------------------------------------------------
I_1_2 = [1, 2, 7, 2043, 2044, 2045];
J_1_2 = [J(:,1), J(:,2), J(:,7), J(:,2043), J(:,2044), J(:,2045)];
proj_coeff = zeros([25,6]);
distance = zeros(6,6);

for i = 1:6
   x_i = X(:,I_1_2(i));
   for j = 1:25
       proj_coeff(j,i) = dot(x_i, U_sort(:,j)) / (norm(U_sort(:,j))^2);
   end
end

for i = 1:6
    c_i = proj_coeff(:,i);
    for j = i+1:6
        c_j = proj_coeff(:,j);
        distance(i,j) = norm(c_i - c_j);
    end
end
disp(proj_coeff)
disp(distance)

function [P2,D2]=sortem(P,D)
% this function takes in two matrices P and D, presumably the output 
% from Matlab's eig function, and then sorts the columns of P to 
% match the sorted columns of D (going from largest to smallest)
% 
% EXAMPLE: 
% 
% D =
%    -90     0     0
%      0   -30     0
%      0     0   -60
% P =
%      1     2     3
%      1     2     3
%      1     2     3
% 
% [P,D]=sortem(P,D)
% P =
%      2     3     1
%      2     3     1
%      2     3     1
% D =
%    -30     0     0
%      0   -60     0
%      0     0   -90
D2=diag(sort(diag(D),'descend')); % make diagonal matrix out of sorted diagonal values of input D
[c, ind]=sort(diag(D),'descend'); % store the indices of which columns the sorted eigenvalues come from
P2=P(:,ind); % arrange the columns in this order
end 