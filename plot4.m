function [] = plot4 (name1, name2, spectra1, mfccs1,spectra2, mfccs2)
%fst row man + woman spectra
%snd row man + woman cepstra
figure();

subplot('221');
imagesc(10*log10(spectra1));
colorbar; axis xy;  
title(sprintf('%s spectogram', name1));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('222');
imagesc(10*log10(spectra2));
colorbar; axis xy;  
title(sprintf('%s spectogram', name2));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('223')
imagesc(mfccs1);
colorbar; axis xy;  
title(sprintf('%s cepstrogram', name1));
xlabel('Time/s')
ylabel('Cepstral coefficients')

subplot('224')
imagesc(mfccs2);
colorbar; axis xy;  
title(sprintf('%s cepstrogram', name2));
xlabel('Time/s')
ylabel('Cepstral coefficients')

