clear; close all; clc

load('sparseCoding.mat')

wav_coeff = H * M * H';
%(d)(e)--------------------------------------------------------------------
figure(1)
disp('lambda = 30')
optimal_x(30, wav_coeff, M, H);
figure(2)
disp('lambda = 10')
optimal_x(10, wav_coeff, M, H);

function optimal_x (lambda, wav_coeff, M, H)
    X = zeros(256,256);
    for i = 1:256
        for j = 1:256
            if abs(wav_coeff(i,j)) > lambda
                X(i,j) = wav_coeff(i,j) - lambda * sign(wav_coeff(i,j));
            end
        end
    end
    
    %compression factor----------------------------------------------------
    M_hat =  H' * X * H;
    disp('non-zero coeff in M')
    size(nonzeros(M))
    disp('non-zero coeff in wavlet coefficient')
    size(nonzeros(X))
    
    disp('compression factor')
    size(nonzeros(X))/size(nonzeros(M))
    
    %MSE------------------------------------------------------------------
    MSE = 0;
    for i = 1:256
        for j = 1:256
            MSE = MSE + abs(M(i ,j) - M_hat(i, j))^2;
        end
    end
    
    MSE = 1/(256^2) * MSE;
    disp('MSE')
    MSE
    %plot-----------------------------------------------------------------
    subplot(1, 3, 1)
    imshow(M,[])
    title('image of M')
    subplot(1, 3, 2)
    imshow(M_hat, [])
    title('image of compressed M')
    subplot(1, 3, 3)
    histogram(X)
    title('Histogram of X*')
end
