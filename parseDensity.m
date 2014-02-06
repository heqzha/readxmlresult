function parseDensity

SimTime = [];
NumVehicleInCity = [];
attributes = [];

filename = 'FloodingVehicleInCity.xml';
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
   
   figure;
   hold on;
   set(gcf,'Color','white');
   plot(SimTime,NumVehicleInCity);
   xlabel('Simulation Time','FontSize',12,'FontWeight','bold');
   ylabel('Number of Vehilces In City','FontSize',12,'FontWeight','bold');
   axis([0 1200 0 450]);
   title('Number of Vehilces In City vs.Simulation Time', 'FontSize',16,'FontWeight','bold');    
   hold off;
end