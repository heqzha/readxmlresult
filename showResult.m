function showResult
constants;
global USECASE_BENCHMARK;
global USECASE_VEHICLE_DENSITY_500;
global USECASE_VEHICLE_DENSITY_1500;
global USECASE_ZOR_ZOF_LENGTH_500;
global USECASE_ZOR_ZOF_LENGTH_1500;
global USECASE_WIDTH_BETWEEN_BUILDING_20;
global USECASE_WIDTH_BETWEEN_BUILDING_60;

[vdBM, zrBM, brdrBM, delayBM, pdrBM, eBM ] = getPerformMetrics(USECASE_BENCHMARK);

%[vdVD500, zrVD500, brdrVD500, delayVD500, pdrVD500, eVD500 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_500);
%[vdVD1500, zrVD1500, brdrVD1500, delayVD1500, pdrVD1500, eVD1500 ] = getPerformMetrics(USECASE_VEHICLE_DENSITY_1500);

[vdZZL500, zrZZL500, brdrZZL500, delayZZL500, pdrZZL500, eZZL500 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_500);
[vdZZL1500, zrZZL1500, brdrZZL1500, delayZZL1500, pdrZZL1500, eZZL1500 ] = getPerformMetrics(USECASE_ZOR_ZOF_LENGTH_1500);
zrZZL = [zrZZL500, zrBM, zrZZL1500];
delayZZL = [delayZZL500; delayBM; delayZZL1500];
pdrZZL = [pdrZZL500; pdrBM; pdrZZL1500];
eZZL = [eZZL500; eBM; eZZL1500];
showNow(zrZZL, delayZZL, pdrZZL, eZZL, 'ZOR Range');

%[vdWBB20, zrWBB20, brdrWBB20, delayWBB20, pdrWBB20, eWBB20 ] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_20);
%[vdWBB60, zrWBB60, brdrWBB60, delayWBB60, pdrWBB60, eWBB60 ] = getPerformMetrics(USECASE_WIDTH_BETWEEN_BUILDING_60);

end
