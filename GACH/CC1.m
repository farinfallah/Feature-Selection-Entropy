function [CC1]=CC1(Data,Centroid,NumberOfFeature)
%% Test
% load('../Dataset/iris/iris.mat');
% DataMat=Ds01;
% EstLabel=Dataset(:,end);
% Data = Data2Struct(DataMat, EstLabel);
% [~,Centroid]=kmeans(DataMat,3);
% NumberOfFeature=4;
%% Finding Global Centroid
ClusterNumber=size(Data,2);
GlobalCentroid=sum(Centroid)./NumberOfFeature;
%%

part1=0;
part2=0;
for k=1:ClusterNumber
    part1 =part1+ sum(pdist2(Data(k).Patterns, Centroid(k,:)));
    part2 = part2 + pdist([Centroid(k,:);GlobalCentroid]);

end

CC1=part1+part2;
end