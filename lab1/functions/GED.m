% Lab 1 GED algorithm
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

%Need: class samples, means, covariance matrices
function [dist] = GED(mean_1, mean_2, covar_1, covar_2, X, Y)

    inv_covar_1 = inv(covar_1);
    inv_covar_2 = inv(covar_2);
    
    dist = zeros(size(X)); % distance matrix of size meshgrid(x,y)  
    
    %Shortcut: compute inverse of covariance, then use to find decision boundaries
    for i=1:size(X,1)
        for j=1:size(Y,2)
            point = [X(i,j) Y(i,j)];
            WDist_1 = sqrt((point - mean_1)*inv_covar_1*((point - mean_1).'));
            WDist_2 = sqrt((point - mean_2)*inv_covar_2*((point - mean_2).'));

            dist(i,j) = WDist_1 - WDist_2;
        end
    end
end