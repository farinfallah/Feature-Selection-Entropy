function [CC4]=CC4(Data,Centroid)

for ClusterNumber=1:size(Data,2)
Part1 =  pdist(Data(k).Patterns,'euclidean');  
end
%%distance onai ke ozv nisatn
CC4=0;

for k=1:ClusterNumber
Data(k).DistanceBetweenPatternsMat = ( pdist(Data(k).Patterns,'euclidean'));
end
for i=1:ClusterNumber
CC4=CC4+usf((1/Data(i).Count*(Part1))-(1/Data(i).Count*Part2));
end
end