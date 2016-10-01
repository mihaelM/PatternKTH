function [] = task7
%HMM test HMM where the outputs are Gaussian vector distributions.

A=[.99 .01; .03 .97];
p0=[0.75;0.25];
mc=MarkovChain(p0,A);

nPaths = 3000;

pDgen(1)=GaussD('Mean',[3 1], 'Covariance', [2 1; 1 4] );
pDgen(2)=GaussD('Mean',[-3 -5], 'Covariance', [0.2 0.5; 0.5 5] );

hmm = HMM(mc, pDgen);

outPut = hmm.rand(nPaths);
display(outPut)

x = linspace (1, nPaths, nPaths);
plot(outPut(1,:),outPut(2,:),'m.');
title ('7. HMM behaviour');
xlabel ('1. dimension of output vector')
ylabel ('2. dimension of output vector')

