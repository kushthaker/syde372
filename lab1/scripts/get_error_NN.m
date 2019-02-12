% Lab 1 NN error 
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435
[A_ClassifyA, A_ClassifyB] = get_error(n_a, KNN(samples_a, samples_b, samples_a(:,1), samples_a(:,2), 1), @(d) d < 0);
[B_ClassifyB, B_ClassifyA] = get_error(n_b, KNN(samples_a, samples_b, samples_b(:,1), samples_b(:,2), 1), @(d) d > 0);

NN_conf_matrix_ab = [
    [A_ClassifyA, B_ClassifyA];
    [A_ClassifyB, B_ClassifyB];
];

disp('Confusion matrix for NN Case 1: A & B:');
disp(NN_conf_matrix_ab);

P_error_NN_case_1 = (B_ClassifyA + A_ClassifyB)/(n_a + n_b)

[C_ClassifyC, C_ClassifyD, C_ClassifyE] = get_error_cde(n_c, KNN(samples_c, samples_d, samples_c(:,1), samples_c(:,2), 1), KNN(samples_c, samples_e, samples_c(:,1), samples_c(:,2), 1), KNN(samples_d, samples_e, samples_c(:,1), samples_c(:,2), 1), @(d) d < 0);
[D_ClassifyC, D_ClassifyD, D_ClassifyE] = get_error_cde(n_c, KNN(samples_c, samples_d, samples_d(:,1), samples_d(:,2), 1), KNN(samples_c, samples_e, samples_d(:,1), samples_d(:,2), 1), KNN(samples_d, samples_e, samples_d(:,1), samples_d(:,2), 1), @(d) d < 0);
[E_ClassifyC, E_ClassifyD, E_ClassifyE] = get_error_cde(n_c, KNN(samples_c, samples_d, samples_e(:,1), samples_e(:,2), 1), KNN(samples_c, samples_e, samples_e(:,1), samples_e(:,2), 1), KNN(samples_d, samples_e, samples_e(:,1), samples_e(:,2), 1), @(d) d < 0);

NN_conf_matrix_cde = [
    [C_ClassifyC, D_ClassifyC, E_ClassifyC];
    [C_ClassifyD, D_ClassifyD, E_ClassifyD];
    [C_ClassifyE, D_ClassifyE, E_ClassifyE];
];

disp('Confusion matrix for NN Case 2: C, D & E:');
disp(NN_conf_matrix_cde);

P_error_NN_case_2 = (D_ClassifyC + E_ClassifyC + C_ClassifyD + E_ClassifyD + C_ClassifyE + D_ClassifyE)/(n_c + n_d + n_e)