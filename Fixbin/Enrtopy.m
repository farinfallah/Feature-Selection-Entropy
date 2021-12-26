 function [Entropy1,Entropy2] = Enrtopy(Dataset,Label,Interval,SampleNum,FeatNum,Binsize)
% 
%  Label=[1;1;2;2]; 
% Binsize=3; SampleNum=4;FeatNum=3;
% Dataset=[.2,.5,.1;
%          .6,.3,.1;
%          .4,.1,.5;
%          .1,.9,.9];
% Interval=[0:1/Binsize:1;0:1/Binsize:1;0:1/Binsize:1];
%% Find number of clusters
LabelUnq = unique(Label);
LabelUnqsize = size(LabelUnq,1);

%% Count number of sample per each bin label
Count=zeros(FeatNum,Binsize);
for i=1:FeatNum
    for j=1:SampleNum
        for k=1:Binsize
%            clc         
%              Interval(i,k)
%              Interval(i,k+1)
%             Dataset(j,i)
              if(Dataset(j,i)>=Interval(i,k)&& Dataset(j,i)<=Interval(i,k+1))
                Count(i,k)=Count(i,k)+1;
                break;
              end
        end
   end
end
%% Assign Label to bins
%Remain Creator
BinNum=zeros(LabelUnqsize,ceil(Binsize/LabelUnqsize));
for i=1:Binsize
   BinNum(i)=i;
end
SampleBinsum1=zeros(FeatNum,LabelUnqsize);
for i=1:LabelUnqsize
    row=BinNum(i,:);
    for j=1:size(row,2)
        if(row(j)~=0)
            SampleBinsum1(:,i)=SampleBinsum1(:,i)+Count(:,row(j));
        end
    end
end
%% 
SampleLabelNumRep1=repmat(SampleBinsum1,1,floor(Binsize/LabelUnqsize));
r1=rem(Binsize,LabelUnqsize);
if(r1~=0)
   SampleLabelNumRep1=[SampleLabelNumRep1,SampleLabelNumRep1(:,1:r1)];
end

%% Calculate Entropy With Considering Bins  1-2 and 2-1
E1=zeros(1,LabelUnqsize*FeatNum);
Prob1=Count./SampleLabelNumRep1;
for i=1:(LabelUnqsize*FeatNum)
    for j=i:(LabelUnqsize*FeatNum):(FeatNum*Binsize)
% i
% j && Prob1(j)~=NaN
      if(Prob1(j)~=0 )
         E1(i)= E1(i)+( -Prob1(j)*log(Prob1(j)));
      end

   end
end
Entropy1=reshape(E1,FeatNum,LabelUnqsize)';
%%%%%%%%%%%%%%%%
Entropy2=zeros(1,FeatNum);
Prob2=Count./SampleNum;

for i=1:FeatNum
  for j=1:Binsize
      if(Prob2(i,j)~=0)
%           Prob2(i,j)  && Prob1(i,j)~=NaN)
%           log2(Prob2(i,j))
% 
         Entropy2(i)=Entropy2(i)+(-Prob2(i,j)*log2(Prob2(i,j)));
     end
  end
end
% Entropy2=Entropy2/norm(Entropy2);

end