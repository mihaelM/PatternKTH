function [] = task5
%Code for task 5, same as in the task 4 but with means equal to 0.

A=[.99 .01; .03 .97];
p0=[0.75;0.25];
mc=MarkovChain(p0,A);

nPaths = 500;

pDgen(1)=GaussD('Mean',0,'StDev',1);
pDgen(2)=GaussD('Mean',0,'StDev',2);

hmm = HMM(mc, pDgen);

outPut = hmm.rand(nPaths);

x = linspace (1, nPaths, nPaths);
plot(x, outPut);
title ('5. HMM behaviour');
xlabel ('Time');
ylabel ('Samples');