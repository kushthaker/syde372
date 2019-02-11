% Lab 1 GED algorithm
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

%Need: class samples, means, covariance matrices
function [dist] = GED(mean_1, mean_2, covar_1, covar_2 X, Y)
    %weighted distances
    WDist_1;
    WDist_2;
    
    %Compute eigenvalues/eigenvectors of each covariance matrix
    
    %Compute orthonormal whitening transform
    
    %
    
    %Get weighted distance from mean
    dist = zeros(size(X)); % distance matrix of size meshgrid(x,y)  
    for i=1:size(X,1)
        for j=1:size(Y,2)
            point = [X(i,j) Y(i,j)]; 
            dist(i,j) = sqrt((point(1)-mean_1(1))^2+(point(2)-mean_1(2))^2) - sqrt((point(1)-mean_2(1))^2+(point(2)-mean_2(2))^2);
        end
    end
end