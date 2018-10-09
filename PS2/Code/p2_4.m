clc; close all
A = [1 2 0 1; 0 1 1 0; 0 0 0 0];
A_null = null(A, 'r');
At_null = null(A', 'r');

B = [1 2 0 1; 0 1 1 0; 1 2 0 1];
B_null = null(B, 'r');
Bt_null = null(B', 'r');

C = [1 2 1 3; 3 4 6 9; 1 4 4 4; 1 0 10 4];
C_null = null(C, 'r');
Ct_null = null(C', 'r');
rref(C')