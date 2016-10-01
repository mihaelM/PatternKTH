function [] = plotParalel(name, t_res, f_res, spectogram, mfccs_n)

figure();

subplot('211')
imagesc(t_res, f_res, 10*log10(spectogram));
colorbar; axis xy;  
title(sprintf('%s spectogram', name));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('212')
imagesc(t_res, [], mfccs_n);
colorbar; axis xy;  
title(sprintf('%s cepstogram', name));
xlabel('Time/s')
ylabel('Cepstral coefficients')
