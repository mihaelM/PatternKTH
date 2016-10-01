function [] = plot4 (name1, name2, t1, f1, spectra1, mfccs1, t2, f2, spectra2, mfccs2)
%fst row man + woman spectra
%snd row man + woman cepstra
figure();

subplot('221');
imagesc(t1, f1, 10*log10(spectra1));
colorbar; axis xy;  
title(sprintf('%s spectogram', name1));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('222');
imagesc(t2, f2, 10*log10(spectra2));
colorbar; axis xy;  
title(sprintf('%s spectogram', name2));
xlabel('Time/s')
ylabel('Frequency/Hz')

subplot('223')
imagesc(t1, [], mfccs1);
colorbar; axis xy;  
title(sprintf('%s cepstogram', name1));
xlabel('Time/s')
ylabel('Cepstral coefficients')

subplot('224')
imagesc(t2, [], mfccs2);
colorbar; axis xy;  
title(sprintf('%s cepstogram', name2));
xlabel('Time/s')
ylabel('Cepstral coefficients')

