% SYDE 372 Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [mean, covar] = ml_normal_2d(samples)

N = length(samples);
mean = 1/N*sum(samples);
covar = zeros(2,2);
for i = 1:N
    point = [samples(i,1) - mean(1), samples(i,2) - mean(2)];
    covar = covar + transpose(point)*point;
end
covar = (covar * 1/N);
end


