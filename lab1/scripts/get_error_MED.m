% Lab 1 MED error 
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435
[True_A, False_A] = get_error(n_a, MED(mean_a, mean_b, samples_a), @(d) d < 0);
[True_B, False_B] = get_error(n_b, MED(mean_a, mean_b, samples_b), @(d) d > 0);

MED_conf_matrix_ab = [
    [True_A, False_B];
    [False_A, True_B];
];
disp('Confusion matrix for MED Case 1: A & B:');
disp(MED_conf_matrix_ab);

P_error_MED_case_1 = (FA + FB)/(n_a + n_b)