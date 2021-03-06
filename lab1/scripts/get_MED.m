% Lab 1 get MED case 1 and 2
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

% Case 1
MED_Case1 = MED(mean_a, mean_b, X1, Y1);

% Case 2
% get MEDs bw 3 classes, write class 1,2,3 or 0 to dist


MED_cd = MED(mean_c, mean_d, X2, Y2);
MED_ce = MED(mean_c, mean_e, X2, Y2);
MED_de = MED(mean_d, mean_e, X2, Y2);

MED_Case2 = zeros(size(X2));

c = 1;
d = 2;
e = 3;

for i=1:size(X2,1)
    for j=1:size(Y2,2)
        if MED_cd(i,j) < 0 && MED_ce(i,j) < 0 
            MED_Case2(i,j) = c;
        elseif MED_cd(i,j) > 0 && MED_de(i,j) < 0 
            MED_Case2(i,j) = d;
        elseif MED_ce(i,j) > 0 && MED_de(i,j) > 0
            MED_Case2(i,j) = e;
        end
    end
end