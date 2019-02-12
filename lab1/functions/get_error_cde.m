% Lab 1 get_error algorithm for case 2
% Feb 12 2019
% 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

function [ C, D, E ] = get_error_cde(n, dist_cd, dist_ce, dist_de, test_func)
%MAP_ERROR Compute the error of the MAP classifier between two classes.
% Returns the true predictions and the incorrect ones

    C = 0;
    D = 0;
    E = 0;
    for i=1:length(dist_cd)
        if test_func(dist_cd(i)) && test_func(dist_ce(i))
            %Classify as C
            C = C + 1;
        elseif test_func(dist_cd(i)) == false && test_func(dist_de(i))
            %Classify as D
            D = D + 1;
        elseif test_func(dist_ce(i)) == false && test_func(dist_de(i)) == false 
            %Classify as E
            E = E + 1;
        end    
    end
end