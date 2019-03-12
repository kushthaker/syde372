% Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

clear all 
close all
addpath('./Functions', './Scripts');
load('lab2_1.mat')
% rng(2); seed randn generator for consistency

%% Given True Params

mean = 5;
stdev = 1;
exp_rate = 1;

%% Gaussian Estimate

% parametric, assume normal
% for class a, plot p_est (norm) and true p (norm)

x = [0:0.01:max(a)+1];
[mean_e, stdev_e] = ml_normal(a);
p = normpdf(x,mean,stdev);
p_est = normpdf(x,mean_e,stdev_e);

hold on;
figure(1);
plot(p);
plot(p_est);
hold off;

% for class b, plot p_est (norm) and true p (exp)

x = [0:0.01:max(b)+1];
[mean_e, stdev_e] = ml_normal(b);
p = exppdf(x,1/exp_rate);
p_est = normpdf(x,mean_e,stdev_e);

hold on;
figure(2);
plot(p);
plot(p_est);
hold off;




