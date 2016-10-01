function [X,S]=rand(h,nSamples)%[X,S]=rand(h,nSamples);generates a random sequence of data%from a given Hidden Markov Model.%%Input:%h=         HMM object%nSamples=  maximum no of output samples (scalars or column vectors)%%Result:%X= matrix or row vector with output data samples%S= row vector with corresponding integer state values%   obtained from the h.StateGen component.%   nS= length(S) == size(X,2)= number of output samples.%   If the StateGen can generate infinite-duration sequences,%       nS == nSamples%   If the StateGen is a finite-duration MarkovChain,%       nS <= nSamples%%----------------------------------------------------%Code Authors: Mihael Marovic, Luka Zmegac%----------------------------------------------------if numel(h)>1    error('Method works only for a single object');end;S = h.StateGen.rand(nSamples); % we've got the statestotalNum = length(S);dimension = h.DataSize(); % because of gaussians can be more than 1 dim.X = zeros(dimension, totalNum);outDistr = h.OutputDistr; %the array of gaussians for statesfor i = 1 : totalNum    X(:,i) = outDistr(S(i)).rand(1); end