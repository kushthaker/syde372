% Lab 2 
% Kush Thaker - 20517901
% Callum Mitchell - 20608435

clear all 
close all
addpath('./Functions', './Scripts');
load('lab2_3.mat')
% rng(2); seed randn generator for consistency

%% Givens

J = 5;
limit = 20;
step = 1;

%% Visualize Data

x = min([a(:,1);b(:,1)])-1:step:max([a(:,1);b(:,1)])+1;
y = min([a(:,2);b(:,2)])-1:step:max([a(:,2);b(:,2)])+1;
[X1,Y1] = meshgrid(x,y);

% figure(2);
% hold on;
% scatter_a = scatter(a(:,1), a(:,2), 'bo');
% scatter_b = scatter(b(:,1), b(:,2), 'rx');
% Plot MED boundary
% [~, discriminant] = contour(X1,Y1,discriminant, [0, 0], 'Color', 'k', 'LineWidth',2);
% title('class A & B Discriminant 3');
% legend([scatter_a, scatter_b, discriminant], {'Class A', 'Class B', 'Discriminant 3'}, 'Location', 'northeast');
% hold off;


%% Sequential Discriminants

discriminant_list = zeros(J,limit, size(X1,1), size(X1, 2));
j = 1;

n_ab = ones(J,1); % true a predicted false b
n_ba = ones(J,1); % true b predicted false a
tries_count = ones(J,1);

for j=1:J
    disp('j = ')
    disp(j)
    
    size(a)
    size(b)
    
    while (n_ab(j) > 0 && n_ba(j) > 0 && tries_count(j) <= limit)
        
        % Steps 1-3 get MED based on 2 random points
        mean_a = a(randi(length(a),1),:);
        mean_b = b(randi(length(b),1),:);
        discriminant = MED(mean_a, mean_b, X1, Y1);

        % Step 4 get n_ab and n_ba
        n_ab(j) = 0;
        for i=1:length(a)
            if interp2(X1,Y1,discriminant,a(i,1),a(i,2)) > 0
                n_ab(j) = n_ab(j) + 1;
            end
        end

        n_ba(j) = 0;
        for i=1:length(b)
            if interp2(X1,Y1,discriminant,b(i,1),b(i,2)) < 0
                n_ba(j) = n_ba(j) + 1;
            end
        end
        
        disp('tries:')
        tries_count(j)
        tries_count(j) = tries_count(j) + 1; 
        
        discriminant_list(j, tries_count(j),:,:) = discriminant;
    end
    
     % if 0 false b predictions then remove true b points
     if (n_ab(j) == 0)
        b = b(interp2(X1,Y1,discriminant,b(:,1),b(:,2)) < 0,:);
     end
     
     % if 0 false a predictions then remove true a points
     if (n_ba(j) == 0)
        a = a(interp2(X1,Y1,discriminant,a(:,1),a(:,2)) > 0,:);
     end
     
     length(a)
     length(b)
end



