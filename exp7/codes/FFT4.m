function X = FFT4(x)
    if length(x) ~= 4
        error('Input must be a length of 4');
    end 
    x_even = x(1:2:end);
    x_odd = x(2:2:end);
    
    X_even = FFT2(x_even);
    X_odd = FFT2(x_odd);
    
    W_4 = exp(-1j * 2 * pi * (0:1) / 4);
    
    X = zeros(1, 4);
    for k = 1:2
        X(k) = X_even(k) + W_4(k) * X_odd(k);
        X(k + 2) = X_even(k) - W_4(k) * X_odd(k);
    end
end