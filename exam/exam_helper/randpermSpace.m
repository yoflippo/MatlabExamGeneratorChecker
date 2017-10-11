function [ output_args ] = randpermSpace(nIndices)

%% Between random indices the value has to be more than 1
randInd = randperm(nIndices);
if nIndices > 5
    res = sum(ismember(abs(diff(randInd)),1));
    while res ~= 0
        randInd = randperm(nIndices);
        res = sum(ismember(abs(diff(randInd)),1));
    end
end
output_args = randInd;
end

