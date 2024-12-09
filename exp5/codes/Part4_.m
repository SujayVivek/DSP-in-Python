% Load pcm data
load pcm.mat;
fs = 8000; 
mod_freq = 3146;
theta = 2 * pi * (mod_freq / fs); 

% Plot time domain samples for indices 100 to 200
figure;
subplot(2, 1, 1);
plot(100:200, pcm(100:200));
title('Original pcm Signal (Time Domain)');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;
    set(gca, 'FontSize', 15);


% Calculate and plot DTFT for the original pcm signal over indices 100 to 1100
N = 1001; 
[X, w] = DTFT(pcm(100:1100), N);
subplot(2, 1, 2);
plot(w, abs(X));
title('Magnitude of DTFT for Original Signal');
xlabel('Frequency (rad/sample)');
ylabel('|X(\omega)|');
xlim([-pi pi]);
grid on;
    set(gca, 'FontSize', 15);

% Define IIR filter function
function y = IIRfilter(x, theta, r)
    N = length(x);
    y = zeros(1, N);
    for n = 1:N
        y(n) = (1 - r) * x(n);
        if n > 1
            y(n) = y(n) + 2 * r * cos(theta) * y(n-1);
        end
        if n > 2
            y(n) = y(n) - r^2 * y(n-2);
        end
    end
end

r = 0.99999;
filtered_pcm = IIRfilter(pcm, theta, r);

figure;
subplot(2, 1, 1);
plot(100:200, filtered_pcm(100:200));
title('Filtered pcm Signal (Time Domain)');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;
    set(gca, 'FontSize', 15);


% Calculate and plot DTFT for the filtered signal over indices 100 to 1100
[Y, w] = DTFT(filtered_pcm(100:1100), N);
subplot(2, 1, 2);
plot(w, abs(Y));
title('Magnitude of DTFT for Filtered Signal');
xlabel('Frequency (rad/sample)');
ylabel('|Y(\omega)|');
xlim([-pi pi]);
grid on;
    set(gca, 'FontSize', 15);


% Zoom into DTFT around [theta - 0.02, theta + 0.02]
theta_range = [theta - 0.02, theta + 0.02];
figure;
plot(w, abs(Y));
title('Zoomed Magnitude of DTFT Around \theta');
xlabel('Frequency (rad/sample)');
ylabel('|Y(\omega)|');
xlim(theta_range);
grid on;
    set(gca, 'FontSize', 15);
