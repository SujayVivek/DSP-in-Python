function I = integ1(N)
    t = linspace(0,2*pi,N+1);
    fx = sin(7*t).*sin(7*t);
    t_dif = 2*pi/N;
    I = t_dif*sum(fx(1:end-1));
end

function J = integ2(N)
    t_val = linspace(0,1,N+1);
    fx = exp(t_val);
    t_diff = 1/N;
    J = t_diff*sum(fx(1:end-1));
end

N_vals = 1:100;
I_vals = zeros(size(N_vals));
J_vals = zeros(size(N_vals));

for i=1:length(N_vals)
    I_vals(i) = integ1(i);
    J_vals(i) = integ2(i);
end


% Create the subplot for the continuous plot
subplot(2, 1, 1); % 2 rows, 1 column, 1nd plot in the subplot
plot(I_vals);
title('Integral 1 plotting');
xlabel('N');
ylabel('f(t) = sin(7t)*sin(7t)');
grid on;

% Create the subplot for the continuous plot
subplot(2, 1, 2); % 2 rows, 1 column, 2nd plot in the subplot
plot(J_vals);
title('Integral 2 plotting');
xlabel('N');
ylabel('f(t) = exp(t)');
grid on;

sgtitle('Sujay Vivek - 22EE30029');