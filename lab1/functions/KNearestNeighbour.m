% Compute euclidean distance to k-nearest neighbour
% Set K=1 for nearest neighbour, or size(samples)
%
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [kNearestDist] = KNearestNeighbour(samples, X, Y, K)
    kNearestDist  = zeros(size(X,1), size(Y,2));
    for i = 1:size(X,1)
        for j = 1:size(Y,2)
            euclideanDistSet = zeros(size(samples,1), 1); % sorted vector of distances
            sampleIDSet = zeros(size(samples,1), 1); %distance-sorted vector of sample IDs 
            % Compute euclidean distance between current sample point and
            % each other class point
            for k=1:size(samples)
                %Add new sample point distance
                point = [X(i,j) Y(i,j)]; 
                euclideanDistSet(k) = abs(sqrt((point(1) - samples(k,1))^2 + (point(2) - samples(k,2))^2));
                sampleIDSet(k) = k;
                if k > 1
                    % Swap until distances are sorted from smallest to largest
                    l = k;
                    m = (l - 1);
                    while m > 0 && euclideanDistSet(m) > euclideanDistSet(l)
                        dist = euclideanDistSet(m);
                        ID = sampleIDSet(m);
                        euclideanDistSet(m) = euclideanDistSet(l);
                        sampleIDSet(m) = sampleIDSet(l);
                        euclideanDistSet(l) = dist;
                        sampleIDSet(l) = ID;
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
            kPointSum = [0,0];
            for k = 1:K
                kPointSum(1) = kPointSum(1) + samples(sampleIDSet(k),1);
                kPointSum(2) = kPointSum(2) + samples(sampleIDSet(k),2);
            end
            kPointMean = [kPointSum(1)/K, kPointSum(2)/K];
            kNearestDist(i, j) = abs(sqrt((point(1) - kPointMean(1))^2 + (point(2) - kPointMean(2))^2));
            kNearestDist(i,j);
            % Those above lines are WRONG! We take the sample mean of the k
            % nearest points!
            

        end
    end
end

