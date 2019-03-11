% Lab 1 get MAP case 1 and 2
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

% Case 1
MAP_Case1 = MAP(n_a, n_b, mean_a, mean_b, covar_a, covar_b, X1, Y1);

% Case 2
% get MEDs bw 3 classes, write class 1,2,3 or 0 to dist


MAP_cd = MAP(n_c, n_d, mean_c, mean_d, covar_c, covar_d, X2, Y2);
MAP_ce = MAP(n_c, n_e, mean_c, mean_e, covar_c, covar_e, X2, Y2);
MAP_de = MAP(n_d, n_e, mean_d, mean_e, covar_d, covar_e, X2, Y2);

MAP_Case2 = zeros(size(X2));

c = 1;
d = 2;
e = 3;

for i=1:size(X2,1)
    for j=1:size(Y2,2)
        if MAP_cd(i,j) < 0 && MAP_ce(i,j) < 0 
            MAP_Case2(i,j) = c;
        elseif MAP_cd(i,j) > 0 && MAP_de(i,j) < 0 
            MAP_Case2(i,j) = d;
        elseif MAP_ce(i,j) > 0 && MAP_de(i,j) > 0
            MAP_Case2(i,j) = e;
        end
    end
end