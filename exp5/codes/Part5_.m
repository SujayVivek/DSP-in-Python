load nspeech2.mat
fs=8000;
%sound(nspeech2,fs);

function [X,w] = DTFT(x,M)
    N = max(M,length(x));
    N = 2^(ceil(log(N)/log(2)));
    
    % Take the padded fft
    X = fft(x,N);
    w = 2*pi*( (0:(N-1))/N );
    w = w - 2*pi*(w>=pi);
    
    % Shift FFT to go from -pi to pi
    X = fftshift(X);
    w = fftshift(w);

end

function h = LPFtrunc(N)
    wc = 2.0; 
    M = (N - 1) / 2;
    
    h = zeros(1, N);
    for n = 0:N-1
        h(n + 1) = (wc / pi) * sinc((wc / pi) * (n - M));
    end
end


function plotResponse(N)
    h = LPFtrunc(N);
    [H, w] = DTFT(h, 512);
    
    % Plot magnitude response (linear scale)
    figure;
    plot(w, abs(H));
    xlabel('Frequency (rad/sample)');
    ylabel('Magnitude');
    title(['Magnitude Response (Linear) for N = ', num2str(N)]);
    set(gca, 'FontSize', 15);

    hold on;
    xline(-2, '--r', 'Passband edge \omega_p = -2', 'LabelHorizontalAlignment', 'left');
    xline(2, '--r', 'Passband edge \omega_p = 2');
    xline(-pi, '--b', 'Stopband edge \omega_s = -\pi', 'LabelHorizontalAlignment', 'left');
    xline(pi, '--b', 'Stopband edge \omega_s = \pi');
    hold off;
    
    figure;
    plot(w, 20 * log10(abs(H)));
    xlabel('Frequency (rad/sample)');
    ylabel('Magnitude (dB)');
    title(['Magnitude Response (Decibels) for N = ', num2str(N)]);
        set(gca, 'FontSize', 15);

    hold on;
    xline(-2, '--r', 'Passband edge \omega_p = -2', 'LabelHorizontalAlignment', 'left');
    xline(2, '--r', 'Passband edge \omega_p = 2');
    xline(-pi, '--b', 'Stopband edge \omega_s = -\pi', 'LabelHorizontalAlignment', 'left');
    xline(pi, '--b', 'Stopband edge \omega_s = \pi');
    hold off;
end


function plotFilteredSignals(nspeech2, h1, h2)
    filtered_signal1 = conv(nspeech2, h1); % Filtered signal for N1
    filtered_signal2 = conv(nspeech2, h2); % Filtered signal for N2
    

    figure;
    subplot(3, 1, 1);
    plot(filtered_signal1);
    title('Filtered Signal with N = 21');
    xlabel('Sample');
    ylabel('Amplitude');
        set(gca, 'FontSize', 15);

    subplot(3, 1, 2);
    plot(filtered_signal2);
    title('Filtered Signal with N = 101');
    xlabel('Sample');
    ylabel('Amplitude');
        set(gca, 'FontSize', 15);

    subplot(3, 1, 3);
    plot(nspeech2);
    title('Original Noisy Signal');
    xlabel('Sample');
    ylabel('Amplitude');
        set(gca, 'FontSize', 15);

end


N1 = 21;
N2 = 101;

plotResponse(N1);
plotResponse(N2);

h1 = LPFtrunc(N1);
h2 = LPFtrunc(N2);

plotFilteredSignals(nspeech2, h1, h2);

