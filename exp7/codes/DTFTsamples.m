function [X, w] = DTFTsamples(x)
    N = length(x);
    X = DFTsum(x);
    w = 2 * pi * (0:N-1) / N;
    w(w >= pi) = w(w >= pi) - 2 * pi;
    X = fftshift(X);
    w = fftshift(w);
end