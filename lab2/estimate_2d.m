% Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

clear all 
close all
addpath('./Functions', './Scripts');
load('lab2_2.mat')
% rng(2); seed randn generator for consistency

%% True Params

mean = [5, 5];
stdev = [20, 20];
exp_rate = 1;

%% Gaussian Estimate (2D)
% parametric, assume normal

% for class a, plot p_est (norm) and true p (norm)
x_a = 0:0.01:max(al(1), al(2))+1;
y_a = 0:0.01:max(al(1), al(2))+1;
[mean_e, stdev_e] = ml_normal(al);
p = mvnpdf([x_a.',y_a.'],mean,stdev);
p_est = mvnpdf([x_a.',y_a.'],mean_e,stdev_e);

%TODO: instead of trying to plot all this, show ML classifier boundaries
hold on;
figure(1);
plot(p);
plot(p_est);
hold off;

% for class b, plot p_est (norm) and true p (exp)
x_b = 0:0.01:max(bl(1), bl(2))+1;
y_b = 0:0.01:max(bl(1), bl(2))+1;
[mean_e, stdev_e] = ml_normal(bl);
p = mvnpdf([x_b.',y_b.'],mean,stdev);
p_est = mvnpdf([x_b.',y_b.'],mean_e,stdev_e);
figure(2);
hold on;
plot(p);
plot(p_est);
hold off;

% for class c, plot p_est (norm) and true p (exp)
x_c = 0:0.01:max(cl(1), cl(2))+1;
y_c = 0:0.01:max(cl(1), cl(2))+1;
[mean_e, stdev_e] = ml_normal(cl);
p = mvnpdf([x_c.',y_c.'],mean,stdev);
p_est = mvnpdf([x_c.',y_c.'],mean_e,stdev_e);
figure(3);
hold on;
plot(p);
plot(p_est);
hold off;


%% Non-parametric Estimate
% Parzen window normal func 

% for class a, plot p_hat (std 20) and true p (norm)
[p_hat_a, x, y] = parzen_2d(al, 1, 20);
data = zeros(2, max(length(x), length(y)));
for i=1:length(x)
    data(1,i) = x(i);
end
for i=1:length(y)
    data(2,i) = y(i);
end
p = mvnpdf(data.',mean,stdev);

figure(4);
hold on;
plot(p);
plot(p_hat_a);
hold off;

% for class b, plot p_hat (std 0.1, 0.4) and true p (norm)
[p_hat_b, x, y] = parzen_2d(bl, 1, 20);
data = zeros(2, max(length(x), length(y)));
for i=1:length(x)
    data(1,i) = x(i);
end
for i=1:length(y)
    data(2,i) = y(i);
end
p = normpdf(data.',mean,stdev);

figure(5);
hold on;
plot(p);
plot(p_hat_b);
hold off;

% for class c, plot p_hat (std 0.1, 0.4) and true p (norm)
[p_hat_c, x, y] = parzen_2d(cl, 1, 20);
data = zeros(2, max(length(x), length(y)));
for i=1:length(x)
    data(1,i) = x(i);
end
for i=1:length(y)
    data(2,i) = y(i);
end
p = mvnpdf(data.',mean,stdev);

figure(6);
hold on;
plot(p);
plot(p_hat_c);
hold off;