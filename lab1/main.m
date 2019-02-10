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

x = min([samples_a(:,1);samples_b(:,1)])-1:dx:max([samples_a(:,1);samples_b(:,1)])+1;
y = min([samples_a(:,2);samples_b(:,2)])-1:dx:max([samples_a(:,2);samples_b(:,2)])+1;

[X1, Y1] = meshgrid(x,y); % Creates 2 arrays of equal-size as grid for sample data.

MED_ab = MED(mean_a, mean_b, X1, Y1);
MAP_ab = MAP(n_a, n_b, mean_a, mean_b, covar_a, covar_b, X1, Y1);


%% Plot Decision Boundaries

LINE_WIDTH = 3;

figure(1);
hold on; 

% Plot MED boundary
contour(X1,Y1,MED_ab, [0, 0], 'Color', 'black', 'LineWidth', LINE_WIDTH);

% Plot MED boundary
contour(X1,Y1,MAP_ab, [0, 0], 'Color', 'blue', 'LineWidth', LINE_WIDTH);

% Plot sample data
scatter_a = scatter(samples_a(:,1), samples_a(:,2), 'bo');
scatter_b = scatter(samples_b(:,1), samples_b(:,2), 'rx');

% Plot means
plot(mean_a(1), mean_a(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);
plot(mean_b(1), mean_b(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);

hold off;

figure(2);
hold on; 

% Plot sample data
scatter_c = scatter(samples_c(:,1), samples_c(:,2), 'b^', 'filled');
scatter_d = scatter(samples_d(:,1), samples_d(:,2), 'rx');
scatter_e = scatter(samples_e(:,1), samples_e(:,2), 'go', 'filled');

% Plot means
plot(mean_c(1), mean_c(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);
plot(mean_d(1), mean_d(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);
plot(mean_e(1), mean_e(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);

hold off;