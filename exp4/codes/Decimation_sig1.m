% Load the audio signal
[data, Fs] = audioread('music.au');


sig1 = data(1:2:end);


sound(sig1, Fs);


