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

[floodingNumOfNode] = averageNumOfNode(Flooding);
[drgNumOfNode] = averageNumOfNode(DRG);
[dtsgNumOfNode] = averageNumOfNode(DTSG);
[roverNumOfNode] = averageNumOfNode(ROVER);

[floodingNumReceivedMsgNode] = averageNumReceivedMsgNode(Flooding);
[drgNumReceivedMsgNode] = averageNumReceivedMsgNode(DRG);
[dtsgNumReceivedMsgNode] = averageNumReceivedMsgNode(DTSG);
[roverNumReceivedMsgNode] = averageNumReceivedMsgNode(ROVER);

[floodingFactor] = factor(floodingDelay, idealDelay, floodingNumOfNode);
[drgFactor] = factor(drgDelay, idealDelay, drgNumOfNode);
[dtsgFactor] = factor(dtsgDelay, idealDelay, dtsgNumOfNode);
[roverFactor] = factor(roverDelay, idealDelay, roverNumOfNode);

delays = [idealDelay, floodingDelay, drgDelay, dtsgDelay, roverDelay];
pdrs = [idealPDR, floodingPDR, drgPDR, dtsgPDR, roverPDR];
[delayGaussE] = getGauss(delays, 1.0, 0);
[pdrGaussE] = getGauss(pdrs, 1.0, 1);

[idealE] = efficiency(idealValidNetworkRatio, delayGaussE(1), idealPDR);
[floodingE] = efficiency(floodingValidNetworkRatio, delayGaussE(2), floodingPDR);
[drgE] = efficiency(drgValidNetworkRatio, delayGaussE(3), drgPDR);
[dtsgE] = efficiency(dtsgValidNetworkRatio, delayGaussE(4), dtsgPDR);
[roverE] = efficiency(roverValidNetworkRatio, delayGaussE(5), roverPDR);

% comparisonSpeed = 1.0/IdealDelay;
% [floodingE] = efficiency(floodingFactor, 1.0/floodingDelay, comparisonSpeed, floodingPDR,IdealPDR);
% [drgE] = efficiency(drgFactor, 1.0/drgDelay, comparisonSpeed, drgPDR,IdealPDR);
% [dtsgE] = efficiency(dtsgFactor, 1.0/dtsgDelay, comparisonSpeed, dtsgPDR,IdealPDR);
% [roverE] = efficiency(roverFactor, 1.0/roverDelay, comparisonSpeed, roverPDR,IdealPDR);

% comparisonSpeed = 1.0/floodingDelay;
% [floodingE] = efficiency(floodingFactor, 1.0/floodingDelay, comparisonSpeed, floodingPDR,floodingPDR);
% [drgE] = efficiency(drgFactor, 1.0/drgDelay, comparisonSpeed, drgPDR,floodingPDR);
% [dtsgE] = efficiency(dtsgFactor, 1.0/dtsgDelay, comparisonSpeed, dtsgPDR,floodingPDR);
% [roverE] = efficiency(roverFactor, 1.0/roverDelay, comparisonSpeed, roverPDR,floodingPDR);

% [dummyNumReceivedMsgNode] = averageNumReceivedMsgNode(Dummy);
% [floodingNumReceivedMsgNode] = averageNumReceivedMsgNode(Flooding);
% [drgNumReceivedMsgNode] = averageNumReceivedMsgNode(DRG);
% [dtsgNumReceivedMsgNode] = averageNumReceivedMsgNode(DTSG);
% [roverNumReceivedMsgNode] = averageNumReceivedMsgNode(ROVER);
% 
% [dummyMaxDelay] = averageMaxDelay(Dummy);
% [floodingMaxDelay] = averageMaxDelay(Flooding);
% [drgMaxDelay] = averageMaxDelay(DRG);
% [dtsgMaxDelay] = averageMaxDelay(DTSG);
% [roverMaxDelay] = averageMaxDelay(ROVER);
% 
% [floodingE] = efficiency(floodingNumReceivedMsgNode, floodingMaxDelay);
% [drgE] = efficiency(drgNumReceivedMsgNode, drgMaxDelay);
% [dtsgE] = efficiency(dtsgNumReceivedMsgNode, dtsgMaxDelay);
% [roverE] = efficiency(roverNumReceivedMsgNode, roverMaxDelay);

Delay = [idealDelay, floodingDelay, drgDelay, dtsgDelay, roverDelay];
PDR = [idealPDR, floodingPDR, drgPDR, dtsgPDR, roverPDR];
E = [idealE, floodingE, drgE, dtsgE, roverE];

end

