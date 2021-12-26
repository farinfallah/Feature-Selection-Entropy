% 
function [E]=FFreq(Dataset,Frq,SampleNum,ClusterNum)
%% Assign Label to  Frequency bins
%Remain Creator
BinNum=zeros(ClusterNum,ceil(Frq/ClusterNum));
for i=1:Frq
   BinNum(i)=i;
end
%% SampleBinsum
r=rem(SampleNum,Frq);
if(r==0)
SampleBinsum=repmat((SampleNum/ClusterNum),1,(SampleNum/Frq));
else    
SampleBinsum=repmat((SampleNum/ClusterNum),1,floor(SampleNum/Frq));
SampleBinsum=[SampleBinsum,r];
end
Prob=Frq./SampleBinsum;
E=-sum(Prob.*log(Prob));
end