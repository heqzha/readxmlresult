function [ packet_delivery_success_ratio ] = averPacketDeliverySuccessRatio( protocol )
%AVERPACKETDELIVERYSUCCESSRATIO Summary of this function goes here
%   Detailed explanation goes here
    pdrData = [];
    numOfNetwork = size(protocol,2);
    for i = 1:numOfNetwork
        pdrData(1, i) = str2double(protocol(i).networkID.numReMsgNodesZOR);
        pdrData(2, i) = str2double(protocol(i).networkID.numofNodesZOR);
    end
    processedPDRData = dataProcess(pdrData);
    pdr = processedPDRData(1,:)./processedPDRData(2,:);
    packet_delivery_success_ratio = average(pdr);

end

