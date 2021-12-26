function [CC2]=CC2(Data,Centroid)
%% Test
% load('../Dataset/iris/iris.mat');
% DataMat=Ds01;
% EstLabel=Dataset(:,end);
% Data = Data2Struct(DataMat, EstLabel);
% [~,Centroid]=kmeans(DataMat,3);

%%
ClusterNumber=size(Data,2);
numerator=0;

for k=1:ClusterNumber
Data(k).DistanceBetweenPatternsMat =  pdist(Data(k).Patterns,'euclidean');
 Data(k).MaxDist = max (Data(k).DistanceBetweenPatternsMat);
 numerator = numerator + Data(k).MaxDist ;

end

CentroidDistance=  pdist(Centroid,'euclidean'); 
denominator=min(CentroidDistance);

CC2=numerator/denominator;
end