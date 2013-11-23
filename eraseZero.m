function [ erasedZeroData ] = eraseZero( data )
% erasedZeroData = [];
% cnt = 1;
% for col = 1:size(data, 2)
%     if(data(1, col) ~= 0 && data(2, col) ~= 0)
%         erasedZeroData(1, cnt) = data(1, col);
%         erasedZeroData(2, cnt) = data(2, col);
%         cnt = cnt + 1;
%     end
% end

tmp = data(1,:);
for i = size(data, 1)
    tmp = tmp.*data(i,:);
end

index = find(tmp > 0);

erasedZeroData = data(:,index);

% cntRow = 1;
% for row = 1:size(data, 1)
%     colData = data(row,:);
%     cntCol = 1;
%     for col = 1:size(colData,2)
%         if(co)
%         if(colData(col) > 0 )
%             erasedZeroData(cntRow, cntCol) = colData(col);
%             cntCol = cntCol + 1;
%         end
%     end
%     cntRow = cntRow + 1;
% end
end

