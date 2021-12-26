function []=PlotPureAcc(FeatNum,Acc1,Acc2,Pure1,Pure2,n)
%% Plot 
FeatNumVec=1:n:FeatNum;
figure; 
grid on
set(gca, 'GridLineStyle', '-');
grid(gca,'minor')
subplot(2,1,1);
plot(FeatNumVec,Acc1,'o-b','LineWidth',1);
hold on
plot(FeatNumVec,Acc2,'^-r','LineWidth',1);
xlabel('Number Of Selected Feature');
ylabel('Accuracy');
%% Plot
subplot(2,1,2);
plot(FeatNumVec, Pure1,'o-b','LineWidth',1);
hold on
plot(FeatNumVec, Pure2,'^-r','LineWidth',1);
legend('Considering Bin','Entropy');

xlabel('Number Of Selected Feature');
ylabel('Pureness');
end