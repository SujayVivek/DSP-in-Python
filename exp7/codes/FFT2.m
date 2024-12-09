function X = FFT2(x)
    if length(x) ~= 2
        error('Input must be a length of 2');
    end
    
    X = [x(1) + x(2), x(1) - x(2)];
end