% function [ efficiency ] = efficiency(speedTx, comparisonSpeedTx, pdr, comparisonPdr)
% efficiency = (speedTx/comparisonSpeedTx) * (pdr/comparisonPdr);
% end

% function [ efficiency ] = efficiency(numReceivedMsgNode, maxDelay)
% efficiency = numReceivedMsgNode / maxDelay;
% end

function [ efficiency ] = efficiency(factor ,speedTx, comparisonSpeedTx, pdr, comparisonPdr)
    efficiency =  (speedTx/comparisonSpeedTx) * (pdr/comparisonPdr);
end