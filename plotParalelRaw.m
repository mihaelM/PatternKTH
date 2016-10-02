function [] = plotParalelRaw(name, t_res, spectogram, mfccs)

figure();

subplot('211')
imagesc(10*log10(spectogram));
colorbar; axis xy;  
title(sprintf('%s spectrogram', name));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('212')
plot(t_res, mfccs);
title(sprintf('%s cepstrogram raw', name));
xlabel('Time/s')
ylabel('Cepstral coefficients')
