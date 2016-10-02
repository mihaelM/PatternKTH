function [] = plotPrimitive (name, data, fs)
%plots function of sound given data (amplitude) and frequncy of sampling
% t = real time => N = sample => t = NT => t = N*(1/fs)

figure();
sizeTrack = length(data);
time = linspace (0, sizeTrack/fs, sizeTrack);
plot (time, data);
title(sprintf('%s graph directly', name));
xlabel('Time');
ylabel('Sound amplitude');

