% Defining the function

f = @(t) sin(t).*sin(t);

% Creating Sampling Frequencies
Fs1 = 5;
Fs2 = 10;
Fs3 = 20;

% Creating Discrete Time values
t_continuous = linspace(0,10,1000); 

t_discrete1 = 0:1/Fs1:10;   % Sampling Freq = 5
t_discrete2 = 0:1/Fs2:10;   % Sampling Freq = 10
t_discrete3 = 0:1/Fs3:10;   % Sampling Freq = 20

% Calculating the function values
y_cont = f(t_continuous);
y_disc1 = f(t_discrete1);
y_disc2 = f(t_discrete2);
y_disc3 = f(t_discrete3);

% Create the subplot for the continuous plot
subplot(4, 1, 1);
plot(t_continuous, y_cont);
title('Continuous Plot of f(t) = sin(t) * sin(t)');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

% Create the subplot for the discrete plot with Fs1
subplot(4, 1, 2); 
stem(t_discrete1, y_disc1);
title('Discrete Plot of f(t) with Sampling Freq = 5');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

% Create the subplot for the discrete plot with Fs2
subplot(4, 1, 3);
stem(t_discrete2, y_disc2);
title('Discrete Plot of f(t) with Sampling Freq = 10');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

% Create the subplot for the discrete plot with Fs3
subplot(4, 1, 4);
stem(t_discrete3, y_disc3);
title('Discrete Plot of f(t) with Sampling Freq = 20');
xlabel('Time (t)');
ylabel('f(t)');
grid on;

sgtitle('Sujay Vivek - 22EE30029');
