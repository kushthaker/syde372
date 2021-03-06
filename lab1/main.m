% Lab 1 main.m script
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

clear all 
close all
addpath('./functions', './scripts');
rng(2); % seed randn generator for consistency

class_sample_data;

%% Load Sample Data

samples_a = getBivariateData(n_a, mean_a, covar_a);
samples_b = getBivariateData(n_b, mean_b, covar_b);
samples_c = getBivariateData(n_c, mean_c, covar_c);
samples_d = getBivariateData(n_d, mean_d, covar_d);
samples_e = getBivariateData(n_e, mean_e, covar_e);

%% Load 2nd set of Sample Data for error calculation

samples_a_2nd = getBivariateData(n_a, mean_a, covar_a);
samples_b_2nd = getBivariateData(n_b, mean_b, covar_b);
samples_c_2nd = getBivariateData(n_c, mean_c, covar_c);
samples_d_2nd = getBivariateData(n_d, mean_d, covar_d);
samples_e_2nd = getBivariateData(n_e, mean_e, covar_e);

%% Compute Classifiers

dx = 0.2; % The lower this is the smoother the contours.

% Case 1
x = min([samples_a(:,1);samples_b(:,1)])-1:dx:max([samples_a(:,1);samples_b(:,1)])+1;
y = min([samples_a(:,2);samples_b(:,2)])-1:dx:max([samples_a(:,2);samples_b(:,2)])+1;

[X1, Y1] = meshgrid(x,y); % Creates 2 arrays of equal-size as grid for sample data.

% Case 2
x = min([samples_c(:,1);samples_d(:,1);samples_e(:,1)])-1:dx:max([samples_c(:,1);samples_d(:,1);samples_e(:,1)])+1;
y = min([samples_c(:,2);samples_d(:,2);samples_e(:,2)])-1:dx:max([samples_c(:,2);samples_d(:,2);samples_e(:,2)])+1;

[X2, Y2] = meshgrid(x,y);

get_MED;
get_GED;
get_NN;
get_KNN;
get_MAP;

LINE_WIDTH = 2;

%% Case 1 - MED, GED, MAP Classifier Plots
figure(1);
hold on;

% Plot sample data
scatter_a = scatter(samples_a(:,1), samples_a(:,2), 'bo');
scatter_b = scatter(samples_b(:,1), samples_b(:,2), 'rx');

% Plot means
plot(mean_a(1), mean_a(2), 'bs', 'MarkerSize',10, 'MarkerFaceColor', 'b');
plot(mean_b(1), mean_b(2), 'rs', 'MarkerSize',10, 'MarkerFaceColor', 'r');

% Plot MED boundary
[~, MED_ab_boundary] = contour(X1,Y1,MED_Case1, [0, 0], 'Color', 'k', 'LineWidth', LINE_WIDTH);

% Plot GED boundary
[~, GED_ab_boundary] = contour(X1,Y1,GED_Case1, [0, 0], 'Color', 'm', 'LineWidth', LINE_WIDTH);

% Plot MAP boundary
[~, MAP_ab_boundary] = contour(X1,Y1,MAP_Case1, [0, 0], 'Color', 'g', 'LineWidth', LINE_WIDTH);

% Plot Unit Standard Deviation Contours
theta_a = atan(e_vecs_a(2,2)/e_vecs_a(2,1));
plot_ellipse(mean_a(1),mean_a(2),theta_a,sqrt(e_vals_a(2,2)),sqrt(e_vals_a(1,1)),'b');

theta_b = atan(e_vecs_b(2,2)/e_vecs_b(2,1));
plot_ellipse(mean_b(1),mean_b(2),theta_b,sqrt(e_vals_b(2,2)),sqrt(e_vals_b(1,1)),'r');

title('Case 1 - MAP, GED, MAP Boundaries');
legend([scatter_a, scatter_b, MED_ab_boundary, GED_ab_boundary, MAP_ab_boundary], {'Class A', 'Class B', 'MED Boundary','GED Boundary', 'MAP Boundary'}, 'Location', 'northeast');

hold off;

%% Case 1 - NN, kNN Classifier Plots

figure(2)
hold on;

% Plot sample data
scatter_a = scatter(samples_a(:,1), samples_a(:,2), 'bo');
scatter_b = scatter(samples_b(:,1), samples_b(:,2), 'rx');

% Plot means
plot(mean_a(1), mean_a(2), 'bs', 'MarkerSize',10, 'MarkerFaceColor', 'b');
plot(mean_b(1), mean_b(2), 'rs', 'MarkerSize',10, 'MarkerFaceColor', 'r');

% Plot NN boundary
[~, NN_ab] = contour(X1,Y1, NN_Case1, [0, 0], 'Color', 'k', 'LineWidth', LINE_WIDTH);

% Plot K-NN boundary for k=5
[~, kNN_ab] = contour(X1,Y1,KNN_Case1, [0, 0], 'Color', 'm', 'LineWidth', LINE_WIDTH);

