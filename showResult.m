function showResult
constants;
global USECASE_BENCHMARK;
global USECASE_VEHICLE_DENSITY_500;
global USECASE_VEHICLE_DENSITY_1500;
global USECASE_ZOR_ZOF_LENGTH_500;
global USECASE_ZOR_ZOF_LENGTH_1500;
global USECASE_WIDTH_BETWEEN_BUILDING_20;
global USECASE_WIDTH_BETWEEN_BUILDING_60;

[Dummy, Flooding, DRG,DTSG, ROVER] = protocol(USECASE_BENCHMARK);
vd = vehicleDensity(Dummy);
zorR = zorRange(Dummy);
bdRatio = buildingRoadRatio(Dummy);

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

%delay
vds = [vd];
zorRs = [zorR];
bdRatios = [bdRatio];

floodingDelays = [floodingDelay];
drgDelays = [drgDelay];
dtsgDelays = [dtsgDelay];
roverDelays = [roverDelay];

floodingPDRs = [floodingPDR];
drgPDRs = [drgPDR];
dtsgPDRs = [dtsgPDR];
roverPDRs = [roverPDR];

floodingEs = [floodingE];
drgEs = [drgE];
dtsgEs = [dtsgE];
roverEs = [roverE];

Delays = [floodingDelays; drgDelays; dtsgDelays; roverDelays];
PDRs = [floodingPDRs; drgPDRs; dtsgPDRs; roverPDRs];
Efficiencies = [floodingEs; drgEs; dtsgEs; roverEs];

showNow(vds, Delays, PDRs, Efficiencies, 'Vehicle Density');
showNow(zorRs, Delays, PDRs, Efficiencies, 'ZOR Range');
showNow(bdRatios, Delays, PDRs, Efficiencies, 'Building/Road Density Ratio');

end
