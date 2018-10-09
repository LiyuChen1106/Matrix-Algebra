close all;clc;clear;

load('/Users/liyuchen/Desktop/ECE367/Matrix-Algebra/PS2/PS02_dataSet/pagerank_adj.mat')

disp('part (a)')
A = J./sum(J);
disp('Sum of all elements in A: ')
disp(sum(sum(A)))
disp('verified!')

fprintf('\npart (b)\n')
figure(1)
x1 = powerIteration(10, A);
[x1_sorted,I1] = sort(x1);

fid=fopen('/Users/liyuchen/Desktop/ECE367/Matrix-Algebra/PS2/PS02_dataSet/pagerank_urls.txt');
urls = textscan(fid,'%s','delimiter','\n');
fprintf('PI\n')
listAll(urls, I1, x1_sorted)


fprintf('\npart (c)\n')
figure(2)
fprintf('Shift-invert PI\n')
x2 = shiftInvertPI(10, A);
[x2_sorted,I2] = sort(x2);
listAll(urls, I2, x2_sorted)


figure(3)
fprintf('QR iteration\n')
x3 = rayleighQuo(10, A);
[x3_sorted,I3] = sort(x3);
listAll(urls, I3, x3_sorted)


function x = powerIteration(it, A)
    n = size(A,1);
    k = 0;
    rng(0.99);
    x = zeros([n,1]);
    x(1,:) = 1;
    e_ = zeros([1,it]);
    for i=1:it
        y_ = A * x;
        x_ = y_ / norm(y_);
        lamda_ = x_' * A * x_;
        
        k = k + 1;
        x = x_;
        
        e_(i) = norm(A * x_ - x_);
    end
    plot(1:it, log(e_));
    xlabel('k');
    ylabel('log(e(k+1))');
    title('Power Iteration');
end

function x = shiftInvertPI(it, A)
    n = size(A,1);
    k = 0;
    x = zeros([n,1]);
    x(1,:) = 1;
    sigma = 0.99;
    e_ = zeros([1,it]);
    for i=1:it
        y_ = inv(A - sigma * eye(n)) * x;
        x_ = y_ / norm(y_);
        lamda_ = x_' * A * x_;
        
        k = k + 1;
        x = x_;
        
        e_(i) = norm(A * x_ - x_);
    end
    plot(1:it, log(e_));
    xlabel('k');
    ylabel('log(e(k+1))');
    title('Shift-invert Power Iteration');
end

function x = rayleighQuo(it, A)
    n = size(A,1);
    k = 0;
    x = zeros([n,1]);
    x(1,:) = 1;
    e_ = zeros([1,it]);
    for i=1:it
        if i == 1 || i == 2
            sigma_ = 0.99;
        else
            sigma_ = (x' * A * x)/(x' * x);
        end
        y_ = inv(A - sigma_ * eye(n)) * x;
        x_ = y_ / norm(y_);
        
        k = k + 1;
        x = x_;
        
        e_(i) = norm(A * x_ - x_);
    end
    plot(1:it, log(e_));
    xlabel('k');
    ylabel('log(e(k+1))');
    title('Rayleigh Quotient Iteration');
end

function listAll(urls, I, x_sorted)
    fprintf('\nthe bottom 5 pages [index, score]\n')
    for i = 1:5
        fprintf('[%d, %f]', I(i), x_sorted(i));
        disp(urls{1}{I(i)});
    end
    
    fprintf('\nthe top 5 pages [index, score]\n')
    for j = 2571:-1:2567
        fprintf('[%d, %f]\n', I(j), x_sorted(j));
        disp(urls{1}{I(j)});
    end
end