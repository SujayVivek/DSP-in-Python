% Define time vector for testing
N = 50;
n = 0:N-1;

% Define test signals
x1 = sin(2*pi*0.1*n);  % Sinusoidal input signal
x2 = rand(1, N);       % Random input signal
x_delayed = [zeros(1, 5) x1(1:N-5)]; % Delayed signal by 5 samples

% Define the filters
function y = filter_S1(x)
    y = zeros(size(x));
    for i = 2:length(x)
        y(i) = x(i) - x(i-1);
    end
end

function y = filter_S2(x)
    y = zeros(size(x));
    for i = 2:length(x)
        y(i) = 0.5 * y(i-1) + x(i);
    end
end

function y = S3(x)
    a = 3; % random constant a
    b = -2; % random constant b
    y = zeros(size(x));
    for i = 2:length(x)
        y(i) = a * x(i) + b * x(i-1);
    end
end

% Test linearity
y1_x1 = filter_S1(x1);
y1_x2 = filter_S1(x2);
y1_combined = filter_S1(x1 + x2);
linear_test_S1 = y1_x1 + y1_x2;

y2_x1 = filter_S2(x1);
y2_x2 = filter_S2(x2);
y2_combined = filter_S2(x1 + x2);
linear_test_S2 = y2_x1 + y2_x2;

y3_x1 = S3(x1);
y3_x2 = S3(x2);
y3_combined = S3(x1 + x2);
linear_test_S3 = y3_x1 + y3_x2;

% Test time-invariance for S1
y1_x1_delayed = filter_S1(x_delayed);
y1_x1_delayed_response = [zeros(1, 5) y1_x1(1:N-5)];

% Test time-invariance for S2
y2_x1_delayed = filter_S2(x_delayed);
y2_x1_delayed_response = [zeros(1, 5) y2_x1(1:N-5)];

% Test time-invariance for S3
y3_x1_delayed = S3(x_delayed);
y3_x1_delayed_response = [zeros(1, 5) y3_x1(1:N-5)];

% Plot results
figure;

% Linearity tests
subplot(3,2,1);
plot(n, y1_combined);
title('Linearity Test for S1:S1(X1+X2)');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,2);
plot(n, linear_test_S1);
title('Linearity Test for S1:S1(x1)+S1(x2)');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,3);
plot(n, y2_combined);
title('Linearity Test for S2:S2(X1+X2)');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,4);
plot(n, linear_test_S2);
title('Linearity Test for S2:S2(x1)+S2(x2)');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,5);
plot(n, y3_combined);
title('Linearity Test for S3:S3(X1+X2)');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,6);
plot(n, linear_test_S3);
title('Linearity Test for S3:S3(x1)+S3(x2)');
xlabel('n');
ylabel('y[n]');
grid on;

% Adjust layout
sgtitle('Name- Sujay Vivek - Roll No: 22EE30029');

figure;

subplot(3,2,1);
plot(n, y1_x1_delayed);
title('Time-Invariance Test for S1:output to delayed input');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,2);
plot(n, y1_x1_delayed_response);
title('Time-Invariance Test for S1:delayed output');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,3);
plot(n, y2_x1_delayed);
title('Time-Invariance Test for S2:output to delayed input');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,4);
plot(n, y2_x1_delayed_response);
title('Time-Invariance Test for S2:delayed output');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,5);
plot(n, y3_x1_delayed);
title('Time-Invariance Test for S3:output to delayed input');
xlabel('n');
ylabel('y[n]');
grid on;

subplot(3,2,6);
plot(n, y3_x1_delayed_response);
title('Time-Invariance Test for S3:delayed output');
xlabel('n');
ylabel('y[n]');
grid on;

% Adjust layout
sgtitle('Name- Sujay Vivek - Roll No: 22EE30029');
