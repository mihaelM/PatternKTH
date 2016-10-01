function [f1, f2] = task2
%Calculating the relative frequency of occurrences of St = 1 and St = 2.

A=[.99 .01;
   .03 .97];

p0=[0.75;
    0.25];

mc=MarkovChain(p0,A);
nPaths = 5000;

while nPaths <= 20000
    genStates = mc.rand(nPaths);
    f1 = 0;
    f2 = 0;

    for i = 1 : nPaths
        if (genStates(i) == 1)
            f1 = f1 + 1;
        else
            f2 = f2 + 1;
        end
    end

    f1 = double(f1) / nPaths;
    f2 = double(f2) / nPaths;

    fprintf('Sequence length: %d.    Freq of state 1:%f, freq of state 2:%f\n',nPaths,f1,f2);
    nPaths = nPaths + 5000;
end
