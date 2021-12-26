function [Interval] = BetaPartition(Dataset,Binsize)
%  Dataset = [0:1];
%  Binsize =4;
[SampleNum,FeatNum] = size(Dataset);
MinFeat = min(Dataset); 
MaxFeat = max(Dataset);
IntervalDis = (MaxFeat - MinFeat) ./ Binsize;
Interval = zeros(FeatNum,Binsize);
for i = 1:FeatNum
    for j = 1:Binsize
        Interval(i,j) = MinFeat(i) + (j-1) * IntervalDis(i);
    end
end
Interval = [Interval MaxFeat'];

end