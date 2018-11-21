clear; clc; close all;
c = [0.15 0.25 0.05];
D = [70 121 65; 107 500 0; 45 40 60];

cvx_begin
    variable x(3)
    cost = c*x;
    calories = D(1 ,:)*x;
    vitamin = D(2 ,:)*x;
    sugar = D(3 ,:)*x;

    minimize ( cost )

    subject to
        2000 <= calories <= 2250;
        5000 <= vitamin <= 10000;
        0 <= sugar <= 1000;
        0 <= x <= 10;
cvx_end

disp("corresponding x")
x
disp("Optimum value")
cvx_optval