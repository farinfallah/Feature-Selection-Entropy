function [CC3]=CC3(Data)
%% Test
% load('../Dataset/iris/iris.mat');
% DataMat=Ds01;
% EstLabel=Dataset(:,end);
% Data = Data2Struct(DataMat, EstLabel);
% [~,Centroid]=kmeans(DataMat,3);
%%
ClusterNumber=size(Data,2);
part1=0;

for k=1:ClusterNumber
Data(k).DistanceBetweenPatternsMat =  pdist(Data(k).Patterns,'euclidean');
 Data(k).MaxDist = max (Data(k).DistanceBetweenPatternsMat);
 part1 = part1 + Data(k).MaxDist ;

end

min1=[];
for k=1:ClusterNumber
    for kk=k+1:ClusterNumber
    for j=1:Data(k).Count
        min1=[min1 pdist2(Data(k).Patterns(j,:),Data(kk).Patterns)];
    end
    end
end
Part2=min(min1);
CC3=part1-Part2;
end