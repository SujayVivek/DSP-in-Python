N1 = 50;
n1 = 0:N1-1;
x1 = sin(0.1 * pi * n1);
[X1, w1] = DTFTsamples(x1);

N2 = 200;
n2 = 0:N2-1;
x2 = [sin(0.1 * pi * n1), zeros(1, N2-N1)];
[X2, w2] = DTFTsamples(x2);

figure;
subplot(2,1,1);
plot(w1, abs(X1));
title('N=50');
xlabel('Frequency (rad/sample)');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;
    
subplot(2,1,2);
plot(w2, abs(X2));
title('N=200 (Zero-padded)');
xlabel('Frequency (rad/sample)');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

grid on;

sgtitle('Magnitude of DTFT Samples - Sujay Vivek (22EE30029)')