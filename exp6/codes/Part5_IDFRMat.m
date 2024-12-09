function A = DFTMatrix(N)
    A = zeros(N, N);
    for k = 1:N
        for n = 1:N
            A(k,n) = exp(-1j*2*pi*(k-1)*(n-1)/N);
        end
    end
end

function B = IDFTMatrix(N)
    B = zeros(N, N);
    for k = 1:N
        for n = 1:N
            B(k,n) = (1/N)* exp(1j*2*pi*(k-1)*(n-1)/N);
        end
    end
end

B5 = IDFTMatrix(5);
N = 0:9;
A = DFTMatrix(10);

B = IDFTMatrix(10);

x1 = [1,0,0,0,0,0,0,0,0,0]';
x2 = [1,1,1,1,1,1,1,1,1,1]';
u = 1:10;
x3 = (exp((1i * pi .* (u-1))/10))';
x4 = (cos((2*pi.*(u-1))/10))';

X1 = A.*x1;
X2 = A.*x2;
X3 = A.*x3;
X4 = A.*x4;

x1_returns = B.*X1;
x2_returns = B.*X2;
x3_returns = B.*X3;
x4_returns = B.*X4;

subplot(2, 2, 1);
stem(N, abs(x1_returns), 'filled', 'MarkerFaceColor','g', 'Color','r');
title('\delta[n]');
xlabel('n');
ylabel('|x[n]|');
set(gca, 'FontSize', 15);

subplot(2, 2, 2);
stem(N, abs(x2_returns), 'filled', 'MarkerFaceColor','b', 'Color','r');
title('u[n]');
xlabel('n');
ylabel('|x(n)|');
set(gca, 'FontSize', 15);

subplot(2, 2, 3);
stem(N, abs(x3_returns), 'filled', 'MarkerFaceColor','c', 'Color','r');
title(' e(j2πn/10)');
xlabel('n');
ylabel('|x(n)|');
set(gca, 'FontSize', 15);

subplot(2, 2, 4);
stem(N, abs(x4_returns), 'filled', 'MarkerFaceColor','m', 'Color','c');
title('cos(2πn/10)');
xlabel('n');
ylabel('|x(n)|');
set(gca, 'FontSize', 15);

sgtitle('Magnitude of IDFT of DFT of X(k) - Sujay Vivek (22EE30029)');