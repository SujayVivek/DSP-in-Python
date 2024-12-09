function X = DFTsum(x)
    N = length(x);
    n = 0:N-1;
    k = 0:N-1;

    W = exp(-1i * 2 * pi / N * (k' * n));
    X = W * x(:);
end

function A = DFTmatrix(N)
    A = zeros(N, N);
    for k = 1:N
        for n = 1:N
            A(k,n) = exp(-1j*2*pi*(k-1)*(n-1)/N);
        end
    end
end


N = 512;
x = cos(2 * pi * (0:N-1) / 10);


% Measure CPU time using DFTsum
start_time_dftsum = cputime;
X_dftsum = DFTsum(x);
time_dftsum = cputime - start_time_dftsum;


% Measure CPU time using matrix multiplication
A = DFTmatrix(N);
start_time_matrix = cputime;
X_matrix = A * x.';
time_matrix = cputime - start_time_matrix;


fprintf('CPU time for DFTsum: %f seconds\n', time_dftsum);
fprintf('CPU time for matrix multiplication: %f seconds\n', time_matrix);