% Load the audio signal
load nspeech1.mat;

% Extract a portion of the signal from indices 100 to 200
sampleIndices = 100:200;
signalSegment = nspeech1(sampleIndices);

% Plot the signal segment
figure;
subplot(1,1,1)
plot(sampleIndices, signalSegment);
title('Time Domain Plot of Original Signal (101 samples)');
xlabel('Sample Index');
ylabel('Amplitude');
sgtitle('Name: Sujay Vivek - Roll No: 22EE30029')
set(gca, 'FontSize', 15);
%Creating a DTFT Function
function [X, w] = DTFT(x, M)
    N = length(x);       
    if M == 0
        M = N;          
    end
    w = linspace(-pi, pi, M);  
    X = zeros(1, M);           
    
    for k = 1:M
        X(k) = sum(x .* exp(-1j * w(k) * (0:N-1))); 
    end
end



% Define the range of samples
dtftIndices = 100:1100;
x = nspeech1(dtftIndices);

% Compute the DTFT
[X, w] = DTFT(x, 0); 

figure;
subplot(1,1,1);
sgtitle('Name: Sujay Vivek - Roll No: 22EE30029');
plot(w, abs(X));
title('Magnitude of DTFT for 1001 samples');
xlabel('Frequency (\omega)');
ylabel('|X(\omega)|');
set(gca, 'FontSize', 15);

%TO FIND THE MAXIMUM FREQUENCY
[Xmax, Imax] = max(abs(X));
theta = w(Imax);  

figure;
plot(w, abs(X));
title('Magnitude of DTFT for 1001 samples');
xlabel('Frequency (\omega)');
ylabel('|X(\omega)|');
grid on;

str = sprintf('Max |X(\\omega)| = %.2f\n\\theta = %.4f rad/s', Xmax, theta);
text(theta, Xmax, str, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 10, 'FontWeight', 'bold');

hold on;
plot(theta, Xmax, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
set(gca, 'FontSize', 15);


%FINDING THE FIR FILTER

function y = FIRfilter(x)
      theta = 1.3258;
    b = [1, -2*cos(theta), 1]; 
    a = 1;  

    y = filter(b, a, x);
end

filteredSignal = FIRfilter(nspeech1);

figure;
subplot(1,1,1);
sgtitle('Name: Sujay Vivek - Roll No: 22EE30029');
plot(sampleIndices, filteredSignal(sampleIndices));
title('Time Domain Plot of Filtered Signal (101 samples)');
xlabel('Sample Index');
ylabel('Amplitude');
set(gca, 'FontSize', 15);

%DTFT OF THE FILTERED SIGNAL

[X_filtered, w_filtered] = DTFT(filteredSignal(dtftIndices), 0);

figure;
subplot(1,1,1);
sgtitle('Name: Sujay Vivek - Roll No: 22EE30029');
plot(w_filtered, abs(X_filtered));
title('Magnitude of DTFT for Filtered Signal (1001 samples)');
xlabel('Frequency (\omega)');
ylabel('|X_{filtered}(\omega)|');
set(gca, 'FontSize', 15);