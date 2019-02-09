% Lab 1 main.m script
% Feb 12 2019
%
% Use randn function to generate non-negative integers
% Inputs are n, mu, covar
% Outputs m x 2 vector of gaussian distributed sample data
% 
% Kush Thaker - 20517901
% Callum Mitchell 

function [z] = getBivariateData(n, mu, covar)
    R = chol(covar);
    z = repmat(mu,n,1) + randn(n,2)*R;
end