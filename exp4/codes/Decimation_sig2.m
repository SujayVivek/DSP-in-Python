[data, Fs] = audioread("music.au"); 
lowpass = fir1(20,0.5);

data1 = conv(data, lowpass);

data2=zeros(1,length(data1)/2);

for i = 1:length(data2)
    data2(i) = data1(2*i);
end

sound(data2, Fs);