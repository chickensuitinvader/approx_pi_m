% Cleanup duties from previous run
clear all;
close all;
clc;

% Draw a sample
sample_number = 100;
drawn_sample = rand(sample_number,2);

% Calculate the points inside the circle
inside_circle = (drawn_sample(:,1).^2+drawn_sample(:,2).^2) < (1-eps);
pi_over_time = cumsum(inside_circle)./(1:sample_number)'*4;

% Plot the results: Points drawn
subplot(3,1,[1,2]);
plot(drawn_sample(inside_circle,1), drawn_sample(inside_circle,2),'rx', ...
    drawn_sample(~inside_circle,1), drawn_sample(~inside_circle,2),'bx')
axis equal tight
title(sprintf('%d Points Drawn in [0,1]^2', sample_number))

% Plot the results: Approximation over time
subplot(3,1,3);
plot(1:sample_number, pi_over_time);
title(sprintf('Approximate Value of \\pi over Time (Final Result: %f)', ...
    pi_over_time(end)));
xlabel('Iteration');
ylabel('Approximate \pi value')