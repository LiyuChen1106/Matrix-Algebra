clear; close all; clc;

y = [1 0]';

A_x = [1 1;0 1];
b = [0.5 1]';

A = [A_x^9*b, A_x^8*b, A_x^7*b, A_x^6*b, A_x^5*b, A_x^4*b, A_x^3*b, A_x^2*b, A_x^1*b, A_x^0*b];

%(a)----------------------------------------------------------------------
cvx_begin
    variables p_n_l1(10);
    objective = sum(abs(p_n_l1));

    minimize ( objective )

    subject to
        A*p_n_l1 == y;
cvx_end

figure(1)
plotforce(p_n_l1, A_x, b)

%(b)----------------------------------------------------------------------
cvx_begin
    variables p_n_linf(10);
    objective = max(abs(p_n_linf));

    minimize ( objective )

    subject to
        A*p_n_linf == y;
cvx_end

figure(2)
plotforce(p_n_linf, A_x, b)

function plotforce (p_n, A_x, b)
    subplot(1, 4, 1)
    plot(p_n)
    hold on 
    title('optimal force')

    X = zeros(2,10);
    for i = 1:10
        if i == 1
            X(:,1) = A_x*[0 0]' + b*p_n(1); 
        else
            X(:,i) = A_x*X(:,i-1) + b*p_n(i); 
        end
    end

    subplot(1, 4, 2)
    plot(X(1, :))
    hold on 
    title('optimal distance')
    subplot(1, 4, 3)
    plot(X(2, :))
    hold on 
    title('optimal velocity')
    subplot(1, 4, 4)
    plot(p_n)
    hold on 
    plot(X(1, :))
    hold on
    plot(X(2, :))
    title('plots together')
    legend('optimal force','optimal distance', 'optimal velocity')
end