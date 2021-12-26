% 
function []=FixFreq(Dataset,Frq,SampleNum,ClusterNum)
%% Assign Label to  Frquency bins
%Remain Creator
BinNum=zeros(ClusterNum,ceil(Frq/ClusterNum));
for i=1:Frq
   BinNum(i)=i;
end

%% SampleBinsum
r=rem(SampleNum,Frq);
if(r==0)
    SampleBinsum=repmat((SampleNum/ClusterNum),1,ClusterNum);
else   
    
    SampleBinsum=repmat((SampleNum/ClusterNum),1,(ClusterNum-1));
    SampleBinsum=[((SampleNum/ClusterNum)+r), SampleBinsum];
end

Prob=Frq/SampleBinsum;
E2=Prob;
E1=sum(Prob*log(Prob));

