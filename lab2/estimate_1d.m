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
title('Parametric - Gaussian Estimate of A');
legend([plot(p), plot(p_est)], {'True P', 'Estimated P'}, 'Location', 'northeast');
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
title('Parametric - Gaussian Estimate of B');
legend([plot(p), plot(p_est)], {'True', 'Estimated'}, 'Location', 'northeast');
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
title('Parametric - Exponential Estimate of A');
legend([plot(p), plot(p_est)], {'True', 'Estimated'}, 'Location', 'northeast');
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
title('Parametric - Exponential Estimate of B');
legend([plot(p), plot(p_est)], {'True', 'Estimated'}, 'Location', 'northeast');
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
title('Parametric - Uniform Estimate of A');
legend([plot(p), plot(p_est)], {'True', 'Estimated'}, 'Location', 'northeast');
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
title('Parametric - Uniform Estimate of B');
legend([plot(p), plot(p_est)], {'True', 'Estimated'}, 'Location', 'northeast');
hold off;

%% Non-parametric Estimate
% Parzen window normal func 

% for class a, plot p_hat (std 0.1, std 0.4) and true p (norm)
x = [0:0.01:max(a)+1];
p_hat1 = parzen_1d(a,x,0.1);
p_hat4 = parzen_1d(a,x,0.4);
p = normpdf(x,mean,stdev);

figure(7);
hold on;
plot(p);
plot(p_hat1);
plot(p_hat4);
title('Non-Parametric - Parzen Window Estimate of A');
legend([plot(p), plot(p_hat1), plot(p_hat4)], {'True', 'Estimated StDev=0.1','Estimated StDev=0.4'}, 'Location', 'northeast');
hold off;

% for class b, plot p_hat (std 0.1, 0.4) and true p (norm)
x = [0:0.01:max(b)+1];
p_hat1 = parzen_1d(b,x,0.1);
p_hat4 = parzen_1d(b,x,0.4);
p = exppdf(x,1/exp_rate);

figure(8);
hold on;
plot(p);
plot(p_hat1);
plot(p_hat4);
title('Non-Parametric - Parzen Window Estimate of B');
legend([plot(p), plot(p_hat1), plot(p_hat4)], {'True', 'Estimated StDev=0.1','Estimated StDev=0.4'}, 'Location', 'northeast');

hold off;