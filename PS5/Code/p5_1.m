
c = [0.15 0.25 0.05];
D = [70 121 65; 107 500 0; 45 40 60; 1 1 1];

cvx_begin
    variable x(3)
    cost = c*x;
    calories = D(1 ,:)*x;
    vitamin = D(2 ,:)*x;
    sugar = D(3 ,:)*x;
    serve_num = D(4 ,:)*x;

    minimize ( cost )

    subject to
        2000 <= calories <= 2250;
        5000 <= vitamin <= 10000;
        0 <= sugar <= 1000;
        0 <= serve_num <= 10;
        x >= 0;
cvx_end