function [] = plotParalelRaw(name, t_res, f_res, spectogram, mfccs)

figure();

subplot('211')
imagesc(t_res, f_res, 10*log10(spectogram));
colorbar; axis xy;  
title(sprintf('%s spectogram', name));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('212')
plot(t_res, mfccs);
title(sprintf('%s cepstogram raw', name));
xlabel('Time/s')
ylabel('Cepstral coefficients')
