function showResult
clear all;close all;clc;
constants;
global USECASE_BENCHMARK;

global USECASE_VEHICLE_DENSITY_50;
global USECASE_VEHICLE_DENSITY_75;
global USECASE_VEHICLE_DENSITY_125;
global USECASE_VEHICLE_DENSITY_150;

global USECASE_ZOR_ZOF_LENGTH_750;
global USECASE_ZOR_ZOF_LENGTH_1000;
global USECASE_ZOR_ZOF_LENGTH_1250;
global USECASE_ZOR_ZOF_LENGTH_1500;

global USECASE_WIDTH_BETWEEN_BUILDING_20;
global USECASE_WIDTH_BETWEEN_BUILDING_30;
global USECASE_WIDTH_BETWEEN_BUILDING_50;
global USECASE_WIDTH_BETWEEN_BUILDING_60;

[vdBM, zorBM, brdrBM, delayBM, pdrBM, eBM, stdDelayBM ] = getPerformMetrics(USECASE_BENCHMARK);

[vdVD50, zorVD50, brdrVD50, delayVD50, pdrVD50, eVD50, stdDelayVD50 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_50);
[vdVD75, zorVD75, brdrVD75, delayVD75, pdrVD75, eVD75, stdDelayVD75 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_75);
[vdVD125, zorVD125, brdrVD125, delayVD125, pdrVD125, eVD125, stdDelayVD125 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_125);
[vdVD150, zorVD150, brdrVD150, delayVD150, pdrVD150, eVD150, stdDelayVD150 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_150);

vd = [vdVD50, vdVD75, vdBM, vdVD125, vdVD150];
delayVD = [delayVD50; delayVD75;delayBM; delayVD125;delayVD150];
pdrVD = [pdrVD50; pdrVD75; pdrBM; pdrVD125;pdrVD150];
eVD = [eVD50; eVD75;eBM; eVD125; eVD150];

stdDelayVD = [stdDelayVD50; stdDelayVD75; stdDelayBM; stdDelayVD125; stdDelayVD150];
floodingDelayVD = std(delayVD(:,1));
drgDelayVD = std(delayVD(:, 2));
dtsgDelayVD = std(delayVD(:,3));
roverDelayVD = std(delayVD(:,4));
stdDelayVDAll = [floodingDelayVD, drgDelayVD, dtsgDelayVD, roverDelayVD];

showNow(vd, delayVD, pdrVD, eVD, 'Vehicle Density [vehicles/square kilometers]', 45, 155);

[vdZor750, zrZor750, brdrZor750, delayZor750, pdrZor750, eZor750, stdDelayZor750 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_750);
[vdZor1000, zrZor1000, brdrZor1000, delayZor1000, pdrZor1000, eZor1000, stdDelayZor1000 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_1000);
[vdZor1250, zrZor1250, brdrZor1250, delayZor1250, pdrZor1250, eZor1250, stdDelayZor1250 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_1250);
[vdZor1500, zrZor1500, brdrZor1500, delayZor1500, pdrZor1500, eZor1500, stdDelayZor1500 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_1500);

zrZZL = [zorBM, zrZor750, zrZor1000, zrZor1250, zrZor1500];
delayZZL = [delayBM; delayZor750; delayZor1000; delayZor1250; delayZor1500];
pdrZZL = [pdrBM; pdrZor750; pdrZor1000; pdrZor1250; pdrZor1500];
eZZL = [eBM; eZor750; eZor1000; eZor1250; eZor1500];

stdDelayZZL = [stdDelayBM; stdDelayZor750; stdDelayZor1000; stdDelayZor1250; stdDelayZor1500];
floodingDelayZZL = std(delayZZL(:,1));
drgDelayZZL = std(delayZZL(:, 2));
dtsgDelayZZL = std(delayZZL(:,3));
roverDelayZZL = std(delayZZL(:,4));
stdDelayZZLAll = [floodingDelayZZL, drgDelayZZL, dtsgDelayZZL, roverDelayZZL];

showNow(zrZZL, delayZZL, pdrZZL, eZZL, 'ZOR Range [meters]', 450, 1550);

[vdWBB20, zrWBB20, brdrWBB20, delayWBB20, pdrWBB20, eWBB20, stdDelayWBB20 ] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_20);
[vdWBB30, zrWBB30, brdrWBB30, delayWBB30, pdrWBB30, eWBB30, stdDelayWBB30 ] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_30);
[vdWBB50, zrWBB50, brdrWBB50, delayWBB50, pdrWBB50, eWBB50, stdDelayWBB50 ] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_50);
[vdWBB60, zrWBB60, brdrWBB60, delayWBB60, pdrWBB60, eWBB60, stdDelayWBB60] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_60);

wb = [brdrWBB20, brdrWBB30, brdrBM, brdrWBB50, brdrWBB60];
delayWB = [delayWBB20; delayWBB30; delayBM; delayWBB50; delayWBB60];
pdrWB = [pdrWBB20; pdrWBB30; pdrBM; pdrWBB50; pdrWBB60];
eWB = [eWBB20; eWBB30; eBM; eWBB50; eWBB60];

stdDelayWB = [stdDelayWBB20; stdDelayWBB30; stdDelayBM; stdDelayWBB50; stdDelayWBB60];
floodingDelayWB = std(delayWB(:,1));
drgDelayWB = std(delayWB(:, 2));
dtsgDelayWB = std(delayWB(:,3));
roverDelayWB = std(delayWB(:,4));
stdDelayWBAll = [floodingDelayWB, drgDelayWB, dtsgDelayWB, roverDelayWB];

showNow(wb, delayWB, pdrWB, eWB, 'Road Building Ratio', 0.04, 0.14);

end
