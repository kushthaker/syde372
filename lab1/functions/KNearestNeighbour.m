% Compute euclidean distance to k-nearest neighbour
% Set K=1 for nearest neighbour, or size(samples)
%
% Kush Thaker - 20517901
% Callum Mitchell - 20608435
%
% Febuary 12 2017

function [kNearestDist] = KNearestNeighbour(samples, X, Y, K)
    kNearestDist  = zeros(size(X,2), size(Y,2));
    for i = 1:size(X,2)
        for j = 1:size(Y,2)
            euclideanDistSet = zeros(size(samples,1), 1); % sorted vector of distances
            get_dist = @(point, mean) sqrt((point-mean) * (point-mean)'); 
            % Compute euclidean distance between current sample point and
            % each other class point
            for k=1:size(samples)
                %Add new sample point distance
                samples(k,1);
                samples(k,2);
                point = [X(i) Y(j)]; 
                euclideanDistSet(k) = abs(get_dist(point, samples(k,1)) - get_dist(point, samples(k,2)));
                if k > 1
                    % Swap until distances are sorted from smallest to largest
                    l = k;
                    m = (l - 1);
                    while m > 0 && euclideanDistSet(m) > euclideanDistSet(l)
                        dist = euclideanDistSet(m);
                        euclideanDistSet(m) = euclideanDistSet(l);
                        euclideanDistSet(l) = dist;
                        l = l - 1;
                        m = m - 1;
                    end
                end
            end
            % Safety check
            if K > size(samples)
                K = size(samples)
            end
            if K < 1
                K = 1
            end
            % Return k-nearest neighbor's euclidean distance
            kNearestDist(i, j) = euclideanDistSet(K);
            kNearestDist(i,j);
        end
    end
end

