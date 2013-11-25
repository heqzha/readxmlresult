function showNow( x, Delays, PDRs, Efficiencies, xTitle)
    
    figure;
    subplot(2,2,1);
    plot(x,Delays(:,1), '-ro', x, Delays(:,2), '--b+', x, Delays(:,3), ':mx', x, Delays(:,4), '-.c*', x, Delays(:,5), '-.gd');
    legend('Dummy', 'Flooding', 'DRG', 'DTSG', 'ROVER');
    xlabel(xTitle,'FontSize',12,'FontWeight','bold');
    ylabel('Delay','FontSize',12,'FontWeight','bold');
    
    subplot(2,2,2);
    plot(x,PDRs(:,1), '-ro', x, PDRs(:,2), '--b+', x, PDRs(:,3), ':mx', x, PDRs(:,4), '-.c*', x, PDRs(:,5), '-.gd');
    legend('Dummy', 'Flooding', 'DRG', 'DTSG', 'ROVER');
    xlabel(xTitle,'FontSize',12,'FontWeight','bold');
    ylabel('PDR','FontSize',12,'FontWeight','bold');
    
    subplot(2,2,3);
    plot(x,Efficiencies(:,1), '-ro', x, Efficiencies(:,2), '--b+', x, Efficiencies(:,3), ':mx', x, Efficiencies(:,4), '-.c*', x, Efficiencies(:, 5), '-.gd');
    legend('Dummy', 'Flooding', 'DRG', 'DTSG', 'ROVER');
    xlabel(xTitle,'FontSize',12,'FontWeight','bold');
    ylabel('Efficiency','FontSize',12,'FontWeight','bold');
end

