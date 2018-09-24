%function [ time_pos , sq_wave , B_unnorm ] = generate_data
close all; clc;
n_comps = 30; 
period = 10; 
fundFreq = 1/ period ;
time_pos = 0:0.0001:2* period ; 
harmonics = 2*(1: n_comps ) -1;
sq_wave = floor (0.9* sin (2* pi* fundFreq * time_pos )) +.5; %% generate the signal
B_unnorm = sin (2* pi* fundFreq *( harmonics'* time_pos )) /2; %% generate the basis

%(a)
figure(1)
plot(time_pos,sq_wave);

%(b)
figure(2)

%end