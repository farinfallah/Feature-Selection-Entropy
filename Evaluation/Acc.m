% Acc.m --- Acc function
% TrueLabel: Actual label
% ELabe: Estimated label
function [ACC] = Acc(TrueLabel,ELabel)
%% --------- Test
%  TrueLabel=[1,1,1,1,1,2,2,2,2,2]';
%  ELabel=   [1,1,1,1,1,1,1,2,2,2]';
%%
% find out number of unique lable
TrueLabelUnq=unique(TrueLabel);
% k-means start set labels from 1 so if true label start with 0 we shoud
% incremanet true label 1 level
if(TrueLabelUnq(1)== 0) 
    TrueLabelUnq = TrueLabelUnq + 1;
end
% find permutation of lables
PermTrueLabel = perms(TrueLabelUnq);
[row col] = size(PermTrueLabel);
% find out mismatches of permute labels
TotalELabel = [];
for i=1:row    
   for j=1:col
    NewELabel(ELabel == TrueLabelUnq(j)) = PermTrueLabel(i,j);   
   end
 TotalELabel = [ TotalELabel;NewELabel];
 Mismatches(i) = sum(TotalELabel(i,:)'~=TrueLabel);

end
% sort mismatches
[sortedM,SortedIdx] = sort(Mismatches);
BestELabel = TotalELabel(SortedIdx(1),:)';
C = confusionmat(TrueLabel,BestELabel);
% Accuracy=(a+d)/(a+b+c+d)
ACC=sum(diag(C))/sum(C(:)); 
end
