function [Interval] = IntervalGenerator(Dataset,Binsize)
% Dataset = [1:15;20:34];
% Binsize =10;
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