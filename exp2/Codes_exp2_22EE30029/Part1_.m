%Defining the parameters
N = 10;
n = -10:20;
T = 1; 

%Generating the step function
u = @(n) double(n >=0);

%Generating the required signal now
signal = u(n) - u(n - (N+1));

%Applying the differentiator
diff_sig = zeros(size(signal));

for i = 2:length(n)
    diff_sig(i) = (signal(i) - signal(i-1))/T;
end

%Applying the integrator
inte_sig = zeros(size(signal));

for i = 2:length(n)
    inte_sig(i) = inte_sig(i-1) + signal(i)*T;

end

%Plotting
subplot(3,1,1);
stem(n, signal);
title('Original Signal u[n] - u[n-(N+1)]');
xlabel('n');
ylabel('Amplitude');

subplot(3,1,2);
stem(n, diff_sig);
title('Differentiated Signal');
xlabel('n');
ylabel('Amplitude');

subplot(3,1,3);
stem(n, inte_sig);
title('Integrated Signal');
xlabel('n');
ylabel('Amplitude');

sgtitle('Name: Sujay Vivek - Roll: 22EE30029');