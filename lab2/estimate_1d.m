% Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

clear all 
close all
addpath('./Functions', './Scripts');
load('lab2_1.mat')
% rng(2); seed randn generator for consistency

%% True Params

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

figure(2);
hold on;
plot(p);
plot(p_est);
hold off;

%% Exponential Estimate
% parametric, assume exp

% for class a, plot p_est (exp) and true p (norm)
x = 0:0.01:max(a)+1;
[exp_rate_e] = ml_exp(a);
p = normpdf(x,mean,stdev);
p_est = exppdf(x,1/exp_rate_e);

figure(3);
hold on;
plot(p);
plot(p_est);
hold off;

% for class b, plot p_est (exp) and true p (exp)
x = [0:0.01:max(b)+1];
[exp_rate_e] = ml_exp(b);
p = exppdf(x,1/exp_rate);
p_est = exppdf(x,1/exp_rate_e);

figure(4);
hold on;
plot(p);
plot(p_est);
hold off;

%% Uniform Estimate
% parametric, assume uniform

% for class a, plot p_est (uni) and true p (norm)
x = 0:0.01:max(a)+1;
[a_est, b_est] = ml_uniform(a);
p = normpdf(x,mean,stdev);
p_est = unifpdf(x,a_est,b_est);

figure(5);
hold on;
plot(p);
plot(p_est);
hold off;

% for class b, plot p_est (uni) and true p (exp)
x = [0:0.01:max(b)+1];
[a_est, b_est] = ml_uniform(b);
p = exppdf(x,1/exp_rate);
p_est = unifpdf(x,a_est,b_est);

figure(6);
hold on;
plot(p);
plot(p_est);
hold off;
