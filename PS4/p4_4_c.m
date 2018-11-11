clear; close all; clc;

y = [1 0 0]';

A_x = [1 1;0 1];
b = [0.5 1]';

A_condition1 = [A_x^9*b, A_x^8*b, A_x^7*b, A_x^6*b, A_x^5*b, A_x^4*b, A_x^3*b, A_x^2*b, A_x^1*b, A_x^0*b];
A_condition2 = [A_condition1(1, 6:10), 0, 0, 0, 0, 0];

A = [A_condition1;A_condition2];
p_n = A'*inv(A*A')*y;
subplot(1, 4, 1)
plot(p_n)
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
title('optimal distance')

subplot(1, 4, 3)
plot(X(2, :))
title('optimal velocity')

subplot(1, 4, 4)
plot(p_n)
hold on 
plot(X(1, :))
hold on
plot(X(2, :))
title('plots together')
legend('optimal force','optimal distance', 'optimal velocity')
