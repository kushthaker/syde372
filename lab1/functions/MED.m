% Lab 1 compute MED boundary
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [dist] = MED(mean_1, mean_2, X, Y)
    dist = zeros(size(X)); % distance matrix of size meshgrid(x,y)  
    get_dist = @(point, mean) sqrt((point-mean) * (point-mean)'); 
    for i=1:size(X,1)
        for j=1:size(Y,2)
            point = [X(i,j) Y(i,j)]; 
            dist(i,j) = get_dist(point, mean_1) - get_dist(point, mean_2);
        end
    end
end