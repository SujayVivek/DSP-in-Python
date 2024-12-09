% Defining the sampling periods
ts_val = [1/10, 1/3, 1/2, 10/9];

% Define the ranges for n
n_ranges = {0:100, 0:30, 0:20, 0:9};

%Create a new figure
figure;

% Loop through each Ts values
for i = 1:length(ts_val)
    Ts = ts_val(i);
    n = n_ranges{i};

    xn  = sin(2*pi*Ts*n);
    subplot(2,2,i);
    stem(n, xn, 'filled');
    %Labelling the axes and title
    xlabel('n');
    ylabel(['x[n] for T_s =', num2str(Ts)]);
    title(['T_s =', num2str(Ts)]);

    axis([min(n), max(n), -1, 1]);
    grid on;
end

sgtitle('Discrete Time Signal x[n] = sin(2*piT_sn) for Different Sampling Periods');
