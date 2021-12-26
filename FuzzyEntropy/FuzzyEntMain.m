clc
clear all;
close all;
rand('state',0)
%% Leukemia
 Dataset=load('../Dataset/AMLALL.mat');
 Ds=Dataset.Ds(:,1:end-1);
  Label=Dataset.Ds(:,end);n=10;
%% UCI dataset
%  Dataset=load('Dataset/leukmia.mat');
%  Ds=Dataset.Ds01;
%  Label=Dataset.Dataset(:,end); n=1;
 %%
LabelUnq=unique(Label);
H=histc(Label,LabelUnq);
ClusterNum=size(LabelUnq,1);
[SampleNum,FeatNum]=size(Ds);
%% Binsize             
MaxNum=20;
MinNum=ClusterNum+1;
% BestFeatNum=Bin2(Ds);

 for i=1:FeatNum
     Binsize(i)=FeatEval(MinNum,MaxNum,Ds,i);
 end

%% Interval Generator
for i=1:FeatNum
Interval{i}=0:(1/Binsize(i)):1;
[Param{i},~,~]=TriParamGenerator(Interval{i});
end
% Feature=3; Vector=Ds(:,Feature);
%% Set Parameter for Membership Function
FuzzyEnt=[];
for i=1:FeatNum
FuzzyEntTemp=FuEntBin(Param{i},Ds(:,i),Interval{i},SampleNum,ClusterNum);
FuzzyEnt=[FuzzyEnt,FuzzyEntTemp];
end
[W]=EntWeightCol(FuzzyEnt);%
[Acc,Pure,indexw]=KmeansAccPure2(W,Ds,Label,n,ClusterNum);
%-----------------
Interval1= IntervalGenerator(Ds,Binsize);
% [E1,E2] = Enrtopy(Ds,Label,Interval1,SampleNum,FeatNum,Binsize
E2=zeros(1,FeatNum);
E1=[];
for ii=1:FeatNum
[E1Temp,E2(ii)] = Ent(Ds(:,ii),Interval1(ii,:),SampleNum,ClusterNum);
E1=[E1,E1Temp];
end
[W]=EntWeight1(E1); %
[Acc2,Pure2,indexw2]= KmeansAccPure2(W,Ds,Label,n,ClusterNum);
PlotPureAccFuzzy2(FeatNum,Acc,Acc2,Pure,Pure2,n);
eeeeee=1;