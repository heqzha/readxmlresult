function [DTSG,Flooding,DRG]= protocol

Protocol_1 = 'DTSG_GCRS_v0.6.7_06_11_2013.xml';
DTSG = parseXML(Protocol_1);

Protocol_2 ='Flooding_GCRS_v0.6.7_05_11_2013.xml';
Flooding = parseXML(Protocol_2);

Protocol_3 = 'DRG.xml';
DRG = parseXML(Protocol_3);

% Protocol_4 = 'ROVER';
% ROVER = parseXML(Protocol_4);

end