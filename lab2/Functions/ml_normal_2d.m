% SYDE 372 Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [mean, stdev] = ml_normal_2d(samples)

N = length(samples);
mean = 1/N*sum(samples);
stdev = 1/N*sum(power(samples - mean,2));

end


