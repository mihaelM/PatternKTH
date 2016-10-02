function [] = plotPrimitiveMFCCS (name, mfccs, t_res)

figure();
plot(t_res, mfccs);
title(sprintf('%s cepstogram raw', name));
xlabel('Time/s')
ylabel('Cepstral coefficients raw')