% Define time vector
N = 10;
n = -N:N;

% Define impulse signal
impulse = zeros(1, length(n));
impulse(n == 0) = 1;  % Delta function

% Define the systems based on the methods provided

% Method 1: Moving Average
function y = method_1(x)
    % Average over 3 samples
    y = filter(ones(1, 3) / 3, 1, x);
end

% Method 2: Weighted Moving Average
function y = method_2(x)
    % Weighted average: 0.6 * previous output + 0.4 * current input
    y = filter(0.4, [1, -0.6], x);
end

% Method 3: Difference with moving average
function y = method_3(x)
    % Difference with moving average over 3 samples
    y = zeros(size(x));
    y(2:end) = filter([1, 0, -1] / 3, 1, x(2:end));
end

% Calculate impulse responses
h_m1 = method_1(impulse);
h_m2 = method_2(impulse);
h_m3 = method_3(impulse);

% Plotting the impulse responses
figure;

% Plot for Method 1
subplot(3,1,1);
stem(n, h_m1);
title('Impulse Response of Method 1');
xlabel('n');
ylabel('h[n]');

% Plot for Method 2
subplot(3,1,2);
stem(n, h_m2);
title('Impulse Response of Method 2');
xlabel('n');
ylabel('h[n]');

% Plot for Method 3
subplot(3,1,3);
stem(n, h_m3);
title('Impulse Response of Method 3');
xlabel('n');
ylabel('h[n]');

% Adjust the layout
sgtitle('Name - Sujay Vivek - Roll No: 22EE30029');
