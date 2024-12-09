%Now trying to print the sin curve withing a given interval
 f = @(t) sin(t);
   a = 3.5;
   b = 4.5;
t_c = linspace(a,b,1000);

y3 = f(t_c);
plot(t_c, y3);
title(["Continous plot of sin(t) in the interval 3.5 to 4.5","Name: Sujay Vivek, Roll No: 22EE30029"]);
xlabel('Time (t)');
ylabel('f(t) = sin(t)');
grid on;


