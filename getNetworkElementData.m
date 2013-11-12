function Data = getNetworkElementData(theNode)
    
    networkCreatedBy = getElementData(theNode,'Network_Created_by');
    networkCreatingTime = getElementData(theNode,'Network_Creating_Time');
    TTL = getElementData(theNode,'Network_Time_to_live');
    locZOR = getElementData(theNode,'The_Location_of_ZOR');
    shapeZOR = getElementData(theNode,'The_Shape_of_ZOR');
    lenZOR = getElementData(theNode,'The_Length_of_ZOR');
    widZOR = getElementData(theNode,'The_Width_of_ZOR');
    locZOF = getElementData(theNode,'The_Location_of_ZOF');
    shapeZOF = getElementData(theNode,'The_Shape_of_ZOF');
    lenZOF = getElementData(theNode,'The_Length_of_ZOF');
    widZOF = getElementData(theNode,'The_Width_of_ZOF');
    numReMsgNodesZOR = getElementData(theNode,'The_Number_of_Received_Message_Nodes_ZOR');
    numReMsgNodesZOF = getElementData(theNode,'The_Number_of_Received_Message_Nodes_ZOF');
    maxHops = getElementData(theNode,'The_Max_Hops');
    DelayT = getElementData(theNode,'The_Max_Delay_Time');
    numofNodesZOR = getElementData(theNode,'The_Number_of_Nodes_Which_Passing_Through_ZOR');
    numofNodesZOF = getElementData(theNode,'The_Number_of_Nodes_Which_Passing_Through_ZOF');
    PDR = getElementData(theNode,'The_Packet_Delivery_Ratio');
    efficiency = getElementData(theNode,'The_Efficiency');
    
    Data =struct( ...
        'networkCreatedBy', networkCreatedBy, ...
        'networkCreatingTime', networkCreatingTime, ...
        'TTL', TTL, ...
        'locZOR', locZOR, ...
        'shapeZOR', shapeZOR, ...
        'lenZOR', lenZOR, ...
        'widZOR', widZOR, ...
        'locZOF', locZOF, ...
        'shapeZOF', shapeZOF, ...
        'lenZOF', lenZOF, ...
        'widZOF', widZOF, ...
        'numReMsgNodesZOR', numReMsgNodesZOR, ...
        'numReMsgNodesZOF', numReMsgNodesZOF, ...
        'maxHops', maxHops, ...
        'DelayT', DelayT, ...
        'numofNodesZOR', numofNodesZOR, ...
        'numofNodesZOF', numofNodesZOF, ...
        'PDR', PDR, ...
        'efficiency', efficiency);

end