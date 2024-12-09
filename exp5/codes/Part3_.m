% Parameters
theta = pi / 3;     
r_values = [0.99, 0.9, 0.7]; 

% Frequency vector for plotting
w = linspace(-pi, pi, 1000);
figure;

for i = 1:length(r_values)
    r = r_values(i);
    
    H_i = (1 - r) ./ (1 - 2 * r * cos(theta) * exp(-1j * w) + r^2 * exp(-2j * w));
    H_i_mag = abs(H_i);
    
    subplot(3, 1, i);
    plot(w, H_i_mag, 'LineWidth', 1.5);
    title(['Magnitude of Frequency Response for r = ', num2str(r)]);
    xlabel('Frequency (\omega)');
    ylabel('|H_i(e^{j\omega})|');
    set(gca, 'FontSize', 15);
    grid on;
end

sgtitle('Sujay Vivek 22EE30029');
