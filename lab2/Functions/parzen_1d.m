% SYDE 372 Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [p_hat] = parzen_1d(samples, x, stdev)

N = length(samples);

for i=1:length(x)
    sum = 0;
    for j=1:length(samples)
        sum = sum + normpdf(x(i), samples(j), stdev);
    end
    p_hat(i) = 1/N*sum;
end

end