function [ aveNumOfNode ] = averageNumOfNode( protocol )
    numOfNodeData = [];
    numOfNetwork = size(protocol,2);
    for i = 1:numOfNetwork
        numOfNodeData(i) = str2double(protocol(i).networkID.numofNodesZOR);
    end
    processedNumOfNodeData = dataProcess(numOfNodeData);
    aveNumOfNode = average(processedNumOfNodeData);    
end

