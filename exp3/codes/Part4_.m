Fs = 1; %Sample freq = 1
n = 0:99; %Sample n values

% Different omega values
omega1 = pi/16;
omega2 = pi/8;
omega3 = pi/4;

% Generate Sine Wave input of different frequencies
x1 = sin(omega1 * n);
x2 = sin(omega2 * n);
x3 = sin(omega3 * n);

% Define the coefficients
a = [0.9]; % Coefficients for y[n-1]
b = [0.3 0.24]; % Coefficients for x[n] and x[n-1]

% Initialize output signals
y1 = zeros(1, length(n));
y2 = zeros(1, length(n));
y3 = zeros(1, length(n));

% Compute outputs using the difference equation
for i = 2:length(n)
    y1(i) = b(1)*x1(i) + b(2)*x1(i-1) + a(1)*y1(i-1);
    y2(i) = b(1)*x2(i) + b(2)*x2(i-1) + a(1)*y2(i-1);
    y3(i) = b(1)*x3(i) + b(2)*x3(i-1) + a(1)*y3(i-1);
end

% Frequency response calculation
omega = linspace(0, pi, 1000);
H = @(w) (0.3 + 0.24 * exp(-1j*w)) ./ (1 - 0.9 * exp(-1j*w));
H_omega = H(omega);
magnitude_response = abs(H_omega);
phase_response = angle(H_omega);

% Impulse response
impulse_response = filter(b, [1 -a], [1 zeros(1, 99)]);

% Plot the results
figure;
% Plot the Sine Wave input and output signals
subplot(3, 1, 1);
plot(n, x1, 'm', 'DisplayName', 'Input Signal (ω = π/16)');
hold on;
plot(n, y1, 'c', 'DisplayName', 'Output Signal (ω = π/16)');
xlabel('n');
ylabel('Amplitude');
title('Input and Output Signals for ω = π/16');
legend;
grid on;

subplot(3, 1, 2);
plot(n, x2, 'g', 'DisplayName', 'Input Signal (ω = π/8)');
hold on;
plot(n, y2, 'b', 'DisplayName', 'Output Signal (ω = π/8)');
xlabel('n');
ylabel('Amplitude');
title('Input and Output Signals for ω = π/8');
legend;
grid on;

subplot(3, 1, 3);
plot(n, x3, 'c', 'DisplayName', 'Input Signal (ω = π/4)');
hold on;
plot(n, y3, 'y', 'DisplayName', 'Output Signal (ω = π/4)');
xlabel('n');
ylabel('Amplitude');
title('Input and Output Signals for ω = π/4');
legend;
grid on;

sgtitle("Name: Sujay Vivek - Roll No: 22EE30029")
% Plot the impulse response and frequency response
figure;
subplot(3, 1, 1);
stem(0:99, impulse_response, 'filled' , 'r');
xlabel('n');
ylabel('Amplitude');
title('Impulse Response');
grid on;

subplot(3, 1, 2);
plot(omega, magnitude_response , 'g');
xlabel('ω');
ylabel('|H(e^{jω})|');
title('Magnitude Response');
grid on;

subplot(3, 1, 3);
plot(omega, phase_response, 'c');
xlabel('ω');
ylabel('Phase (radians)');
title('Phase Response');
grid on;

sgtitle("Name: Sujay Vivek - Roll No: 22EE30029")