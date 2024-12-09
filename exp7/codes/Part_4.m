N = 10;
n = 0:N-1;

x1 = [1, zeros(1, N-1)];
X1 = dcDFT(x1);

x2 = ones(1, N);
X2 = dcDFT(x2);

x3 = exp(1j * 2 * pi * n / N);
X3 = dcDFT(x3);

figure;
subplot(3,1,1);
stem(n, abs(X1), "filled", Color='r', MarkerFaceColor='m');
title('x[n] = \delta[n]');
xlabel('Frequency Index k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;

subplot(3,1,2);
stem(n, abs(X2), "filled", Color='g', MarkerFaceColor='c');
title('x[n] = 1');
xlabel('Frequency Index k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;

subplot(3,1,3);
stem(n, abs(X3), "filled", Color='b', MarkerFaceColor='y');
title('x[n] = e^{j*2\pi*n/10}');
xlabel('Frequency Index k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;

sgtitle('dcDFT of x[n] for N = 10 - Sujay Vivek(22EE30029)')