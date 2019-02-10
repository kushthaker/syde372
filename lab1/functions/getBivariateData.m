% Use randn function to generate non-negative integers
% Inputs are n, mu, covar
% Outputs m x 2 vector of gaussian distributed sample data
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435
%
% Febuary 12 2017

function [z] = getBivariateData(n, mu, covar)
    R = chol(covar);
    z = repmat(mu,n,1) + randn(n,2)*R;
end