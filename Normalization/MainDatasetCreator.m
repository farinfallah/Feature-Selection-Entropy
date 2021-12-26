%% Main Generate Dataset
clc
%% Iris
% Sample#: 150 
% Feat#:4
% Class#: 3
clear all;
Dataset=load('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/iris/iris.dat');
Ds=Dataset(:,1:end-1);
Ds01 = Normalize01(Ds);
ZscoreDs = ZScore(Ds);
%  Save
save('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/iris/iris','Dataset','Ds01','ZscoreDs');

%% Wine
% Sample#: 178 
% Feat#:13
% Class#: 3
clear all;
Dataset=load('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/wine/wine.dat');
Ds=Dataset(:,1:end-1);
Ds01 = Normalize01(Ds);
ZscoreDs = ZScore(Ds);
%  Save
save('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/wine/wine','Dataset','Ds01','ZscoreDs');

%% Cancer
% Sample#: 648 
% Feat#:10
% Class#: 2
clear all;
Dataset=load('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/cancer/cancer.dat');
Ds=Dataset(:,1:end-1);
Ds01 = Normalize01(Ds);
ZscoreDs = ZScore(Ds);
%  Save
save('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/cancer/cancer','Dataset','Ds01','ZscoreDs');


%% Sonar
% Sample#: 208 
% Feat#:60
% Class#: 2
clear all;
name='/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/sonar/sonar.dat';
Dataset =TextDs(name,60);
Ds=Dataset(:,1:end-1);
Ds01 = Normalize01(Ds);
ZscoreDs = ZScore(Ds);
%Save
save('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/sonar/sonar','Dataset','Ds01','ZscoreDs');

%% Pima
% Sample#: 768 
% Feat#:8
% Class#: 2
clear all;
name='/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/pima/pima.dat';
Dataset =TextDs(name,8);
Ds=Dataset(:,1:end-1);
Ds01 = Normalize01(Ds);
ZscoreDs = ZScore(Ds);
%Save
save('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/pima/pima','Dataset','Ds01','ZscoreDs');

%% Ionosphere
% Sample#: 351 
% Feat#:34
% Class#: 2
clear all;
name='/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/ionosphere/ionosphere.dat';
Dataset =TextDs(name,34);
Ds=Dataset(:,1:end-1);
Ds01 = Normalize01(Ds);
ZscoreDs = ZScore(Ds);
%Save
save('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/ionosphere/ionosphere','Dataset','Ds01','ZscoreDs');


