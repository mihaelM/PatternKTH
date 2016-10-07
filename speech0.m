%main script 
addpath('Sounds/');
addpath('GetSpeechFeatures/')

[data_fem, fs_fem] = audioread('female.wav');
[data_male, fs_male] = audioread('male.wav');
[data_music, fs_music] = audioread('music.wav');

ncep = 13; % usual value
windowLength = 0.03; % usual value
[mfccs_fem, spectrogram_fem, f_fem, t_fem] = GetSpeechFeatures(data_fem, fs_fem, windowLength, ncep);
[mfccs_male, spectrogram_male, f_male, t_male] = GetSpeechFeatures(data_male, fs_male, windowLength, ncep);
[mfccs_music, spectrogram_music, f_music, t_music] = GetSpeechFeatures(data_music, fs_music, windowLength, ncep);

%length(mfccs_fem) = length(t_fem) = 129
%length(f_fem) = 1025

%display(size(spectrogram_fem, 1)); %1025, fst dimension is number of rows
%display(size(spectrogram_fem, 2)); %129, snd dimension in number of columns
%display(size(mfccs_fem, 1)); %13, fst dimension is number of rows

%normalized versions follow
mfccs_fem_n = normM (mfccs_fem, length(t_fem));
mfccs_male_n = normM (mfccs_male, length(t_male));
mfccs_music_n = normM (mfccs_music, length(t_music));

plotPrimitive('Woman', data_fem, fs_fem);
plotPrimitive('Music', data_music, fs_music);

plotSpectogram('Woman', spectrogram_fem);
plotSpectogram('Music', spectrogram_music);

%plotPrimitiveMFCCS('Woman mfccs', mfccs_fem, t_fem); %u
%plotPrimitiveMFCCS('Music mfccs', mfccs_music, t_music);

plotParalel('Woman', spectrogram_fem, mfccs_fem_n);
plotParalel('Music', spectrogram_music, mfccs_music_n);

%comparison of spectrogram with mfccs raw values
plotParalelRaw('Woman', t_fem, spectrogram_fem, mfccs_fem); 
plotParalelRaw('Music', t_music, spectrogram_music, mfccs_music); 

plot4('Man', 'Woman', spectrogram_male, mfccs_male_n, spectrogram_fem, mfccs_fem_n);

% We choose music signal
% try with female
%correlations coefficients between the different spectral or cepstral coefficient time series 
%so that means we have to invert matrix
spectral_corr = corr(10*log10(spectrogram_fem'));
figure();
imagesc(abs(spectral_corr));
colormap gray; colorbar();
title('Correlation of spectral coefficients');

cepstra_corr = corr(mfccs_fem_n');
figure();
imagesc(abs(cepstra_corr));
colormap gray; colorbar();
title('Correlation of cepstral coefficients');



