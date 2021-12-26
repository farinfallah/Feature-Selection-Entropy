% Frequency plot 
% Supervised
clear
close all;
Dataset=load('Dataset/iris.mat');
Ds=Dataset.Ds01;
Label=Dataset.Dataset(:,end);
LabelUnq=unique(Label);
ClusterNum=size(LabelUnq,1);
[SampleNum,FeatNum]=size(Ds);
Binsize=10;
Interval=0:1/(Binsize-1):1;
% Feature=3; Vector=Ds(:,Feature);
%%
PlotFrqFor1Feat(Ds(:,3),Interval,Binsize,ClusterNum,SampleNum,Label)

for Feature=1:FeatNum
Vector=Ds(:,Feature);
figure;
PlotFrqFor1Feat(Vector,Interval,Binsize,ClusterNum,SampleNum,Label)
end
