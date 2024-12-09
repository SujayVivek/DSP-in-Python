function X = FFT8(x)
    if length(x) ~= 8
        error('Input must be a length of 8');
    end
    x_even = x(1:2:end);
    x_odd = x(2:2:end);
 
    X_even = FFT4(x_even);
    X_odd = FFT4(x_odd);
    
    W_8 = exp(-1j * 2 * pi * (0:3) / 8);
    
    X = zeros(1, 8);
    for k = 1:4
        X(k) = X_even(k) + W_8(k) * X_odd(k);
        X(k + 4) = X_even(k) - W_8(k) * X_odd(k);
    end
end
