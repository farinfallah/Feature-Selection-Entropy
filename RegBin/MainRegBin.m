clear all;
close all;
clc;
rand('state',0);

%% Get From Input

disp('================================================================');
disp('1: Iris    |    2: Wine   |     3 :Cancer ');
disp('================================================================');
disp('4: Sonar   |    5: Pima   |     6 :Ionosphere');
disp('================================================================');

DatasetNum = input('*** Enter Dataset Number :     ');

%% Select Dataset
% Dataset : Dataset with label
% Ds01: standrize [0,1] x-min(X)/max(X)-Min(X)
% ZscoreDs: Dataset normalized with z-score
[Dataset,Ds01,ZscoreDs] = LoadDs(DatasetNum);
%% Initial Calculation 
DatasetName=NameDs(DatasetNum);
Ds = Dataset(:,1:end-1);
Label = Dataset(:,end);
LabelUnq = unique(Label);
[SampleNum FeatNum]=size(Ds);
%% Binsize
[Binsize]=RegBinCreation(Ds01);
% Binsize = ; 
%% Create interval
IntervalDs01 = IntervalGenerator(Ds01,Binsize);
%% Calculate Entropy
[EntDs01_1,EntDs01_2] = Enrtopy(Ds01,Label,IntervalDs01,SampleNum,FeatNum,Binsize);
% [EntZscoreDs1,EntZscoreDs2] = Enrtopy(ZscoreDs,Label,IntervalZscoreDs,SampleNum,FeatNum,Binsize);
%% Weighting Schema
[W1]=Weight(EntDs01_1);
4[W2]=Weight(EntDs01_2);
%% K-means
n = 1;
k = size(LabelUnq,1);
[AccDs1,PureDs1,indexw1]=KmeansAccPure(W1,Ds01,Label,n,k);
[AccDs2,PureDs2,indexw2]=KmeansAccPure(W2,Ds01,Label,n,k);
disp('Feature Rank 0-1 Normalization (With RegBin)-Weight: ent+ - ent -:');
% [s,index]=sort(W21_EntDs01_1(2,:)-W21_EntDs01_1(1,:));
disp(indexw1);
disp('================================================================');
disp('Feature Rank 0-1 Normalization (Without RegBin)Weight=Entropy1:');
disp(indexw2);
disp('================================================================');
PlotPureAcc(FeatNum,AccDs1,AccDs2,PureDs1,PureDs2,n);
