function [CC2]=CC2(Data,Centroid)
% dl=load('Data.mat');
% Data=dl.Data.ans;

ClusterNumber=size(Data,2);
for k=1:ClusterNumber
Data(k).DistanceBetweenPatternsMat =  pdist(Data(k).Patterns,'euclidean');  
end

numerator=0;
for k=1:ClusterNumber
 Data(k).MaxDist = max (Data(k).DistanceBetweenPatternsMat);
 numerator = numerator + Data(k).MaxDist ;
end


for k=1:size(Data,2)
 CentroidDistance=  pdist(Centroid,'euclidean'); 
end
denominator=min(CentroidDistance);
CC2=numerator/denominator;
end