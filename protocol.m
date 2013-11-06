function [DTSG]= protocol

Protocol_1 = 'DTSG_GCRS_v0.6.6_03_11_2013.xml';
DTSG = parseXML(Protocol_1);
DTSG.networkID
DTSG(1).networkID
DTSG(1).networkID.networkCreatedBy

end