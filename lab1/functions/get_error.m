% Lab 1 get_error algorithm for case 1
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [ T, F ] = get_error( n, dist, test_func )
%MAP_ERROR Compute the error of the MAP classifier between two classes.
% Returns the true predictions and the incorrect ones

T = 0;
for i=1:length(dist)
    point = dist(i);
    if test_func(point)
        T = T + 1;
    end
end
F = n - T;