function [] = plotPrimitive (name, data, fs)

% t = real time => N = sample => t = NT => t = N*(1/fs)

figure();
sizeTrack = length(data);
time = linspace (0, sizeTrack/fs, sizeTrack);
plot (time, data);
title(sprintf('%s graph directly', name));
xlabel('Time');
ylabel('Sound amplitude');

