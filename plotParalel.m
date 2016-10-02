function [] = plotParalel(name, spectogram, mfccs_n)

figure();

%image sc od matrice 2 x 3 napravi sve kak spada ne, 2 reda, 3 stupca
subplot('211')
imagesc(10*log10(spectogram));
% x axis is number of columns i.e. time, y than obviously frequency
colorbar; axis xy;  
title(sprintf('%s spectogram', name));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('212')
imagesc(mfccs_n);
%x is time, y are amplitudes (13 coefs of mfccs per vector)
colorbar; axis xy;  
title(sprintf('%s cepstogram', name));
xlabel('Time/s')
ylabel('Cepstral coefficients')
