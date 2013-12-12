function [VehicleDensity, ZORRange, BuildingRoadDensityRatio, Delay, PDR, E ] = getPerformMetrics( usecase )
[Dummy, Flooding, DRG,DTSG, ROVER] = protocol(usecase);

VehicleDensity = vehicleDensity(Flooding);
ZORRange = zorRange(Flooding);
BuildingRoadDensityRatio = buildingRoadRatio(Flooding);

[idealValidNetworkRatio] = getValidNetworkRatio(Dummy);
[floodingValidNetworkRatio] = getValidNetworkRatio(Flooding);
[drgValidNetworkRatio] = getValidNetworkRatio(DRG);
[dtsgValidNetworkRatio] = getValidNetworkRatio(DTSG);
[roverValidNetworkRatio] = getValidNetworkRatio(ROVER);

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

[floodingE] = efficiency(floodingValidNetworkRatio, delayGaussE(1), floodingPDR);
[drgE] = efficiency(drgValidNetworkRatio, delayGaussE(2), drgPDR);
[dtsgE] = efficiency(dtsgValidNetworkRatio, delayGaussE(3), dtsgPDR);
[roverE] = efficiency(roverValidNetworkRatio, delayGaussE(4), roverPDR);

Delay = [floodingDelay, drgDelay, dtsgDelay, roverDelay];
PDR = [floodingPDR, drgPDR, dtsgPDR, roverPDR];
E = [floodingE, drgE, dtsgE, roverE];

end

