
x3 = [3; 0; -1; 2; 2];
b3 = [-1; 0; 1; -2; 1];

v1 = [0; 1; 2; 0; 0];
v2 = [1; 3; 0; 1; 0];
v3 = [0; 1; 5; 0; 1];

% part (d): compute the orthonormal basis and redo part (a) and (b)
subspace = [v1, v2, v3];

ortho_basis = gramschmidt(subspace);
v1_ortho = ortho_basis(:, 1);
v2_ortho = ortho_basis(:, 2);
v3_ortho = ortho_basis(:, 3);

proj_x_onV = proj_v(x3, v1_ortho) + proj_v(x3, v2_ortho) + proj_v(x3, v3_ortho);
disp('projecting onto orthonormal basis')
disp(proj_x_onV)

proj_x_onA = proj_v(x3 - b3, v1_ortho) + proj_v(x3 - b3, v2_ortho) + proj_v(x3 - b3, v3_ortho) + b3;
disp('projecting onto orthonomral affine')
disp(proj_x_onA)
    