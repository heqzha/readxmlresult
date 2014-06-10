function [ std_delay_time_per_hop ] = stdDelayTimePerHop( protocol )
delayHopData = [];
numOfNetwork = size(protocol,2);
for i = 1:numOfNetwork
    delayHopData(1,i) = str2double(protocol(i).networkID.DelayT);
    delayHopData(2,i) = str2double(protocol(i).networkID.maxHops);
end

processedDelayHopData = dataProcess(delayHopData);
oneHopDelay = processedDelayHopData(1,:)./processedDelayHopData(2,:);
std_delay_time_per_hop = std(oneHopDelay);
end

