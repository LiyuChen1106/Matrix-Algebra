function [ time_pos , sq_wave , B_unnorm ] = generate_data
close all; clc;
n_comps = 30; 
period = 10; 
fundFreq = 1/ period ;
time_pos = 0:0.0001:2* period ; 
harmonics = 2*(1: n_comps ) -1;
sq_wave = floor (0.9* sin (2* pi* fundFreq * time_pos )) +.5; %% generate the signal
B_unnorm = sin (2* pi* fundFreq *( harmonics'* time_pos )) /2; %% generate the basis

figure(1)
plot(time_pos,sq_wave);
xlabel('time ops');
ylabel('sq wave');

figure(2)
basis_1 = B_unnorm(1, :);
basis_2 = B_unnorm(2, :);
basis_3 = B_unnorm(3, :);
basis_4 = B_unnorm(4, :);
basis_5 = B_unnorm(5, :);
basis_6 = B_unnorm(6, :);
basis_30 = B_unnorm(30, :);

subplot(7, 1, 1)
plot(time_pos, basis_1);
xlabel('time ops');
ylabel('sq wave');
title('1st basis vector')
axis([0 20 -1 1]);
hold on

subplot(7, 1, 2)
plot(time_pos, basis_2);
xlabel('time ops');
ylabel('sq wave');
title('2nd basis vector')
axis([0 20 -1 1]);

subplot(7, 1, 3)
plot(time_pos, basis_3);
xlabel('time ops');
ylabel('sq wave');
title('3rd basis vectors')
axis([0 20 -1 1]);
hold on

subplot(7, 1, 4)
plot(time_pos, basis_4);
xlabel('time ops');
ylabel('sq wave');
title('4th basis vectors')
axis([0 20 -1 1]);
hold on

subplot(7, 1, 5)
plot(time_pos, basis_5);
xlabel('time ops');
ylabel('sq wave');
title('5th basis vectors')
axis([0 20 -1 1]);
hold on

subplot(7, 1, 6)
plot(time_pos, basis_6);
xlabel('time ops');
ylabel('sq wave');
title('6th basis vectors')
axis([0 20 -1 1]);
hold on

subplot(7, 1, 7)
plot(time_pos, basis_30);
xlabel('time ops');
ylabel('sq wave');
title('30th basis vectors')
axis([0 20 -1 1]);
hold on

figure(2)
norm_B_unnorm=B_unnorm;
for i=1:size(B_unnorm,1)
norm_B_unnorm(i,:)=B_unnorm(i,:)/norm(B_unnorm(i,:));
end

coeff = zeros(size(B_unnorm,1),1);
for i = 1:size(B_unnorm,1)
    coeff(i,:) = dot(sq_wave,B_unnorm(i,:)/dot(B_unnorm(i,:),B_unnorm(i,:)));
end
[~,coeff_i]=sort(coeff);

approx = 0;
for i = 1:6
    [B_ind, ~] = find(coeff_i==i);
    approx = approx+ coeff(i, :) *B_unnorm(B_ind, :);
end
[B_ind, ~] = find(30);
approx = approx+ coeff(30, :) *B_unnorm(B_ind, :);

plot(time_pos, approx);
hold on
plot(time_pos, sq_wave);
xlabel('time op');
ylabel('sq wave');
title('Approximation');

end