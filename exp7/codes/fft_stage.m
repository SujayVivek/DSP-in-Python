function X = fft_stage(x)
    N = length(x);
    if N == 2
        X = [x(1) + x(2), x(1) - x(2)];
        return;
    end
    even_part = x(1:2:N);
    odd_part = x(2:2:N);
    
    DFT_even = fft_stage(even_part);
    DFT_odd = fft_stage(odd_part);
    k = 0:N/2-1;
    W_N = exp(-1j * 2 * pi * k / N);

    X = zeros(1, N);
    X(1:N/2) = DFT_even + W_N .* DFT_odd;
    X(N/2+1:N) = DFT_even - W_N .* DFT_odd;
end
