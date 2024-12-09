g = @(t) sin(pi*t)./(pi*t);  %Function 1

  h = @(t) (abs(t)<=0.5);   %

  gx_vals = linspace(-10,10,1000); %creating time intervals
  gy_vals = g(gx_vals); %Storing all ouput values in 1 variable

  hx_vals = linspace(-1,2,100);
  hy_vals = h(hx_vals); %Storing all the points.

  % Create the subplot for the continuous plot
    subplot(2, 1, 1); % 2 rows, 1 column, 1nd plot in the subplot
plot(gx_vals,gy_vals);
title('function1 plot');
xlabel('time');
ylabel('f(t) = sin(pi*t)/pi*t');
grid on;

% Create the subplot for the continuous plot
subplot(2, 1, 2); % 2 rows, 1 column, 2nd plot in the subplot
plot(hx_vals, hy_vals);
title('function2 plot');
xlabel('time');
ylabel('f(t) = rect(t)');
grid on;

sgtitle('Name: Sujay Vivek, Roll No: 22EE30029');