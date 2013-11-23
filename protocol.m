function [Dummy, Flooding, DRG,DTSG, ROVER]= protocol(usecase)
global FOLDER_BENCHMARK;
global FOLDER_VEHICLE_DENSITY;
global FOLDER_ZOR_ZOF_LENGTH;
global FOLDER_WIDTH_BETWEEN_BUILDING;

global USECASE_BENCHMARK;
global USECASE_VEHICLE_DENSITY_50;
global USECASE_VEHICLE_DENSITY_150;
global USECASE_ZOR_ZOF_LENGTH_500;
global USECASE_ZOR_ZOF_LENGTH_1500;
global USECASE_WIDTH_BETWEEN_BUILDING_20;
global USECASE_WIDTH_BETWEEN_BUILDING_60;

switch usecase
    case USECASE_BENCHMARK
        folder = fullfile(FOLDER_BENCHMARK);
    case USECASE_VEHICLE_DENSITY_50
        folder = fullfile(FOLDER_VEHICLE_DENSITY, '50');
    case USECASE_VEHICLE_DENSITY_150
        folder = fullfile(FOLDER_VEHICLE_DENSITY, '150');
    case USECASE_ZOR_ZOF_LENGTH_500
        folder = fullfile(FOLDER_ZOR_ZOF_LENGTH, '500');
    case USECASE_ZOR_ZOF_LENGTH_1500
        folder = fullfile(FOLDER_ZOR_ZOF_LENGTH, '1500');
    case USECASE_WIDTH_BETWEEN_BUILDING_20
        folder = fullfile(FOLDER_WIDTH_BETWEEN_BUILDING, '20');
    case USECASE_WIDTH_BETWEEN_BUILDING_60
        folder = fullfile(FOLDER_WIDTH_BETWEEN_BUILDING, '60');
    otherwise
        
end

if size(folder) > 0
    dummyFile = 'Dummy.xml';
    Dummy = parseXML(fullfile(folder, dummyFile));
    
    floodingFile ='Flooding.xml';
    Flooding = parseXML(fullfile(folder, floodingFile));
    
    drgFile = 'DRG.xml';
    DRG = parseXML(fullfile(folder, drgFile));
    
    roverFile = 'ROVER.xml';
    ROVER = parseXML(fullfile(folder, roverFile));
    %ROVER = 0;
    
    dtsgFile = 'DTSG.xml';
    DTSG = parseXML(fullfile(folder, dtsgFile));
    
end

end