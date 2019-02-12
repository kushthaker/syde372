% Lab 1 get NN case 1 and 2
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

% Case 1
NN_Case1 = KNN(samples_a, samples_b, X1, Y1, 1);

% Case 2
% get NNs bw 3 classes, write class 1,2,3 or 0 to dist

NN_cd = KNN(samples_c, samples_d, X2, Y2, 1);
NN_ce = KNN(samples_c, samples_e, X2, Y2, 1);
NN_de = KNN(samples_d, samples_e, X2, Y2, 1);

NN_Case2 = zeros(size(X2));

c = 1;
d = 2;
e = 3;

for i=1:size(X2,1)
    for j=1:size(Y2,2)
        if NN_cd(i,j) < 0 && NN_ce(i,j) < 0 
            NN_Case2(i,j) = c;
        elseif NN_cd(i,j) > 0 && NN_de(i,j) < 0 
            NN_Case2(i,j) = d;
        elseif NN_ce(i,j) > 0 && NN_de(i,j) > 0
            NN_Case2(i,j) = e;
        end
    end
end