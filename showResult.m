function showResult


% [DTSG, Flooding, ROVER, DRG] = protocol;
%[DTSG,Flooding] = protocol;
[DTSG,Flooding,DRG] = protocol;

showImage(DTSG,'DTSG');
showImage(Flooding,'Flooding');
showImage(DRG,'DRG');

end
%vehicle density  = DTSG_numOfNodesZOR/ZOR/length
