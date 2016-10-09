function [] = task6
% Test of finite HMM. Matrix is similar to example in book.

A=[.7 .25 0.05; .1 .4 .5];
p0=[1; 0];
mc=MarkovChain(p0,A);

nPaths = 100;
examples = 10000;

pDgen(1)=GaussD('Mean',0,'StDev',1);
pDgen(2)=GaussD('Mean',0,'StDev',2);

t = pDgen(1);
diplay(t.rand(2));

hmm = HMM(mc, pDgen);

display(properties(hmm));

sum = 0;
a = zeros(examples,1);
for i=1:examples
    outPut = hmm.rand(nPaths);
    lent = length(outPut);
    a(i,1) = lent;
    sum = sum + lent;
    %fprintf('Length of HMM: %d\n',lent);
end  
histogram(a);
fprintf('Average measured length: %f\n',sum/examples);

As=[.7 .25 ; .1 .4 ];
resM = ((eye(2)-As)^(-1)*[1;1]);%calculating expected length of Markov chain if it starts from each corresponding state
fprintf('Average calculated length: %f\n',p0'*resM); %calculating expected length of Markov chain indepedant of start state

x = linspace (1, lent, lent);

fprintf('One concrete output follows\n');
plot(x, outPut);
title ('Finite HMM behaviour');
xlabel ('Time')
ylabel ('Samples')