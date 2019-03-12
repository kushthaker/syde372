% SYDE 372 Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

% https://en.wikipedia.org/wiki/Exponential_distribution#Maximum_likelihood

function [exp_rate_e] = ml_exp(samples)

N = length(samples);
exp_rate_e = N / sum(samples);

end