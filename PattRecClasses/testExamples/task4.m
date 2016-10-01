function [] = task4
%Code for task 4, we have to test HMM's behavior with 500 continous values.

A=[.99 .01; .03 .97];
p0=[0.75;0.25];
mc=MarkovChain(p0,A);

nPaths = 500;

pDgen(1)=GaussD('Mean',0,'StDev',1);
pDgen(2)=GaussD('Mean',3,'StDev',2);

hmm = HMM(mc, pDgen);

outPut = hmm.rand(nPaths);

x = linspace (1, nPaths, nPaths);
plot(x, outPut);
title ('4. HMM behaviour');
xlabel ('Time')
ylabel ('Samples')

