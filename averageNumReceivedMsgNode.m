function [ aveNumReceivedMsgNode ] = averageNumReceivedMsgNode( protocol )
numReceivedMsgNode = [];
numOfNetwork = size(protocol,2);
for i = 1:numOfNetwork
    numReceivedMsgNode(i) = str2double(protocol(i).networkID.numReMsgNodesZOR);
end
processedReceivedMsgNode = dataProcess(numReceivedMsgNode);
aveNumReceivedMsgNode = average(processedReceivedMsgNode);

end

