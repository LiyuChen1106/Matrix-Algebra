%%% Example done in class
%%% Two variables : pounds purchased of meat or potatoes
%%% Cost vector c: $1 per pound mean and $0 .25 per pound potatoes
%%% Data matrix D: grams carbs / fiber / protein ( rows ) per pound meat / potatoes ( cols )
%%% Constraint vector R: daily reqirements grams carbs / fiber / protein
c = [1 0.25];
D = [40 200; 5 40; 100 20];
R = [400; 40; 200];
cvx_begin
variable x(2)
cost = c*x;
carbs = D(1 ,:)*x;
fibre = D(2 ,:)*x;
protein = D(3 ,:)*x;
minimize ( cost )
subject to
carbs >= 400;
fibre >= 40;
protein >= 200;
x >= 0;
cvx_end