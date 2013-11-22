function [ aveProcessedData] = average( data )
aveData = mean(data);
stdData = std(data);

aveProcessedData = [];
cnt = 1;
for i = 1:size(data,2)
    upper =  aveData + 1.5 * stdData;
    lower = aveData - 1.5 * stdData;
     if (data(i) <= upper) && (data(i) >= lower)
         aveProcessedData(cnt) = data(i);
         cnt = cnt + 1;
     end
end

aveProcessedData = mean(aveProcessedData);

end

