function X = DFTSum(x)
    N = length(x);
    n = 0:N-1;  
    k = 0:N-1;   

    W = exp(-1i * 2 * pi / N * (k' * n));
    X = W * x(:);
end

% Define the signals
x1 = [1,0,0,0,0,0,0,0,0,0];  
x2 = [1,1,1,1,1,1,1,1,1,1]; 
u = 1:10;
x3 = exp((1i * pi .* (u-1))/10); 
x4 = cos((2*pi.*(u-1))/10); 

% Compute the DFTs
X1 = DFTSum(x1);
X2 = DFTSum(x2);
X3 = DFTSum(x3);
X4 = DFTSum(x4);


N = 0:9;

% Plot the magnitude of the DFTs
figure;

subplot(2, 2, 1);
stem(N, abs(X1), 'filled', 'MarkerFaceColor','g', 'Color','r');
title('X[k] = \delta[n]');
xlabel('k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);

subplot(2, 2, 3);
stem(N, abs(X2), 'filled', 'MarkerFaceColor','b', 'Color','r');
title('X(k) = u[n]');
xlabel('k');
ylabel('|X(k)|');
set(gca, 'FontSize', 15);

subplot(2, 2, 2);
stem(N, abs(X3), 'filled', 'MarkerFaceColor','c', 'Color','r');
title('X(k) = e^{j(\pi n / 10)}');
xlabel('k');
ylabel('|X(k)|');
set(gca, 'FontSize', 15);

subplot(2, 2, 4);
stem(N, abs(X4), 'filled', 'MarkerFaceColor','m', 'Color','r');
title('X(k) = cos(2πn/10)');
xlabel('k');
ylabel('|X(k)|');
set(gca, 'FontSize', 15);

sgtitle('Magnitude of X[k] (DFT Sum) - Sujay Vivek(22EE30029)');