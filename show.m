function show( protocol_name,performance_metrics_name, performance_metrics_unit, scenario_name, scenario_unit, secnario, data )
%SHOW Summary of this function goes here
%   Detailed explanation goes here
hold on;
set(gcf,'Color','white');
line_style = [cellstr('-bp'), cellstr(':ks'), cellstr('--ro'), cellstr('-.gd')];
for i = 1:length(data(:,1))
    plot(secnario, data(i,:), char(line_style(mod(i,length(line_style)))), 'LineWidth', 2);
end
legend(protocol_name);
xlabel(strcat(scenario_name,scenario_unit),'FontSize',14,'FontWeight','bold');
ylabel(strcat(performance_metrics_name,performance_metrics_unit),'FontSize',14,'FontWeight','bold');
%axis([xmin xmax 0 45]);
title([performance_metrics_name, ' vs. ', scenario_name], 'FontSize',14,'FontWeight','bold');
hold off;

end

