
N = 20;
x = hamming(N);

X1 = DFTsum(x);
w = 2 * pi * (0:N-1) / N;

X_shifted = fftshift(X1);
w_shifted = fftshift(w);

figure;
stem(w_shifted, abs(X_shifted), "filled", Color='r', MarkerFaceColor='m');
title('Magnitude of DFT of Hamming Window - Sujay Vivek (22EE30029)');
xlabel('Frequency (rad/sample)');
ylabel('|X(k)|');
set(gca, 'FontSize', 15);

grid on;