% Lab 1 compute MAP boundary for two normally distributed classes
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [dist] = MAP(n_1, n_2, mean_1, mean_2, covar_1, covar_2, X, Y)
    dist = zeros(size(X)); % distance matrix of size meshgrid(x,y)
    Q0 = inv(covar_1) - inv(covar_2);
    Q1 = 2*(mean_2*inv(covar_2) - mean_1*inv(covar_1));
    Q2 = mean_1*inv(covar_1)*mean_1' - mean_2*inv(covar_2)*mean_2';
    Q3 = n_2/n_1;
    Q4 = log(det(covar_1) / det(covar_2));
    
    for i=1:size(X,1)
        for j=1:size(Y,2)
             point = [X(i,j) Y(i,j)];
             dist(i,j) = point*Q0*point'+Q1*point'+Q2+2*Q3+Q4;
        end
    end

end









