function [ erasedNoisedData] = eraseNoise(data)
X = data(1,:);
Y = data(2,:);
mdl = LinearModel.fit(X, Y, 'linear');
%figure,plotDiagnostics(mdl, 'cookd');
index = find((mdl.Diagnostics.CooksDistance) < mean(mdl.Diagnostics.CooksDistance));
erasedNoisedData(1, :) = X(index);
erasedNoisedData(2, :) = Y(index);
end

