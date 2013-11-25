function [ result] = getGauss(data, sig, c)
 x = 0: 0.0001: 15;
 gauss = gaussmf(x, [sig, c]);
 %gauss = 1.0 / (sig * sqrt(2.0*pi)) .* gaussmf(x, [sig, c]);
 result = exp(-((abs(data-c)) .* (abs(data - c)))/2);
% figure,
% hold on;
% types = ['r+'; 'go'; 'b*'; 'mx'; 'cs'; 'kd'; 'w^'];
% for i = 1:size(data,2)
%     type = types(mod(i, size(data,2)+1), :);
%      plot(data(i), result(i), type);
% end
% legend('Dummy', 'Flooding', 'DRG', 'DTSG', 'ROVER');
% plot(x,gauss);
% %plot(data,result(1), 'ro');
% hold off;
% xlabel('Delay','FontSize',12,'FontWeight','bold');
% ylabel('Standard Normal Distribution (Delay)','FontSize',12,'FontWeight','bold');
 
end
