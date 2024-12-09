f =  -1:0.0001:1;
fc = 0.45;
Ts = 1;
fs = 1/Ts;
N = 20;

Hb = 1./(1+(f./fc).^N);


P = sinc(f./fs);

subplot(2,1,1)
plot(f, Hb, 'b', [fc,fc],[0,1],'r--')
title('\rm Without zero order hold')
xlabel('\omega(Hz)')
ylabel('Gain')
fontsize(scale = 1.9)
grid on

subplot(2,1,2)
plot(f, Hb.*P, 'b', [fc,fc],[0,1],'r--')
title('\rm With zero order hold')
xlabel('\omega(Hz)')
ylabel('Gain')
grid on
