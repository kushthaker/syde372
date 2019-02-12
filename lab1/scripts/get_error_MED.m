% Lab 1 MED error 
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435
[A_ClassifyA, A_ClassifyB] = get_error(n_a, MED(mean_a, mean_b, samples_a), @(d) d < 0);
[B_ClassifyB, B_ClassifyA] = get_error(n_b, MED(mean_a, mean_b, samples_b), @(d) d > 0);

MED_conf_matrix_ab = [
    [A_ClassifyA, B_ClassifyA];
    [A_ClassifyB, B_ClassifyB];
];

disp('Confusion matrix for MED Case 1: A & B:');
disp(MED_conf_matrix_ab);

P_error_MED_case_1 = (B_ClassifyA + A_ClassifyB)/(n_a + n_b)

[C_ClassifyC, C_ClassifyD, C_ClassifyE] = get_error_cde(n_c, MED(mean_c, mean_d, samples_c), MED(mean_c, mean_e, samples_c), MED(mean_d, mean_e, samples_c), @(d) d < 0);
[D_ClassifyC, D_ClassifyD, D_ClassifyE] = get_error_cde(n_d, MED(mean_c, mean_d, samples_d), MED(mean_c, mean_e, samples_d), MED(mean_d, mean_e, samples_d), @(d) d < 0);
[E_ClassifyC, E_ClassifyD, E_ClassifyE] = get_error_cde(n_e, MED(mean_c, mean_d, samples_e), MED(mean_c, mean_e, samples_e), MED(mean_d, mean_e, samples_e), @(d) d < 0);

MED_conf_matrix_cde = [
    [C_ClassifyC, D_ClassifyC, E_ClassifyC];
    [C_ClassifyD, D_ClassifyD, E_ClassifyD];
    [C_ClassifyE, D_ClassifyE, E_ClassifyE];
];

disp('Confusion matrix for MED Case 2: C, D & E:');
disp(MED_conf_matrix_cde);

P_error_MED_case_2 = (D_ClassifyC + E_ClassifyC + C_ClassifyD + E_ClassifyD + C_ClassifyE + D_ClassifyE)/(n_c + n_d + n_e)
