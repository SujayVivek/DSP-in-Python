N = 8;
n = 0:N-1;

x1 = [1, zeros(1, N-1)];
X1 = fft_stage(x1);

x2 = ones(1, N);
X2 = fft_stage(x2);

x3 = exp(1j * 2 * pi * n / N);
X3 = fft_stage(x3);

figure;
subplot(3,1,1);
stem(n, abs(X1), "filled", Color='b', MarkerFaceColor='m');
title('x[n] = \delta[n]');
xlabel('Frequency Index k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;

subplot(3,1,2);
stem(n, abs(X2), "filled", Color='r', MarkerFaceColor='g');
title('x[n] = 1');
xlabel('Frequency Index k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;

subplot(3,1,3);
stem(n, abs(X3), "filled", Color='c', MarkerFaceColor='y');
title('x[n] = e^{j*2\pi*n/10}');
xlabel('Frequency Index k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;

sgtitle('fftstage of x[n] for N = 8 -Sujay Vivek (22EE30029)')