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
samples_a = a;
samples_b = b;

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
    
    while (n_ab(j) > 0 && n_ba(j) > 0 && tries_count(j) <= limit)
        
        disp('tries count = ')
        disp(tries_count(j))
        
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
end

avg_error = zeros(1,J);
min_error = zeros(1,J);
max_error = zeros(1,J);
std_error = zeros(1,J);
misclassified = zeros(J,limit);
test_a = zeros(1, length(samples_a));
test_b = zeros(1, length(samples_b));
total_points = length(samples_a) + length(samples_b);

for j=1:J
    for k=1:tries_count(j)
        for i=1:length(samples_a)
            discriminant = squeeze(discriminant_list(j,k,:,:));
            
            % true A
            if test_a(i) == 0 && interp2(X1,Y1,discriminant,samples_a(i,1),samples_a(i,2)) < 0 && n_ba(j) == 0
                test_a(i) = 1;
            end
            
            % true B
            if test_b(i) == 0 && interp2(X1,Y1,discriminant,samples_b(i,1),samples_b(i,2)) < 0 && n_ab(j) == 0
                test_b(i) = 1;
            end  
        end
        misclassified(j,k) = length(test_a(test_a == 0)) + length(test_b(test_b == 0));
    end
    
    avg_error(j) = sum(misclassified(j,1:tries_count(j)))/tries_count(j)/total_points;
    min_error(j) = min(misclassified(j,1:tries_count(j)))/total_points;
    max_error(j) = max(misclassified(j,1:tries_count(j)))/total_points;
    std_error(j) = std(misclassified(j,1:tries_count(j)));
end

%% Plots

figure(1);
hold on;
subplot(4,1,1);
plot(1:J, avg_error, '-','linewidth',2,'markersize',3);
title('Average Error');
subplot(4,1,2);
plot(1:J, min_error, '-','linewidth',2,'markersize',3);
title('Minimum Error');
subplot(4,1,3);
plot(1:J, max_error, '-','linewidth',2,'markersize',3);
title('Maximum Error');
subplot(4,1,4);
plot(1:J, std_error, '-','linewidth',2,'markersize',3);
title('Standard Deviation of Errors');
hold off;
