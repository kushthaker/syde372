% Lab 1 get KNN case 1 and 2 for k=5
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

% Case 1
KNN_Case1 = KNN(samples_a, samples_b, X1, Y1, 5);

% Case 2
% get KNNs bw 3 classes, write class 1,2,3 or 0 to dist


KNN_cd = KNN(samples_c, samples_d, X2, Y2, 5);
KNN_ce = KNN(samples_c, samples_e, X2, Y2, 5);
KNN_de = KNN(samples_d, samples_e, X2, Y2, 5);

KNN_Case2 = zeros(size(X2));

c = 1;
d = 2;
e = 3;

for i=1:size(X2,1)
    for j=1:size(Y2,2)
        if KNN_cd(i,j) < 0 && KNN_ce(i,j) < 0 
            KNN_Case2(i,j) = c;
        elseif KNN_cd(i,j) > 0 && KNN_de(i,j) < 0 
            KNN_Case2(i,j) = d;
        elseif KNN_ce(i,j) > 0 && KNN_de(i,j) > 0
            KNN_Case2(i,j) = e;
        end
    end
end