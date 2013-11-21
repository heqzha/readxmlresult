function showImage(protocol,name)

ZOR_Length = 1;

numOfNodesZOR = [];
Efficiency =[];
PDR = [];
Delay = [];
Time = [];
TTL = [];
networkCreateTime = [];

numOfNetwork = size(protocol,2);
for i = 0:numOfNetwork-1
    numOfNodesZOR(i+1) = str2double(protocol(i+1).networkID.numofNodesZOR)/ZOR_Length;
    Efficiency(i+1) = str2double(protocol(i+1).networkID.efficiency);
    PDR(i+1) = str2double(protocol(i+1).networkID.PDR);
    Delay(i+1) = str2double(protocol(i+1).networkID.DelayT);
    networkCreateTime(i+1) = str2double(protocol(i+1).networkID.networkCreatingTime);
    TTL(i+1) = str2double(protocol(i+1).networkID.TTL);
    Time(i+1) = networkCreateTime(i+1)+TTL(i+1);
end

figure;

subplot(2,2,1);
plot(Time,numOfNodesZOR,'m*','MarkerSize',10);
xlabel('Time','FontSize',16,'FontWeight','bold');
ylabel('Density','FontSize',16,'FontWeight','bold');
subplot(2,2,2);
plot(numOfNodesZOR,Efficiency,'r*','MarkerSize',10);
xlabel('Number of nodes in ZOR','FontSize',16,'FontWeight','bold');
ylabel('Efficiency','FontSize',16,'FontWeight','bold');
subplot(2,2,3);
plot(numOfNodesZOR,PDR,'b*','MarkerSize',10);
xlabel('Number of nodes in ZOR','FontSize',16,'FontWeight','bold');
ylabel('PDR','FontSize',16,'FontWeight','bold');
subplot(2,2,4);
plot(numOfNodesZOR,Delay,'k*','MarkerSize',10);
xlabel('Number of nodes in ZOR','FontSize',16,'FontWeight','bold');
ylabel('Delay','FontSize',16,'FontWeight','bold');

suptitle(strcat('Protocl: ', name));

end