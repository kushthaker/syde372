% Compute euclidean distance to k-nearest neighbour
% Set K=1 for nearest neighbour, or size(samples)
%
% Kush Thaker - 20517901
% Callum Mitchell - 20608435
%
% Febuary 12 2017

function [dist] = KNN(samples_a, samples_b, X, Y, K)
    dist = KNearestNeighbour(samples_a, X, Y, K) - KNearestNeighbour(samples_b, X, Y, K);
end

