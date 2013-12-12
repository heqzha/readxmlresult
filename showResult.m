function showResult
clear all;close all;clc;
constants;
global USECASE_BENCHMARK;
global USECASE_VEHICLE_DENSITY_50;
global USECASE_VEHICLE_DENSITY_150;
global USECASE_ZOR_ZOF_LENGTH_1000;
global USECASE_ZOR_ZOF_LENGTH_1500;
global USECASE_WIDTH_BETWEEN_BUILDING_20;
global USECASE_WIDTH_BETWEEN_BUILDING_60;

[vdBM, zrBM, brdrBM, delayBM, pdrBM, eBM ] = getPerformMetrics(USECASE_BENCHMARK);

[vdVD50, zrVD50, brdrVD50, delayVD50, pdrVD50, eVD50 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_50);
[vdVD150, zrVD150, brdrVD150, delayVD150, pdrVD150, eVD150 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_150);
vd = [vdVD50, vdBM, vdVD150];
delayVD = [delayVD50; delayBM; delayVD150];
pdrVD = [pdrVD50; pdrBM; pdrVD150];
eVD = [eVD50; eBM; eVD150];
showNow(vd, delayVD, pdrVD, eVD, 'Vehicle Density [vehicles/square kilometers]', 45, 155);

[vdZZL500, zrZZL1000, brdrZZL500, delayZZL1000, pdrZZL1000, eZZL1000 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_1000);
[vdZZL1500, zrZZL1500, brdrZZL1500, delayZZL1500, pdrZZL1500, eZZL1500 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_1500);
zrZZL = [zrBM, zrZZL1000, zrZZL1500];
delayZZL = [delayBM; delayZZL1000; delayZZL1500];
pdrZZL = [pdrBM; pdrZZL1000; pdrZZL1500];
eZZL = [eBM; eZZL1000; eZZL1500];
showNow(zrZZL, delayZZL, pdrZZL, eZZL, 'ZOR Range [meters]', 450, 1550);

[vdWBB20, zrWBB20, brdrWBB20, delayWBB20, pdrWBB20, eWBB20 ] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_20);
[vdWBB60, zrWBB60, brdrWBB60, delayWBB60, pdrWBB60, eWBB60 ] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_60);
wb = [brdrWBB20, brdrBM, brdrWBB60];
delayWB = [delayWBB20; delayBM; delayWBB60];
pdrWB = [pdrWBB20; pdrBM; pdrWBB60];
eWB = [eWBB20; eBM; eWBB60];
showNow(wb, delayWB, pdrWB, eWB, 'Road Building Ratio', 0.04, 0.14);

end
