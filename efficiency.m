function [ efficiency ] = efficiency(speedTx, comparisonSpeedTx, pdr, comparisonPdr)
efficiency = (speedTx/comparisonSpeedTx) * (pdr/comparisonPdr);
end

