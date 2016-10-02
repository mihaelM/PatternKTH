function [] = plotPrimitiveMFCCS (name, mfccs, t_res)

figure();
plot(t_res, mfccs);
title(sprintf('%s cepstrogram raw', name));
xlabel('Time/s')
ylabel('Cepstral coefficients raw')