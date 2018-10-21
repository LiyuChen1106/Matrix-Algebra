close all; clc; clear
load('/Users/liyuchen/Desktop/ECE367/Matrix-Algebra/PS1/PS01_dataSet/wordVecV.mat')
n = size(V,1);  %n
m = size(V,2);  %m

%(c)--------------------------------------------------------------------
M = zeros([n, m]); %n*m
for i = 1:n
    for j = 1:m
        if V(i,j) > 0
            M(i,j) = 1;
        end
    end
end

M_norm = M;
for i = 1:m
    M_norm(:,i) = M(:,i) / norm(M(:,i));
end

[U,S,V] = svd(M_norm);

for i = 1:10
    disp(S(i,i));
end
    
%(d)--------------------------------------------------------------------
[row_9, col_9] = find_similarity(n, m, 9, M_norm, S, U);

%(e)--------------------------------------------------------------------
sim = zeros([8,2]);

for i = 1:8
    [sim(i,1), sim(i,2)] = find_similarity(n, m, i, M_norm, S, U);
end



function [rowsOfMaxes, colsOfMaxes] = find_similarity(n, m, k, M_norm, S, U)
%M_k = M_norm(:, 1:k);
%S_k = S(1:k, 1:k);
U_k = U(:, 1:k);

proj_M_k = zeros(n,m);

for j = 1:m
    d_j = M_norm(:,j);
    for i = 1:k
        proj_M_k(:,j) = proj_M_k(:,j) + dot(d_j, U_k(:,i)) * U_k(:,i) / (norm(U_k(:,i))^2);
    end
end

sim_cosine = zeros(m,m);
for i = 1:m
    proj_i = proj_M_k(:,i);
    for j = i+1:m
        proj_j = proj_M_k(:,j);
        sim_cosine(i,j) = dot(proj_i, proj_j) / (norm(proj_i) * norm(proj_j));
    end
end

[maxValue, linearIndexesOfMaxes] = max(sim_cosine(:));
[rowsOfMaxes, colsOfMaxes] = find(sim_cosine == maxValue);
rowsOfMaxes = rowsOfMaxes(1);
colsOfMaxes = colsOfMaxes(1);
end