function [ erasedZeroData ] = eraseZero( data )
erasedZeroData = [];
cnt = 1;
for col = 1:size(data, 2)
    if(data(1, col) ~= 0 && data(2, col) ~= 0)
        erasedZeroData(1, cnt) = data(1, col);
        erasedZeroData(2, cnt) = data(2, col);
        cnt = cnt + 1;
    end
end
end

