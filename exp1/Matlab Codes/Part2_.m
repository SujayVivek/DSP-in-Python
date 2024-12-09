% Creating a function to make things easier
function a = create_disc(gap)
    a = 0:gap:10;
end

% Define the function to be plotted
f = @(t) cos(t).*cos(t);

% Generate discrete time points with different sampling intervals
t_disc1 = create_disc(0.1);
t_disc2 = create_disc(0.5);
t_disc3 = create_disc(0.9);

% Calculate the function values at the discrete time points
y_disc1 = f(t_disc1);
y_disc2 = f(t_disc2);
y_disc3 = f(t_disc3);

% Create the first subplot with sampling interval 0.1
subplot(3, 1, 1); 
stem(t_disc1, y_disc1);
title('Discrete Plot of f(t) = cos(t) * cos(t) with Sampling Interval = 0.1');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

% Create the second subplot with sampling interval 0.5
subplot(3, 1, 2); 
stem(t_disc2, y_disc2);
title('Discrete Plot of f(t) = cos(t) * cos(t) with Sampling Interval = 0.5');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

% Create the third subplot with sampling interval 0.9
subplot(3, 1, 3); 
stem(t_disc3, y_disc3);
title('Discrete Plot of f(t) = cos(t) * cos(t) with Sampling Interval = 0.9');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

% Add a supertitle for the figure
sgtitle('Sujay Vivek - 22EE30029');
