% DTFT function to calculate both magnitude and phase responses
function [X, w] = dtft(x, n0, dw)
    N = length(x);
    w = -pi:dw:pi;
    X = zeros(size(w));
    for n = 1:N
        X = X + x(n)*exp(-1i*w*(n+n0-1));
    end
end

%Input Signals
n = 0:20;
x1 = (n == 0);        %δ[n]
x2 = (n == 5);        %δ[n - 5]
x3 = (0.5).^n .* (n >= 0);  %(0.5)^n u[n]

dw = 2*pi/1000;

%Computing the DTFT by calling the function dtft
[X1, w] = dtft(x1, 0, dw);
[X2, w] = dtft(x2, 0, dw);
[X3, w] = dtft(x3, 0, dw);

% Plot magnitude and phase response for each signal
figure;

% Magnitude and Phase for δ[n]
subplot(3,2,1);
plot(w, abs(X1) , 'r');
title('Magnitude Response of DTFT for \delta[n]');
xlabel('Frequency (\omega)');
ylabel('|X(\omega)|');
grid on;

subplot(3,2,2);
plot(w, angle(X1), 'b');
title('Phase Response of DTFT for \delta[n]');
xlabel('Frequency (\omega)');
ylabel('\angle X(\omega)');
grid on;

% Magnitude and Phase for δ[n-5]
subplot(3,2,3);
plot(w, abs(X2), 'r');
title('Magnitude Response of DTFT for \delta[n-5]');
xlabel('Frequency (\omega)');
ylabel('|X(\omega)|');
grid on;

subplot(3,2,4);
plot(w, angle(X2), 'b');
title('Phase Response of DTFT for \delta[n-5]');
xlabel('Frequency (\omega)');
ylabel('\angle X(\omega)');
grid on;

% Magnitude and Phase for (0.5)^n u[n]
subplot(3,2,5);
plot(w, abs(X3), 'r');
title('Magnitude Response of DTFT for (0.5)^n u[n]');
xlabel('Frequency (\omega)');
ylabel('|X(\omega)|');
grid on;

subplot(3,2,6);
plot(w, angle(X3), 'b');
title('Phase Response of DTFT for (0.5)^n u[n]');
xlabel('Frequency (\omega)');
ylabel('\angle X(\omega)');
grid on;

sgtitle("Name: Sujay Vivek - Roll No: 22EE30029")