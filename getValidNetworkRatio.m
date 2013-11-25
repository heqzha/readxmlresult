function [ validNumNetworkRatio] = getValidNetworkRatio( protocol )
validNumNetwork = 0;
numOfNetwork = size(protocol,2);
for i = 1:numOfNetwork
    numReNodesZOR = str2double(protocol(i).networkID.numReMsgNodesZOR);
    if numReNodesZOR > 0
        validNumNetwork = validNumNetwork + 1;
    end
end
validNumNetworkRatio = validNumNetwork / numOfNetwork;
end

