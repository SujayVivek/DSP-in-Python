% Defining the frequency range
dw = 0.01;  % Gap
w = -pi:dw:pi;  % Frequency vector


% Defining the function
H = (0.3 + 0.24 * exp(-1j * w)) ./ (1 - 0.9 * exp(-1j * w));


% Compute magnitude and phase
magnitude_H = abs(H);
phase_H = angle(H);


% Plot magnitude and phase
figure;
% Magnitude plot
subplot(2,1,1);
plot(w, magnitude_H, 'r', LineWidth=2);
title('Magnitude of Frequency Response');
xlabel('\omega');
ylabel('|H(\omega)|');
grid on;
% Phase plot
subplot(2,1,2);
plot(w, phase_H, 'b', LineWidth=2);
title('Phase of Frequency Response');
xlabel('\omega');
ylabel('\angle H(\omega)');
grid on;

sgtitle("Name: Sujay Vivek - Roll No: 22EE30029")