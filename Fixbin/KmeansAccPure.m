function [AccTotal,PurenessTotal,indexw]=KmeansAccPure(Weight,Dataset,TrueLabel,n,k)
[sortedw indexw]=sort(Weight,'descend');
c=0;
[~,FeatNum]=size(Dataset);
for i=1:n:FeatNum
%     i
    c=c+1;
     NewDs=[];
     for j=1:i
        NewDs=[NewDs,Dataset(:,indexw(j))] ; 
     end
[ELabel,~] = kmeans(NewDs,k,'emptyaction','singleton');
AccTotal(c) = Acc(TrueLabel,ELabel);
PurenessTotal(c) = Pureness(TrueLabel,ELabel);
end

end