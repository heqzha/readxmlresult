function [VehicleDensity, ZORRange, BuildingRoadDensityRatio, Delay, PDR, E ] = getPerformMetrics( usecase )
[Dummy, Flooding, DRG,DTSG, ROVER] = protocol(usecase);

VehicleDensity = vehicleDensity(Flooding);
ZORRange = zorRange(Flooding);
BuildingRoadDensityRatio = buildingRoadRatio(Flooding);

[IdealDelay] = averageOneHopDelay(Dummy);
[floodingDelay] = averageOneHopDelay(Flooding);
[drgDelay] = averageOneHopDelay(DRG);
[dtsgDelay] = averageOneHopDelay(DTSG);
[roverDelay] = averageOneHopDelay(ROVER);

[IdealPDR] = averagePDR(Dummy);
[floodingPDR] = averagePDR(Flooding);
[drgPDR] = averagePDR(DRG);
[dtsgPDR] = averagePDR(DTSG);
[roverPDR] = averagePDR(ROVER);

comparisonSpeed = 1.0/IdealDelay;
[floodingE] = efficiency(1.0/floodingDelay, comparisonSpeed, floodingPDR,IdealPDR);
[drgE] = efficiency(1.0/drgDelay, comparisonSpeed, drgPDR,IdealPDR);
[dtsgE] = efficiency(1.0/dtsgDelay, comparisonSpeed, dtsgPDR,IdealPDR);
[roverE] = efficiency(1.0/roverDelay, comparisonSpeed, roverPDR,IdealPDR);

Delay = [floodingDelay, drgDelay, dtsgDelay, roverDelay];
PDR = [floodingPDR, drgPDR, dtsgPDR, roverPDR];
E = [floodingE, drgE, dtsgE, roverE];

end

