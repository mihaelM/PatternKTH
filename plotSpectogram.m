function [] = plotSpectogram(name, t_res, f_res, spectogram)

figure(); 
imagesc(t_res, f_res, 10*log10(spectogram));
colormap gray; colorbar; axis xy;
title(sprintf('%s spectogram', name));
xlabel('Time/s')
ylabel('Frequency/Hz')