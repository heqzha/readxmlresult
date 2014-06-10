 function [ packet_delivery_efficiency ] = getPacketDeliveryEfficiency(time_efficiency, packet_delivery_success_ratio)
     packet_delivery_efficiency =  time_efficiency * packet_delivery_success_ratio;
 end