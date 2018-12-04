clear; close all; clc

load('sparseCoding.mat')

%wavelet transform coeff matrix of M
wav_coeff = H * M * H';

% imshow(M,[])
%(c)--------------------------------------------------------------------
n = size(M,1);
subplot(1, 3, 1)
histogram(M)
title('Histogram of M')
subplot(1, 3, 2)
histogram(wav_coeff)
title('Histogram of wavlet coefficient')
subplot(1, 3, 3)
histogram(wav_coeff)
xlim([-250,250])
title('Histogram of wavlet coefficient around zero')

disp('non-zero coeff in M')
size(nonzeros(M))
disp('non-zero coeff in wavlet coefficient')
size(nonzeros(wav_coeff))