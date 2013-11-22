function [ vd ] = vehicleDensity( protocol )
    numVehicle = str2double(protocol(1).numberOfVehiclesInCity);
    playgroundX = floor(str2double(protocol(1).playgroundX) / 1000.0);
    playgroundY = floor(str2double(protocol(1).playgroundY) / 1000.0);
    
    vd = numVehicle/(playgroundX * playgroundY);
end

