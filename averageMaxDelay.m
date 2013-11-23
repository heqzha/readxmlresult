function [ aveMaxDelay ] = averageMaxDelay( protocol )
delayData = [];
numOfNetwork = size(protocol,2);
for i = 1:numOfNetwork
    delayData(i) = str2double(protocol(i).networkID.DelayT);
end

processedDelayData = dataProcess(delayData);
aveMaxDelay = average(processedDelayData);

end

