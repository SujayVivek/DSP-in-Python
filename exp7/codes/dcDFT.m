function X = dcDFT(x)
    N = length(x);
    
    x_even = x(1:2:N);
    x_odd = x(2:2:N);

    DFT_even = DFTsum(x_even);
    DFT_odd = DFTsum(x_odd);

    W_N = exp(-1j * 2 * pi * (0:N/2-1) / N);
    DFT_odd_twiddled = DFT_odd .* W_N;

    X = [DFT_even + DFT_odd_twiddled, DFT_even - DFT_odd_twiddled];
end
