% Define the values of theta
theta_vals = [pi/6, pi/3, pi/2];

% Frequency range from -pi to pi
omega = linspace(-pi, pi, 1000);

figure;
hold on;

for i = 1:length(theta_vals)
    theta = theta_vals(i);
    
    Hf = 1 - 2*cos(theta)*exp(-1i*omega) + exp(-2i*omega);
    
    Hf_magnitude = abs(Hf);
    
    plot(omega, Hf_magnitude, 'DisplayName', ['\theta = ', num2str(theta)]);
end


title('Magnitude of the Frequency Response |H_f(e^{j\omega})|');
xlabel('Frequency (\omega)');
ylabel('Magnitude');
legend;
grid on;
hold off;
