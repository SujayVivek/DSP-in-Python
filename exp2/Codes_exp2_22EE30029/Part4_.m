function y = S3(x)
    N = length(x);
    y = zeros(1, N);
    for n = 2:N
        y(n) = x(n) - 0.5 * x(n-1);
    end
    y(1) = x(1); % Since there is no previous value, only x[1] contributes
end

% Impulse signal delta[n]
n = -10:10;
delta = (n == 0);

% Apply S3 to the impulse signal
y_S3 = S3(delta);

% Apply S2 to the impulse signal
y_S2 = filter(1, [1 -0.5], delta);

% Apply S3 to the output of S2
y_S3S2 = S3(y_S2);

% Plotting
figure;

% Plot impulse response of S3
subplot(2,1,1);
stem(n, y_S3);
title('Impulse Response of S3');
xlabel('n');
ylabel('y[n]');
grid on;

% Plot impulse response of S3(S2)
subplot(2,1,2);
stem(n, y_S3S2);
title('Impulse Response of S3(S2(\delta[n]))');
xlabel('n');
ylabel('y[n]');
grid on;

% Adjust layout
sgtitle('Name: Sujay Vivek - Roll No: 22EE30029');