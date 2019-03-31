% Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

clear all 
close all
addpath('./Functions', './Scripts');
load('lab2_2.mat')
% rng(2); seed randn generator for consistency

%% True Params

%TODO: calculate mean and stddev from data itself
parzen_variance = 400;
exp_rate = 1;

%% Gaussian Estimate (2D)
% parametric, assume normal

% for class a, plot p_est (norm) and true p (norm)
x_a = -100:1:500;
y_a = -100:1:500;
[mean_e, covar_e] = ml_normal_2d(al); 

[X1,X2] = meshgrid(x_a, y_a);
X = [X1(:) X2(:)];
p_est = mvnpdf(X, mean_e,covar_e);
p_est = reshape(p_est, length(x_a), length(y_a));

%TODO: show ML classifier boundaries along with data points on a 2D plot
hold on;
figure(1);
plot(p_est);
hold off;

% for class b, plot p_est (norm) and true p (exp)
x_b = -100:1:500;
y_b = -100:1:500;
[mean_e, covar_e] = ml_normal_2d(bl);

[X1,X2] = meshgrid(x_b, y_b);
X = [X1(:) X2(:)];
p_est = mvnpdf(X, mean_e,covar_e);
p_est = reshape(p_est, length(x_b), length(y_b));

figure(2);
hold on;

plot(p_est);
hold off;

% for class c, plot p_est (norm) and true p (exp)
x_c = -100:1:500;
y_c = -100:1:500;
[mean_e, covar_e] = ml_normal_2d(cl);

[X1,X2] = meshgrid(x_c, y_c);
X = [X1(:) X2(:)];

p_est = mvnpdf(X, mean_e,covar_e);
p_est = reshape(p_est, length(x_c), length(y_c));

figure(3);
hold on;
plot(p_est);
hold off;


%% Non-parametric Estimate
% Parzen window normal func 
% Window is 2D gaussian with variance of 400 on both axes

x_pzn = -100:1:100;
y_pzn = -100:1:100;
mean_pzn = [0, 0];
covar_pzn = [400,0 ; 0,400];

[X1,X2] = meshgrid(x_pzn, y_pzn);
X = [X1(:) X2(:)];
win_pzn = mvnpdf(X, mean_pzn,covar_pzn);
win_pzn = reshape(win_pzn, length(x_pzn), length(y_pzn));


% for class a, plot p_hat (std 20) and true p (norm)
[p_hat_a, x, y] = parzen_2d(al, 1, win_pzn);
data = zeros(2, max(length(x), length(y)));
for i=1:length(x)
    data(1,i) = x(i);
end
for i=1:length(y)
    data(2,i) = y(i);
end

figure(4);
hold on;
plot(p_hat_a);
hold off;

% for class b, plot p_hat (std 20) and true p (norm)
[p_hat_b, x, y] = parzen_2d(bl, 1, win_pzn);
data = zeros(2, max(length(x), length(y)));
for i=1:length(x)
    data(1,i) = x(i);
end
for i=1:length(y)
    data(2,i) = y(i);
end
%p = mvnpdf(data.',mean,stddev);

figure(5);
hold on;
plot(p_hat_b);
hold off;

% for class c, plot p_hat (std 20) and true p (norm)
[p_hat_c, x, y] = parzen_2d(cl, 1, win_pzn);
data = zeros(2, max(length(x), length(y)));
for i=1:length(x)
    data(1,i) = x(i);
end
for i=1:length(y)
    data(2,i) = y(i);
end
%p = mvnpdf(data.',mean,stddev);

figure(6);
hold on;
plot(p_hat_c);
hold off;