N = 20;
n = 0:N-1;
w = -pi:0.01:pi;
xn = cos(pi*n/4);
j = sqrt(-1);

[Xtr, w1] = DTFT(xn, 512);

%window creation
n_full = -200:1:200;
x_full = cos(pi*n_full/4);
h_win = zeros(1, length(n_full));
h_win(n_full < 20 & n_full >= 0) = hamming(20);

xtr2 = x_full .* h_win;

% DTFT of windowed signal
[Xtr2, w2] = DTFT(xtr2, 512);

figure;
subplot(2,1,1);
plot(w1, abs(Xtr));
title('Using rectangular window');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
set(gca, 'FontSize', 15);

grid on;

subplot(2,1,2);
plot(w2, abs(Xtr2));
title('Using Hamming window');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
set(gca, 'FontSize', 15);

grid on;

sgtitle('Magnitude Response of Xtr(e^j^\omega) - Sujay Vivek (22EE30029)');
