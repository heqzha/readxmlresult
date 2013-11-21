function showResult
constants;
global USECASE_BENCHMARK;
global USECASE_VEHICLE_DENSITY_500;
global USECASE_VEHICLE_DENSITY_1500;
global USECASE_ZOR_ZOF_LENGTH_500;
global USECASE_ZOR_ZOF_LENGTH_1500;
global USECASE_WIDTH_BETWEEN_BUILDING_20;
global USECASE_WIDTH_BETWEEN_BUILDING_60;

% [DTSG, Flooding, ROVER, DRG] = protocol;
%[DTSG,Flooding] = protocol;
[Dummy, Flooding, DRG,DTSG, ROVER] = protocol(USECASE_BENCHMARK);

showImage(Dummy, 'Dummy')
showImage(Flooding,'Flooding');
showImage(DRG,'DRG');
showImage(DTSG,'DTSG');

end
%vehicle density  = DTSG_numOfNodesZOR/ZOR/length
