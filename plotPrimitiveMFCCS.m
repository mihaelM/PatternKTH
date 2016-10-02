function [] = plotPrimitiveMFCCS (name, mfccs, t_res)
%plots raw mfccs values in respect to time
figure();
plot(t_res, mfccs);
title(sprintf('%s cepstrogram raw', name));
xlabel('Time/s')
ylabel('Cepstral coefficients raw')