function X = DFTSum(x)
    N = length(x);
    n = 0:N-1;  
    k = 0:N-1; 
    
    W = exp(-1i * 2 * pi / N * (k' * n));
    
    X = W * x(:);
end

function x = IDFTSum(X)
    N = length(X);
    k = 0:N-1;  
    n = 0:N-1; 
    
    W_inv = exp(1i * 2 * pi / N * (n' * k)) / N;
    x = W_inv * X(:);
end


x1 = [1,0,0,0,0,0,0,0,0,0];  
x2 = [1,1,1,1,1,1,1,1,1,1]; 
u = 1:10;
x3 = exp((1i * pi .* (u-1))/10); 
x4 = cos((2*pi.*(u-1))/10);  


X1 = DFTSum(x1);
X2 = DFTSum(x2);
X3 = DFTSum(x3);
X4 = DFTSum(x4);


x1_returns = IDFTSum(X1);
x2_returns = IDFTSum(X2);
x3_returns = IDFTSum(X3);
x4_returns = IDFTSum(X4);


N = 0:9;

% Plot the magnitude of the IDFTs
figure;

subplot(2, 2, 1);
stem(N, abs(x1_returns), 'filled', 'MarkerFaceColor','g', 'Color','r');
title('X[k] = \delta[n]');
xlabel('n');
ylabel('|x[n]|');
set(gca, 'FontSize', 15);

subplot(2, 2, 2);
stem(N, abs(x3_returns), 'filled', 'MarkerFaceColor','c', 'Color','b');
title('X[k] = e^{j(\pi n / 10)}');
xlabel('n');
ylabel('|x[n]|');
set(gca, 'FontSize', 15);

subplot(2, 2, 3);
stem(N, abs(x2_returns), 'filled', 'MarkerFaceColor','b', 'Color','r');
title('X[k] = u[n]');
xlabel('n');
ylabel('|x[n]|');
set(gca, 'FontSize', 15);

subplot(2, 2, 4);
stem(N, abs(x4_returns), 'filled', 'MarkerFaceColor','m', 'Color','c');
title('X[k] = cos(2\pi n / 10)');
xlabel('n');
ylabel('|x[n]|');
set(gca, 'FontSize', 15);

sgtitle('Magnitude of IDFT of DFT of X[k] - Sujay Vivek (22EE30029)');