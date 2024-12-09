w = -5*pi:pi*0.01:5*pi;
N = 20;
j = sqrt(-1);
n = -5:2:5;

%expression of W
W = (1-exp(-j*w*N))./(1-exp(-j*w));
for i = 1:length(n)
    W(w == n(i)*pi) = N;
end

figure;

subplot(2,1,1);
plot(w, abs(W));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
set(gca, 'FontSize', 15);
grid on;

subplot(2,1,2);
plot(w, angle(W));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase');  
set(gca, 'FontSize', 15);

grid on;

sgtitle('Magnitude & Phase Response of W(e^j^\omega) -Sujay Vivek (22EE30029)')