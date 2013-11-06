function Data = getElementData(theNode,tagName)

   thisTagName = theNode.getElementsByTagName(tagName);
   element = thisTagName.item(0);
   Data = char(element.getFirstChild.getData);
   
end