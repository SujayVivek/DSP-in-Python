N = 20;
x = hamming(N);


[X, w] = DTFTsamples(x);

figure;
stem(w, abs(X), "filled", Color='g', MarkerFaceColor='c');
title('Magnitude of DTFT Samples of Hamming Window (N=20) - Sujay Vivek (22EE30029)');
xlabel('Frequency (rad/sample)');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;