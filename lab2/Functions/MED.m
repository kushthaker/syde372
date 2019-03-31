% Lab 1 MED algorithm
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [dist] = MED(mean_1, mean_2, X, Y)
if nargin < 4
    dist = zeros(size(X));
    for i=1:size(X,1)
        point=X(i,:);
        dist(i) = sqrt((point(1)-mean_1(1))^2+(point(2)-mean_1(2))^2) - sqrt((point(1)-mean_2(1))^2+(point(2)-mean_2(2))^2);
    end  
else
    dist = zeros(size(X)); % distance matrix of size meshgrid(x,y)  
    for i=1:size(X,1)
        for j=1:size(Y,2)
            point = [X(i,j) Y(i,j)]; 
            dist(i,j) = sqrt((point(1)-mean_1(1))^2+(point(2)-mean_1(2))^2) - sqrt((point(1)-mean_2(1))^2+(point(2)-mean_2(2))^2);
        end
    end
end