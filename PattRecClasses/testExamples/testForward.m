A=[.9 .1 0; 0 0.9 0.1];
p0=[1; 0];
mc=MarkovChain(p0,A);

pDgen(1)=GaussD('Mean',0,'StDev',1);
pDgen(2)=GaussD('Mean',3,'StDev',2);

hmm = HMM(mc, pDgen);

X = [-0.2 2.6 1.3];

[p1, logS1] = pDgen(1).prob(X);
[p2, logS2] = pDgen(2).prob(X);

[alfaHat, c] = forward(mc, [p1*exp(logS1); p2*exp(logS2)]);

display(alfaHat);
display(c);
