% Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

clear all 
close all
addpath('./Functions', './Scripts');
load('lab2_2.mat')
% rng(2); seed randn generator for consistency

%% Parzen window normal func 

% Window is 2D gaussian with variance of 400 on both axes
x_pzn = -500:1:500;
y_pzn = -500:1:500;
mean_pzn = [0, 0];
covar_pzn = [400,0 ; 0,400];

[X1,X2] = meshgrid(x_pzn, y_pzn);
X = [X1(:) X2(:)];
win_pzn = mvnpdf(X, mean_pzn,covar_pzn);
win_pzn = reshape(win_pzn, length(x_pzn), length(y_pzn));

%% Gaussian Estimate (2D)
% parametric, assume normal

% for class a, plot p_est (norm) and true p (norm)
x1_range =  0:1:500;
x2_range =  0:1:500;
[mean_al, covar_al] = ml_normal_2d(al); 

[X1,X2] = meshgrid(x1_range, x2_range);
X = [X1(:) X2(:)];
p_hat_a_gauss = mvnpdf(X, mean_al, covar_al);
p_hat_a_gauss = reshape(p_hat_a_gauss, length(x1_range), length(x2_range));

% for class b, plot p_est (norm) and true p (exp)
[mean_bl, covar_bl] = ml_normal_2d(bl);

[X1,X2] = meshgrid(x1_range, x2_range);
X = [X1(:) X2(:)];
p_hat_b_gauss = mvnpdf(X, mean_bl, covar_bl);
p_hat_b_gauss = reshape(p_hat_b_gauss, length(x1_range), length(x2_range));

% for class c, plot p_est (norm) and true p (exp)
[mean_cl, covar_cl] = ml_normal_2d(cl);

[X1,X2] = meshgrid(x1_range, x2_range);
X = [X1(:) X2(:)];

p_hat_c_gauss = mvnpdf(X, mean_cl, covar_cl);
p_hat_c_gauss = reshape(p_hat_c_gauss, length(x1_range), length(x2_range));


%% Non-parametric Estimate

% for class a, plot p_hat (std 20) and true p (norm)
[p_hat_a_parzen, x, y] = parzen_2d(al, [1, 0, 0, 500, 500], win_pzn);

% for class b, plot p_hat (std 20) and true p (norm)
[p_hat_b_parzen, x, y] = parzen_2d(bl, [1, 0, 0, 500, 500], win_pzn);

% for class c, plot p_hat (std 20) and true p (norm)
[p_hat_c_parzen, x, y] = parzen_2d(cl, [1, 0, 0, 500, 500], win_pzn);

%% ML decision boundary and data scatter plots

%calculate ML boundary based on discretized Gaussian and Parzen pdf values
%of each class
for i=1:size(X1,1)
    for j=1:size(X2,1)
        %Gaussian estimation
        if p_hat_a_gauss(i,j) > p_hat_b_gauss(i,j) && p_hat_a_gauss(i,j) > p_hat_c_gauss(i,j)
            ML_Gauss(i,j) = -1;
        elseif p_hat_b_gauss(i,j) > p_hat_a_gauss(i,j) && p_hat_b_gauss(i,j) > p_hat_c_gauss(i,j)
            ML_Gauss(i,j) = 0;
        elseif p_hat_c_gauss(i,j) > p_hat_a_gauss(i,j) && p_hat_c_gauss(i,j) > p_hat_b_gauss(i,j)
            ML_Gauss(i,j) = 1;
        else ML_Gauss(i,j) = 2;
        end
        
        %Parzen window estimation
        if p_hat_a_parzen(i,j) > p_hat_b_parzen(i,j) && p_hat_a_parzen(i,j) > p_hat_c_parzen(i,j)
            ML_Parzen(i,j) = -1;
        elseif p_hat_b_parzen(i,j) > p_hat_a_parzen(i,j) && p_hat_b_parzen(i,j) > p_hat_c_parzen(i,j)
            ML_Parzen(i,j) = 0;
        elseif p_hat_c_parzen(i,j) > p_hat_a_parzen(i,j) && p_hat_c_parzen(i,j) > p_hat_b_parzen(i,j)
            ML_Parzen(i,j) = 1;
        else ML_Parzen(i,j) = 2;
        end
    end
end

LINE_WIDTH = 2;

figure(1);
hold on; 

title('2D Class Samples, ML Gaussian and ML Parzen decision boundaries');
xlabel('x1');
ylabel('x2');

% Plot testing sample data
scatter_a = scatter(at(:,1), at(:,2), 'k^', 'filled');
scatter_b = scatter(bt(:,1), bt(:,2), 'bx');
scatter_c = scatter(ct(:,1), ct(:,2), 'ro', 'filled');

% Plot ML boundary
[~,ML_gauss_boundary] = contour(X1,X2,ML_Gauss, 'Color', 'r', 'LineWidth', LINE_WIDTH);
[~,ML_parzen_boundary] = contour(X1,X2,ML_Parzen, 'Color', 'b', 'LineWidth', LINE_WIDTH);

legend([scatter_a, scatter_b, scatter_c, ML_gauss_boundary, ML_parzen_boundary], {'Class A', 'Class B', 'Class C', 'Gaussian ML Decision Boundary', 'Parzen ML Decision Boundary'});
