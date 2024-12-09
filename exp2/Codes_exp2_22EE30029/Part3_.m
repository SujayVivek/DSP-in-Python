%Given difference eqn of S1
% y[n] = x[n] - x[n-1]

function  y = S1(x)
    y = zeros(size(x));
    for n = 2:length(x)
        y(n) =  x(n) - x(n-1);
    end
end

%Given difference eqn of S2
% y[n] = 0.5* y[n-1] + x[n]
function y = S2(x)
    y = zeros(size(x));
    for n = 2:length(x)
        y(n) = 0.5 * y(n-1) + x(n);
    end
end

%Defining the signal
n = 0:50;  
x = zeros(size(n));

%Giving impulse at n = 25;
x(26) = 1;  

% Calculate the impulse responses
h_S1 = S1(x);
h_S2 = S2(x);
h_S1_S2 = S1(S2(x));
h_S2_S1 = S2(S1(x));
h_S1_plus_S2 = S1(x) + S2(x);

% Plot the impulse responses
figure;

subplot(1,1,1);
stem(n, h_S1);
title('Impulse Response of S1');
xlabel('n');
ylabel('h_S1[n]');
sgtitle('Name : Sujay Vivek - Roll No: 22EE30029')

figure;

subplot(1,1,1);
stem(n, h_S2);
title('Impulse Response of S2');
xlabel('n');
ylabel('h_S2[n]');
sgtitle('Name : Sujay Vivek - Roll No: 22EE30029')

figure;

subplot(1,1,1);
stem(n, h_S1_S2);
title('Impulse Response of S1(S2)');
xlabel('n');
ylabel('h_{S1(S2)}[n]');
sgtitle('Name : Sujay Vivek - Roll No: 22EE30029')

figure;

subplot(1,1,1);
stem(n, h_S2_S1);
title('Impulse Response of S2(S1)');
xlabel('n');
ylabel('h_{S2(S1)}[n]');
sgtitle('Name : Sujay Vivek - Roll No: 22EE30029')

figure;

subplot(1,1,1);
stem(n, h_S1_plus_S2);
title('Impulse Response of S1 + S2');
xlabel('n');
ylabel('h_{S1+S2}[n]');
sgtitle('Name : Sujay Vivek - Roll No: 22EE30029')
