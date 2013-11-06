function network = parseChildNodes(theNode)

if theNode.hasChildNodes

    networkID = theNode.getElementsByTagName('Network_Identification_Number');
        
    theSimulationStart = getElementData(theNode,'The_Simulation_Start_at');
    theSimulationEnd = getElementData(theNode,'The_Simulation_End_at');
    playgroundX = getElementData(theNode,'Playground_X');
    playgroundY = getElementData(theNode,'Playground_Y');
    roadLength = getElementData(theNode,'Road_Length');
    roadBuilding = getElementData(theNode,'Road_Building_Density_Ratio');
    numberOfcrossRoads = getElementData(theNode,'Number_of_CrossRoads');
    numberOfpolygons = getElementData(theNode,'Number_of_Polygons');
    numberOfVehicles = getElementData(theNode,'Number_of_Vehicles');
    theRange = getElementData(theNode,'The_Range_of_Transmission');
       
    numNetworkID = networkID.getLength;
    alNetCell = cell(1, numNetworkID);
    
    network = struct( ...
        'theSimulationStart', theSimulationStart, ...
        'theSimulationEnd', theSimulationEnd, ...
        'playgroundX', playgroundX, ...
        'playgroundY', playgroundY, ...
        'roadLength', roadLength, ...
        'roadBuilding', roadBuilding, ...
        'numberOfcrossRoads', numberOfcrossRoads, ...
        'numberOfpolygons', numberOfpolygons, ...
        'numberOfVehicles', numberOfVehicles, ...
        'theRange', theRange, ...
        'networkID', alNetCell);
    
    for count = 0:numNetworkID-1
         networkElement = networkID.item(count);
         network(count+1).networkID = getNetworkElementData(networkElement);    
    end
    
end
    
end