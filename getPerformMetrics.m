function [ delay_time_per_hop, packet_delivery_success_ratio, packet_delivery_efficiency, std_delay_time_per_hop ] = getPerformMetrics( protocol, accept_delay_time)
%GETPERFORMMETRICS Summary of this function goes here
%   Detailed explanation goes here
delay_time_per_hop = averDelayTimePerHop(protocol);
packet_delivery_success_ratio = averPacketDeliverySuccessRatio(protocol);

time_efficiency = getGauss(delay_time_per_hop, accept_delay_time, 0);
packet_delivery_efficiency = getPacketDeliveryEfficiency(time_efficiency, packet_delivery_success_ratio);

std_delay_time_per_hop = stdDelayTimePerHop(protocol);
end

