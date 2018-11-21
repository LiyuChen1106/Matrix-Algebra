clear; clc; close all;
x = [0; 4; 8; 12; 16; 20; 24];

cvx_begin
    variable y(7)
    for i = 1:6
        cost(i) = norm([y(i+1) - y(i) 4]);
    end
    
    minimize ( sum(cost) )

    subject to
        3.5 <= y(2) <= 6.5;
        3 <= y(3) <= 5;
        5 <= y(4) <= 7;
        4.5 <= y(5) <= 5.5;
        6 <= y(6) <= 8;
        y(1) == 4;
        y(7) == 4;
cvx_end

disp("corresponding yi")
y
disp("Optimum value")
cvx_optval