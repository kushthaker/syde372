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
NN_ab = KNN(samples_a, samples_b, X1, Y1, 1);
KNN_ab = KNN(samples_a, samples_b, X1, Y1, 5);

%% Plot Decision Boundaries

LINE_WIDTH = 3;

figure(1);
hold on; 

% Plot MED boundary
contour(X1,Y1,MED_Case1, [0, 0], 'Color', 'black', 'LineWidth', LINE_WIDTH);

% Plot GED boundary
contour(X1,Y1,GED_Case1, [0, 0], 'Color', 'green', 'LineWidth', LINE_WIDTH);

% Plot MAP boundary
contour(X1,Y1,MAP_Case1, [0, 0], 'Color', 'blue', 'LineWidth', LINE_WIDTH);

% Plot NN boundary
contour(X1,Y1,NN_ab, [0, 0], 'Color', 'red', 'LineWidth', LINE_WIDTH);

% Plot K-NN boundary for k=5
contour(X1,Y1,KNN_ab, [0, 0], 'Color', 'yellow', 'LineWidth', LINE_WIDTH);


% Plot sample data
scatter_a = scatter(samples_a(:,1), samples_a(:,2), 'bo');
scatter_b = scatter(samples_b(:,1), samples_b(:,2), 'rx');

% Plot means
plot(mean_a(1), mean_a(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);
plot(mean_b(1), mean_b(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);

hold off;

figure(2);
hold on; 

% Plot MED boundary
contour(X2,Y2,MED_Case2, 'Color', 'black', 'LineWidth', LINE_WIDTH);

% Plot GED boundary
contour(X2,Y2,GED_Case2, 'Color', 'green', 'LineWidth', LINE_WIDTH);

% Plot NN boundary
contour(X2,Y2,NN_Case2, 'Color', 'red', 'LineWidth', LINE_WIDTH);

% Plot K-NN boundary for k=5
contour(X2,Y2,KNN_Case2, 'Color', 'yellow', 'LineWidth', LINE_WIDTH);

% Plot MAP boundary
%contour(X2,Y2,MED_Case2, 'Color', 'black', 'LineWidth', LINE_WIDTH);

% Plot sample data
scatter_c = scatter(samples_c(:,1), samples_c(:,2), 'b^', 'filled');
scatter_d = scatter(samples_d(:,1), samples_d(:,2), 'rx');
scatter_e = scatter(samples_e(:,1), samples_e(:,2), 'go', 'filled');

% Plot means
plot(mean_c(1), mean_c(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);
plot(mean_d(1), mean_d(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);
plot(mean_e(1), mean_e(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);

hold off;