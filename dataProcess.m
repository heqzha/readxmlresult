function [ processedData ] = dataProcess( data )
%erase 0
erasedZeroData = eraseZero(data);
%erase noise
%erasedNoiseData = eraseNoise(erasedZeroData);

processedData = erasedZeroData;

end
