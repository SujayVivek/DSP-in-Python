% Discrete-time function x1[n] for different values

% Range of n
n = -20:20; 


u = (n>=0) - (n>=10);

a_values = [0.8, 1.0, 1.5]; %different a values

figure;
orient('tall') %As given the the question for preventing overcrowding of subplots

for i = 1:length(a_values)
    a = a_values(i);
    x1 = a.^n .*u; %Compute x1[n]
    subplot(3,1,i);
    stem(n,x1,'filled');
    title(['Discrete-Time Function x_1[n] for a= ' num2str(a)]);
    grid on;

    sgtitle('Sujay Vivek - 22EE30029');
end


%Discrete-time function x2[n] for omega = pi/4 and different values of a
n2 = -1:10;

u2 = (n2 >= 0);

omega = pi/4;
figure;
orient('tall');

for i = 1:length(a_values)
    a = a_values(i);
    x2 = cos(omega * n2) .* (a .^n2) .*u2;
    subplot(3,1,i);
    stem(n2,x2,'filled');
    xlabel('n');
    ylabel(['x2[n] for a =', num2str(a)]);
    title(['Discrete-Time Function x_2[n] for a =', num2str(a)]);
    grid on;

    sgtitle('Sujay Vivek - 22EE30029');
end






