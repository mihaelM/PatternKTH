function [] = plotSpectogram(name, spectrogram)
%plots spectogram with given name and data
figure(); 
imagesc(10*log10(spectrogram));
colorbar; axis xy; 
title(sprintf('%s spectrogram', name));
xlabel('Time/s')
ylabel('Frequency/Hz')