function R=rand(pD,nData)
%R=rand(pD,nData) returns random scalars drawn from given Discrete Distribution.
%
%Input:
%pD=    DiscreteD object
%nData= scalar defining number of wanted random data elements
%
%Result:
%R= row vector with integer random data drawn from the DiscreteD object pD
%   (size(R)= [1, nData]
%
%----------------------------------------------------
%Code Authors: Mihael Marovic, Luka Zmegac
%----------------------------------------------------
if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end;

numOfElems = length(pD.ProbMass);
%display(numOfElems)

distFun = zeros(1, numOfElems);
cumulativeSum = 0;

for i = 1 : numOfElems
    cumulativeSum = cumulativeSum + pD.ProbMass(i);
    distFun(i) = cumulativeSum;
end
R = zeros(1, nData);
for i = 1 : nData
    x = rand;
    for j = 1 : numOfElems
        if x <= distFun(j) 
            R(i) = j;
            break
        end
    end
end



