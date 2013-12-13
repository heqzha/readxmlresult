function [VehicleDensity, ZORRange, BuildingRoadDensityRatio, Delay, PDR, E, stdDelay] = getPerformMetrics( usecase )
[Dummy, Flooding, DRG,DTSG, ROVER] = protocol(usecase);

VehicleDensity = vehicleDensity(Flooding);
ZORRange = zorRange(Flooding);
BuildingRoadDensityRatio = buildingRoadRatio(Flooding);

[stdFloodingDelay] = stdOneHopDelay(Flooding);
[stdDrgDelay] = stdOneHopDelay(DRG);
[stdDtsgDelay] = stdOneHopDelay(DTSG);
[stdRoverDelay] = stdOneHopDelay(ROVER);

[idealDelay] = averageOneHopDelay(Dummy);
[floodingDelay] = averageOneHopDelay(Flooding);
[drgDelay] = averageOneHopDelay(DRG);
[dtsgDelay] = averageOneHopDelay(DTSG);
[roverDelay] = averageOneHopDelay(ROVER);

[idealPDR] = averagePDR(Dummy);
[floodingPDR] = averagePDR(Flooding);
[drgPDR] = averagePDR(DRG);
[dtsgPDR] = averagePDR(DTSG);
[roverPDR] = averagePDR(ROVER);

delays = [floodingDelay, drgDelay, dtsgDelay, roverDelay];
averDelay = mean(delays);
[delayGaussE] = getGauss(delays, averDelay, 0);

[floodingE] = efficiency(delayGaussE(1), floodingPDR);
[drgE] = efficiency(delayGaussE(2), drgPDR);
[dtsgE] = efficiency(delayGaussE(3), dtsgPDR);
[roverE] = efficiency(delayGaussE(4), roverPDR);

Delay = [floodingDelay, drgDelay, dtsgDelay, roverDelay];
PDR = [floodingPDR, drgPDR, dtsgPDR, roverPDR];
E = [floodingE, drgE, dtsgE, roverE];
stdDelay = [stdFloodingDelay, stdDrgDelay, stdDtsgDelay, stdRoverDelay];
end

