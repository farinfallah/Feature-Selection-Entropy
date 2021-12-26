function [Data] = Data2Struct(DataMat, EstLabel)

% DataMat=[.5 1 0 ;
%          1  0 .5;
%         .25 .3 1;
%         0.1 .2 .5
%         0.8 .7 .9];
% EstLabel=[2;1;2;3;1];

ClusterUniqueLabel = unique (EstLabel);
ClusterNum =size(ClusterUniqueLabel,1);
Data = repmat(struct([]),1, ClusterNum);


for k=1:ClusterNum
    Data(k).ClusterLabel = k;
    Data(k).PatternIndex = find(EstLabel==k);
    Data(k).Count = size(Data(k).PatternIndex,1);
    Data(k).Patterns = DataMat(Data(k).PatternIndex,:);
end


end