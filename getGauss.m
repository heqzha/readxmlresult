function [ result] = getGauss(data, sig, c)
 x = 0: 0.0001: 15;
 gauss = gaussmf(x, [sig, c]);
 %gauss = 1.0 / (sig * sqrt(2.0*pi)) .* gaussmf(x, [sig, c]);
 result = exp(-((abs(data-c)) .* (abs(data - c)))/2);
%  figure,
%  plot(x,gauss);
%  hold on;
%  plot(data,result, 'ro');
%  hold off;
 
end
