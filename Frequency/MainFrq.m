% Main Frequency
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

[Dataset,Ds01,~,~] =LoadDs(DatasetNum);
%% Initial Calculation 
Label=Dataset(:,end);
clear Dataset;
LabelUnq=unique(Label);
H=histc(Label,LabelUnq);
[SampleNum FeatNum]=size(Ds01);
Frq=10;
ClusterNum=size(LabelUnq,1);
E=FFreq(Ds01,Frq,SampleNum,ClusterNum);
