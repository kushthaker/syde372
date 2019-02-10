% Lab 1 Sample Date
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

% Case 1

n_a = 200;
mean_a = [5,10];
covar_a = [8,0;0,4];
[e_vecs_a, e_vals_a] = eig(covar_a);

n_b = 200;
mean_b = [10,15];
covar_b = [8,0;0,4];
[e_vecs_b, e_vals_b] = eig(covar_b);

% Case 2

n_c = 100; 
mean_c = [5, 10];
covar_c = [8, 4; 4, 40];
[e_vecs_c, e_vals_c] = eig(covar_c);

n_d = 200; 
mean_d = [15, 10];
covar_d = [8, 0; 0, 8];
[e_vecs_d, e_vals_d] = eig(covar_d);

n_e = 150; 
mean_e = [10, 5];
covar_e = [10, -5; -5, 20];
[e_vecs_e, e_vals_e] = eig(covar_e);