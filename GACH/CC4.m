function [CC4]=CC4(Data,Centroid)

%% Test
% load('../Dataset/iris/iris.mat');
% DataMat=Ds01;
% EstLabel=Dataset(:,end);
% Data = Data2Struct(DataMat, EstLabel);
% [~,Centroid]=kmeans(DataMat,3);
% 
 ClusterNumber=size(Data,2);


usf=[];
for k=1:ClusterNumber
   distance=[];

    for kk=k+1:ClusterNumber
    for j=1:Data(k).Count
        distance=[distance pdist2(Data(k).Patterns(j,:),Data(kk).Patterns)];
    end
    end
    
    % usf
    ClusterCount=Data(k).Count;
    Data(k).distwithin =  pdist(Data(k).Patterns,'euclidean');
varusf=((1/ClusterCount)*(sum(distance))-(1/ClusterCount)*(sum(Data(k).distwithin)));
    usf=[usf ,varusf];
end
CC4=sum(heaviside(usf));




end