% Plot Unit Standard Deviation Contours
theta_a = atan(e_vecs_a(2,2)/e_vecs_a(2,1));
plot_ellipse(mean_a(1),mean_a(2),theta_a,sqrt(e_vals_a(2,2)),sqrt(e_vals_a(1,1)),'b');

theta_b = atan(e_vecs_b(2,2)/e_vecs_b(2,1));
plot_ellipse(mean_b(1),mean_b(2),theta_b,sqrt(e_vals_b(2,2)),sqrt(e_vals_b(1,1)),'r');

title('Case 1 - NN, kNN Boundaries');
legend([scatter_a, scatter_b, NN_ab, kNN_ab], {'Class A', 'Class B', 'NN (black)','kNN (purple)'}, 'Location', 'northeast');

hold off;

%% Case 2 - MED, GED, MAP Classifier Plots 
figure(3);
hold on; 

% Plot sample data
scatter_c = scatter(samples_c(:,1), samples_c(:,2), 'k^', 'filled');
scatter_d = scatter(samples_d(:,1), samples_d(:,2), 'bx');
scatter_e = scatter(samples_e(:,1), samples_e(:,2), 'ro', 'filled');

% Plot means
plot(mean_c(1), mean_c(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor','k');
plot(mean_d(1), mean_d(2), 'bs', 'MarkerSize',10, 'MarkerFaceColor','b');
plot(mean_e(1), mean_e(2), 'rs', 'MarkerSize',10, 'MarkerFaceColor','r');

% Plot MED boundary
[~,MED_cde_boundary] = contour(X2,Y2,MED_Case2, 'Color', 'k', 'LineWidth', LINE_WIDTH);

% Plot GED boundary
[~,GED_cde_boundary] = contour(X2,Y2,GED_Case2, 'Color', 'r', 'LineWidth', LINE_WIDTH);

% Plot MAP boundary
[~,MAP_cde_boundary] = contour(X2,Y2,MAP_Case2, 'Color', 'm', 'LineWidth', LINE_WIDTH);

% Plot Unit Standard Deviation Contours
theta_c = atan(e_vecs_c(2,2)/e_vecs_c(2,1));
plot_ellipse(mean_c(1),mean_c(2),theta_c,sqrt(e_vals_c(2,2)),sqrt(e_vals_c(1,1)),'k');

theta_d = atan(e_vecs_d(2,2)/e_vecs_d(2,1));
plot_ellipse(mean_d(1),mean_d(2),theta_d,sqrt(e_vals_d(2,2)),sqrt(e_vals_d(1,1)),'b');

theta_e = atan(e_vecs_e(2,2)/e_vecs_e(2,1));
plot_ellipse(mean_e(1),mean_e(2),theta_e,sqrt(e_vals_e(2,2)),sqrt(e_vals_e(1,1)),'r');

title('Case 2 - MAP, GED, MAP Boundaries');
legend([scatter_c, scatter_d, scatter_e, MED_cde_boundary, GED_cde_boundary, MAP_cde_boundary], {'Class C', 'Class D','Class E','MED (black)','GED (red)', 'MAP (purple)'}, 'Location', 'northeast');

hold off;

%% Case 2 - NN, kNN Classifier Plots

figure(4)
hold on;

% Plot sample data
scatter_c = scatter(samples_c(:,1), samples_c(:,2), 'k^', 'filled');
scatter_d = scatter(samples_d(:,1), samples_d(:,2), 'bx');
scatter_e = scatter(samples_e(:,1), samples_e(:,2), 'ro', 'filled');

% Plot means
plot(mean_c(1), mean_c(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor','k');
plot(mean_d(1), mean_d(2), 'bs', 'MarkerSize',10, 'MarkerFaceColor','b');
plot(mean_e(1), mean_e(2), 'rs', 'MarkerSize',10, 'MarkerFaceColor','r');

% Plot NN boundary
[~, NN_cde] = contour(X2,Y2,NN_Case2, 'Color', 'g', 'LineWidth', LINE_WIDTH);

% Plot K-NN boundary for k=5
[~, kNN_cde] = contour(X2,Y2,KNN_Case2, 'Color', 'm', 'LineWidth', LINE_WIDTH);

% Plot Unit Standard Deviation Contours
theta_c = atan(e_vecs_c(2,2)/e_vecs_c(2,1));
plot_ellipse(mean_c(1),mean_c(2),theta_c,sqrt(e_vals_c(2,2)),sqrt(e_vals_c(1,1)),'k');

theta_d = atan(e_vecs_d(2,2)/e_vecs_d(2,1));
plot_ellipse(mean_d(1),mean_d(2),theta_d,sqrt(e_vals_d(2,2)),sqrt(e_vals_d(1,1)),'b');

theta_e = atan(e_vecs_e(2,2)/e_vecs_e(2,1));
plot_ellipse(mean_e(1),mean_e(2),theta_e,sqrt(e_vals_e(2,2)),sqrt(e_vals_e(1,1)),'r');

title('Case 2 - NN, kNN Boundaries');
legend([scatter_c, scatter_d, scatter_e, NN_cde, kNN_cde], {'Class C', 'Class D','Class E', 'NN (green)','kNN (purple)'}, 'Location', 'northeast');

hold off;