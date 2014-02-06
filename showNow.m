function showNow( x, Delays, PDRs, Efficiencies, xTitle, xUnit, xmin, xmax)
    figure;
    subplot(2,2,1);
    hold on;
    set(gcf,'Color','white');
    plot(x, Delays(:,1), '--b+', 'LineWidth', 2);
    plot(x, Delays(:,2), ':mx',  'LineWidth', 2);
    plot(x, Delays(:,3), '-.c*',  'LineWidth', 2);
    plot(x, Delays(:,4), '-.gd',  'LineWidth', 2);
    legend('Flooding', 'DRG', 'DTSG', 'ROVER');
    xlabel(strcat(xTitle,xUnit),'FontSize',12,'FontWeight','bold');
    ylabel('Delay per Hop [seconds]','FontSize',12,'FontWeight','bold');
    axis([xmin xmax 0 45]);
    title(['Delay per Hop vs. ', xTitle], 'FontSize',16,'FontWeight','bold');    
    hold off;
    
    %figure;
    subplot(2,2,2);
    hold on;
    set(gcf,'Color','white');
    PDRs = PDRs.*100.0;
    plot(x, PDRs(:,1), '--b+', 'LineWidth', 2);
    plot(x, PDRs(:,2), ':mx', 'LineWidth', 2);
    plot(x, PDRs(:,3), '-.c*', 'LineWidth', 2);
    plot(x, PDRs(:,4), '-.gd', 'LineWidth', 2);
    legend('Flooding', 'DRG', 'DTSG', 'ROVER');
    xlabel(strcat(xTitle,xUnit),'FontSize',12,'FontWeight','bold');
    ylabel('Packet Delivery Ratio [%]','FontSize',12,'FontWeight','bold');
    axis([xmin xmax 0 100]);
    title(['Packet Delivery Ratio vs. ', xTitle], 'FontSize',16,'FontWeight','bold');
    hold off;
    
    %figure;
    subplot(2,2,3);
    hold on;
    set(gcf,'Color','white');
    Efficiencies = Efficiencies.*100;
    plot(x, Efficiencies(:,1), '--b+',  'LineWidth', 2);
    plot(x, Efficiencies(:,2), ':mx',  'LineWidth', 2);
    plot(x, Efficiencies(:,3), '-.c*',  'LineWidth', 2);
    plot(x, Efficiencies(:,4), '-.gd',  'LineWidth', 2);
    legend('Flooding', 'DRG', 'DTSG', 'ROVER');
    xlabel(strcat(xTitle,xUnit),'FontSize',12,'FontWeight','bold');
    ylabel('Efficiency [%]','FontSize',12,'FontWeight','bold');
    axis([xmin xmax 0 100]);
    title(['Efficiency vs. ', xTitle], 'FontSize',16,'FontWeight','bold');
    hold off;
end

