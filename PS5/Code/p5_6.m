clear; clc; close all;

x_bar = [1.1; 1.35; 1.25; 1.05];
SIG = [0.2 -0.2 -0.12 0.02; -0.2 1.4 0.02 0; -0.12 0.02 1 -0.4; 0.02 0 -0.4 0.2];

r = 1:0.05:1.35;

cvx_begin
    variable p(4)
    cost = p'*SIG*p;

    minimize ( cost )

    subject to
        p'*x_bar >= 1.35;
        sum(p) == 1;
        p >= 0;

cvx_end

optval = [0.0118 0.0118 0.0118 0.0275 0.1156 0.2901 0.5955 1.4000];

p_n = [0.1853 0.0313 0.2477 0.5357; 0.1853 0.0313 0.2477 0.5357; 0.1853 0.0313 0.2477 0.5357;
        0.2513 0.1224 0.2536 0.3727; 0.3550 0.2655 0.2630 0.1165; 0.2741 0.4111 0.3148 0.0000;
        0.0392 0.5587 0.4021 0.0000; 0.0000 1.0000 0.0000 0.0000];

% plot(r)
% hold on
% plot(optval)
% legend("expected return", "variance")
figure(1)
plot(r,optval)
xlabel("expected return r")
ylabel("variance (risk)")
figure(2)
bar(r,p_n,'stacked')
legend("IBM","Google","Apple","Intel") 
xlabel("expected return r")
ylabel("composition of portfolio")