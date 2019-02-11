% Lab 1 get GED case 1 and 2
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

% Case 1
GED_Case1 = GED(mean_a, mean_b, covar_a, covar_b, X1, Y1);

% Case 2
% get MEDs bw 3 classes, write class 1,2,3 or 0 to dist


GED_cd = GED(mean_c, mean_d, covar_c, covar_d, X2, Y2);
GED_ce = GED(mean_c, mean_e, covar_c, covar_e, X2, Y2);
GED_de = GED(mean_d, mean_e, covar_d, covar_e, X2, Y2);

GED_Case2 = zeros(size(X2));

c = 1;
d = 2;
e = 3;

for i=1:size(X2,1)
    for j=1:size(Y2,2)
        if GED_cd(i,j) < 0 && GED_ce(i,j) < 0 
            GED_Case2(i,j) = c;
        elseif GED_cd(i,j) > 0 && GED_de(i,j) < 0 
            GED_Case2(i,j) = d;
        elseif GED_ce(i,j) > 0 && GED_de(i,j) > 0
            GED_Case2(i,j) = e;
        end
    end
end