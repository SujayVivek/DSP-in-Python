function A = DFTMatrix(N)
    % Create DFT matrix of size N x N
    A = zeros(N, N);
    for k = 1:N
        for n = 1:N
            A(k,n) = exp(-1j*2*pi*(k-1)*(n-1)/N);  % DFT formula
        end
    end
end

% Create DFT matrix for size 10
A = DFTMatrix(10);

% Define input signals
x1 = [1,0,0,0,0,0,0,0,0,0]';  
x2 = [1,1,1,1,1,1,1,1,1,1]';  
u = 1:10;
x3 = (exp((1i * pi .* (u-1))/10))';  
x4 = (cos((2*pi.*(u-1))/10))';  

X1 = A .* x1;
X2 = A .* x2;
X3 = A .* x3;

N = 0:9;

figure;

subplot(3, 1, 1);
stem(N, abs(X1), 'filled', 'MarkerFaceColor','g', 'Color','r');
title('X[k] = \delta[n]');
xlabel('k');
ylabel('|X[k]|');
set(gca, 'FontSize', 15);


subplot(3, 1, 2);
stem(N, abs(X3), 'filled', 'MarkerFaceColor','b', 'Color','r');
title('X[k] = e^{j(\pi n / 10)}');
xlabel('k');
ylabel('|X(k)|');
set(gca, 'FontSize', 15);



subplot(3, 1, 3);
stem(N, abs(X2), 'filled', 'MarkerFaceColor','c', 'Color','r');
title('X[k] = u[n]');
xlabel('k');
ylabel('|X(k)|');
set(gca, 'FontSize', 15);


sgtitle('Magnitude of X(k) (DFT Matrix) - Sujay Vivek (22EE30029)');