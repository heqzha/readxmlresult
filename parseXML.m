function theStruct = parseXML(filename)

% parseXML convert XML file to a matlab structure
try
    tree = xmlread(filename);
catch
    error('Failed to read XML file %s.',filename);
end


try
   theStruct = parseChildNodes(tree);
catch
   error('Unable to parse XML file %s.',filename);
end

    
end