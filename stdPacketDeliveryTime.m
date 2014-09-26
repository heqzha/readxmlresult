function [ std_packet_delivery_time ] = stdPacketDeliveryTime( protocol )
%STDPACKETDELIVERYTIME Summary of this function goes here
%   Detailed explanation goes here

delivery_time_and_hops = [];
numOfNetwork = size(protocol,2);
for i = 1:numOfNetwork
    delivery_time_and_hops(1,i) = str2double(protocol(i).networkID.DelayT);
    delivery_time_and_hops(2,i) = str2double(protocol(i).networkID.maxHops);
end

processedData = dataProcess(delivery_time_and_hops);
std_packet_delivery_time = std(processedData(1,:));
end

