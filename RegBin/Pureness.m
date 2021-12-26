% Purness.m --- purity function
% TrueLabel: Actual label
% ELabe: Estimated label
function [Purenessvar] = Pureness(TrueLabel,ELabel)
%% --------- Test
%   TrueLabel=[1,1,1,1,1,2,2,2,2,2]';
%  ELabel=   [1,1,1,1,1,1,1,2,2,2]';
%% --------- End Test
% find out number of unique lable
TrueLabelUnq=unique(TrueLabel);
% k-means start set labels from 1 so if true label start with 0 we shoud
% incremanet true label 1 level

if(TrueLabelUnq(1)==0)
    TrueLabelUnq=TrueLabelUnq+1;
end
% find permutation of lables
PermTrueLabel=perms(TrueLabelUnq);
[row col]=size(PermTrueLabel);
TotalELabel=[];
for i=1:row
     for j=1:col
       NewELabel(ELabel==TrueLabelUnq(j))=PermTrueLabel(i,j);   
    end
 TotalELabel=[ TotalELabel;NewELabel];
 Mismatches(i)=sum(TotalELabel(i,:)'~=TrueLabel);
end
[~,SortedIdx]=sort(Mismatches);
BestELabel=TotalELabel(SortedIdx(1),:);
%% Calculate Confusion Matrix
C = confusionmat(TrueLabel,BestELabel);
Temp=C;
[Crow,Ccol]=size(C);
idxCluster=[];
zz=zeros(1,2);
%% Calculate Pureness using Confusion Matrix
for i=1:Ccol
      if (size(idxCluster)~=zz)
        for j=1:size(idxCluster,2)
           C(idxCluster(j),i)=-inf; 
        end
      end
     
    MyCol=C(:,i);
    [m1(i),idx1]=max(MyCol); 
    idxCluster=[idxCluster idx1];

end

sumTemp=sum(Temp);
Purenessvar=sum(m1./sumTemp)/Ccol;

end