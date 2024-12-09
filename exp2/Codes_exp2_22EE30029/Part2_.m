%Defining the function
x = @(t) sin(2*pi*t);

%Defining the time intervals
T1 = 0.1;
T2 = 0.01;

%Defining the discrete time values
t1 = 0:T1:10;
t2 = 0:T2:10;

%Computing x(t) for both time intervals
x_t1 = x(t1);
x_t2 = x(t2);

%Computing the derivative of the signal

%Creating array of zeros of size t1 AND t2
dx_t1 = zeros(size(t1));
dx_t2 = zeros(size(t2));

%Computing for both
for i = 2:length(t1)
    dx_t1(i) = (x_t1(i) - x_t1(i-1))/T1;
end

for i = 2:length(t2)
    dx_t2(i) = (x_t2(i) - x_t2(i-1))/T2;
end

% Comparing real derivative of x(t)
dx_compare = @(t) 2*pi*cos(2*pi*t); 

% Plot the results
figure;

subplot(3,1,1);
plot(t1, dx_t1, 'b', t1, dx_compare(t1), 'r--');
title('Derivative with T = 0.1');
xlabel('t');
ylabel('dx/dt');
legend('sin(2*pi*T)', '2*pi*cos(2*pi*T)');

subplot(3,1,2);
plot(t2, dx_t2, 'b', t2, dx_compare(t2), 'r--');
title('Derivative with T = 0.001');
xlabel('t');
ylabel('dx/dt');
legend('sin(2*pi*T)', '2*pi*cos(2*pi*T)');

subplot(3,1,3);
plot(t2, dx_t2 - dx_compare(t2));
title('Error between Numerical and Comparitive Derivatives for T = 0.001');
xlabel('t');
ylabel('Error');

