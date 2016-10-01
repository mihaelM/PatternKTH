function S=rand(mc,T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors: Mihael Marovic, Luka Zmegac
%---------------------------------------------

%important variables
%mc.InitialProb
%mc.TransitionProb
S=zeros(1,T);
nS=mc.nStates; 

discD = DiscreteD(mc.InitialProb);
S(1) = discD.rand(1); 
% display(mc.finiteDuration())returns good value
 
for i = 1 : (T-1)
    transitions = mc.TransitionProb(S(i), :); % for matrix we take row that has probabilities from that state
    discD = DiscreteD(transitions);
    nextState = discD.rand(1);
    if nextState == nS + 1  %if the nextState is also the END state we have to end chain and reduce dimension of S.
        S(i+1:T) = [];
        break;
    else
        S(i+1) = nextState;
    end
end


