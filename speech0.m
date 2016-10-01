addpath('Sounds/');
addpath('GetSpeechFeatures/')

[data_fem, fs_fem] = audioread('female.wav');
[data_male, fs_male] = audioread('male.wav');
[data_music, fs_music] = audioread('music.wav');

ncep = 13; % usual value
windowLength = 0.03; % usual value
[mfccs_fem, spectogram_fem, f_fem, t_fem] = GetSpeechFeatures(data_fem, fs_fem, windowLength, ncep);
[mfccs_male, spectogram_male, f_male, t_male] = GetSpeechFeatures(data_male, fs_male, windowLength, ncep);
[mfccs_music, spectogram_music, f_music, t_music] = GetSpeechFeatures(data_music, fs_music, windowLength, ncep);

%normalized versions follow
mfccs_fem_n = normM (mfccs_fem, t_fem);
mfccs_male_n = normM (mfccs_male, t_male);
mfccs_music_n = normM (mfccs_music, t_music);

plotPrimitive('Woman', data_fem, fs_fem);
plotPrimitive('Music', data_music, fs_music);

plotParalel('Woman', t_fem, f_fem, spectogram_fem, mfccs_fem_n);
plotParalel('Music', t_music, f_music, spectogram_music, mfccs_music_n);

plotParalelRaw('Woman', t_fem, f_fem, spectogram_fem, mfccs_fem); %alternate with mfccs_fem_n
%plotParalelRaw('Man', t_male, f_male, spectogram_male, mfccs_male);
plotParalelRaw('Music', t_music, f_music, spectogram_music, mfccs_music);

plot4('Man', 'Woman', t_male, f_male, spectogram_male, mfccs_male_n, t_fem, f_fem, spectogram_fem, mfccs_fem_n);

% We choose music signal
%spectral
spectral_corr = corr(spectogram_music');
figure();
imagesc(abs(spectral_corr));
colormap gray; colorbar();
title('Correlation of spectral coefficients');

cepstra_corr = corr(mfccs_music_n');
figure();
imagesc(abs(cepstra_corr));
colormap gray; colorbar();
title('Correlation of cepstral coefficients');



