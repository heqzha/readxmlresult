function parseDensity

SimTime = [];
NumVehicleInCity = [];
attributes = [];

filename = 'FloodingVehicleInCity1.xml';
 try
    tree = xmlread(filename);
 catch
     error('Failed to read XML file %s.',filename);
 end

   checkPoint = tree.getElementsByTagName('CheckPoint');   
   numOfcheckPoint = checkPoint.getLength;
   for i = 0 : numOfcheckPoint-1
       theChild = checkPoint.item(i);
       theAttributes = theChild.getAttributes;
       numOftheAttributes = theAttributes.getLength;
       for k = 0:numOftheAttributes-1
             attrib = theAttributes.item(k);
             attributes(k+1) = str2double(char(attrib.getValue));
       end
       SimTime(i+1) = attributes(2);
       NumVehicleInCity(i+1) = attributes(1);
   end
   
   plot(SimTime,NumVehicleInCity);
   
end