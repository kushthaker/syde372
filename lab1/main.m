% Lab 1 main.m script
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 206XXXXX

clear all 
close all
addpath('./functions', './scripts');
rng(2); % seed randn generator for consistency

class_sample_data;

%% Load Sample Data

samples_a = getBivariateData(n_a, mean_a, covar_a);
samples_b = getBivariateData(n_b, mean_b, covar_b);

%% Compute Classifiers

dx = 0.2; % The lower this is the smoother the contours.

x = min([samples_a(:,1);samples_b(:,1)])-1:dx:max([samples_a(:,1);samples_b(:,1)])+1;
y = min([samples_a(:,2);samples_b(:,2)])-1:dx:max([samples_a(:,2);samples_b(:,2)])+1;

[X1, Y1] = meshgrid(x,y); % Creates 2 arrays of equal-size as grid for sample data.

MED_ab = MED(mean_a, mean_b, X1, Y1);


%% Plot Decision Boundaries

LINE_WIDTH = 3;

figure(1);
hold on; 

% Plot MED boundary
contour(X1,Y1,MED_ab, [0, 0], 'Color', 'black', 'LineWidth', LINE_WIDTH);

% Plot sample data
scatter_a = scatter(samples_a(:,1), samples_a(:,2), 'bo');
scatter_b = scatter(samples_b(:,1), samples_b(:,2), 'rx');

% Plot means
plot(mean_a(1), mean_a(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);
plot(mean_b(1), mean_b(2), 'ks', 'MarkerSize',10, 'MarkerFaceColor',[0 0 0]);

hold off;