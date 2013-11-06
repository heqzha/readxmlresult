function showResult
DTSG_numOfNodesZOR = [];
DTSG_Efficiency =[];
DTSG_PDR = [];
DTSG_Delay = [];
ZOR_Length = 1;
DTSG_Time = [];
DTSG_TTL = [];
DTSG_networkCreateTime = [];


[DTSG] = protocol;
DTSG_numOfNetwork = size(DTSG,2);
%DTSG_numOfNodesZOR = zeros(1,DTSG_numOfNetwork);
%DTSG_numOfNetwork = DTSG.networkID;
%DTSG_numOfNetwork = DTSG.networkID.getLength;
%NETby = DTSG(2).networkID.networkCreatedBy
%S= size(DTSG_numOfNodes,2);
for i = 0:DTSG_numOfNetwork-1
    DTSG_numOfNodesZOR(i+1) = str2double(DTSG(i+1).networkID.numofNodesZOR)/ZOR_Length;
    DTSG_Efficiency(i+1) = str2double(DTSG(i+1).networkID.efficiency);
    DTSG_PDR(i+1) = str2double(DTSG(i+1).networkID.PDR);
    DTSG_Delay(i+1) = str2double(DTSG(i+1).networkID.DelayT);
    DTSG_networkCreateTime(i+1) = str2double(DTSG(i+1).networkID.networkCreatingTime);
    DTSG_TTL(i+1) = str2double(DTSG(i+1).networkID.TTL);
    DTSG_Time(i+1) = DTSG_networkCreateTime(i+1)+DTSG_TTL(i+1);
end
figure(1);
plot(DTSG_Time,DTSG_numOfNodesZOR,'m*','MarkerSize',10);
figure(2);
plot(DTSG_numOfNodesZOR,DTSG_Efficiency,'r*','MarkerSize',10);
figure(3);
plot(DTSG_numOfNodesZOR,DTSG_PDR,'b*','MarkerSize',10);
figure(4);
plot(DTSG_numOfNodesZOR,DTSG_Delay,'k*','MarkerSize',10);

end
%vehicle density  = DTSG_numOfNodesZOR/ZOR/length
% time = create + TTL, 2-D vector with its vehicle density
%sort
%draw
