% MATLAB code to plot two functions

% Define the first function: rect(t - 0.5)
T1 = 2;  % Period T = 2
t1 = linspace(0, 2, 1000);  % Time vector from 0 to 2
rect1 = double(t1 >= 0 & t1 <= 1);  % rect(t - 0.5)

% Define the second function: rect(2t) - 0.5
T2 = 1;  % Period T = 1
t2 = linspace(-0.5, 0.5, 1000);  % Time vector from -0.5 to 0.5
rect2 = double(abs(2*t2) <= 0.5) - 0.5;  % rect(2t) - 0.5

% Plot the first function
figure;
subplot(2, 1, 1);
plot(t1, rect1, 'r', 'LineWidth', 2);
title('Function 1: rect(t - 0.5), T = 2, t \in [0, 2]');
xlabel('t');
ylabel('Amplitude');
ylim([-0.2, 1.2]);
grid on;

% Plot the second function
subplot(2, 1, 2);
plot(t2, rect2, 'b', 'LineWidth', 2);
title('Function 2: rect(2t) - 0.5, T = 1, t \in [-0.5, 0.5]');
xlabel('t');
ylabel('Amplitude');
ylim([-0.7, 0.7]);
grid on;

% Adjust plot

sgtitle(['Name: Sujay Vivek - Roll No: 22EE30029']);
% MATLAB code to plot two functions


