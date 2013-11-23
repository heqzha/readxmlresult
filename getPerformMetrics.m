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

[floodingNumOfNode] = averageNumOfNode(Flooding);
[drgNumOfNode] = averageNumOfNode(DRG);
[dtsgNumOfNode] = averageNumOfNode(DTSG);
[roverNumOfNode] = averageNumOfNode(ROVER);

[floodingNumReceivedMsgNode] = averageNumReceivedMsgNode(Flooding);
[drgNumReceivedMsgNode] = averageNumReceivedMsgNode(DRG);
[dtsgNumReceivedMsgNode] = averageNumReceivedMsgNode(DTSG);
[roverNumReceivedMsgNode] = averageNumReceivedMsgNode(ROVER);

[floodingFactor] = factor(floodingDelay, IdealDelay, floodingNumOfNode);
[drgFactor] = factor(drgDelay, IdealDelay, drgNumOfNode);
[dtsgFactor] = factor(dtsgDelay, IdealDelay, dtsgNumOfNode);
[roverFactor] = factor(roverDelay, IdealDelay, roverNumOfNode);


% comparisonSpeed = 1.0/IdealDelay;
% [floodingE] = efficiency(floodingFactor, 1.0/floodingDelay, comparisonSpeed, floodingPDR,IdealPDR);
% [drgE] = efficiency(drgFactor, 1.0/drgDelay, comparisonSpeed, drgPDR,IdealPDR);
% [dtsgE] = efficiency(dtsgFactor, 1.0/dtsgDelay, comparisonSpeed, dtsgPDR,IdealPDR);
% [roverE] = efficiency(roverFactor, 1.0/roverDelay, comparisonSpeed, roverPDR,IdealPDR);

comparisonSpeed = 1.0/floodingDelay;
[floodingE] = efficiency(floodingFactor, 1.0/floodingDelay, comparisonSpeed, floodingPDR,floodingPDR);
[drgE] = efficiency(drgFactor, 1.0/drgDelay, comparisonSpeed, drgPDR,floodingPDR);
[dtsgE] = efficiency(dtsgFactor, 1.0/dtsgDelay, comparisonSpeed, dtsgPDR,floodingPDR);
[roverE] = efficiency(roverFactor, 1.0/roverDelay, comparisonSpeed, roverPDR,floodingPDR);

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

Delay = [floodingDelay, drgDelay, dtsgDelay, roverDelay];
PDR = [floodingPDR, drgPDR, dtsgPDR, roverPDR];
E = [floodingE, drgE, dtsgE, roverE];

end

