function [] = plotSpectogram(name, spectogram)

figure(); 
imagesc(10*log10(spectogram));
colorbar; axis xy; 
title(sprintf('%s spectrogram', name));
xlabel('Time/s')
ylabel('Frequency/Hz')