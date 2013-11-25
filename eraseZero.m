function [ erasedZeroData ] = eraseZero( data )

tmp = data(1,:);
for i = size(data, 1)
    tmp = tmp.*data(i,:);
end

index = find(tmp > 0);

erasedZeroData = data(:,index);

end

