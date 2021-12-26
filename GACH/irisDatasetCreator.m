%% Main Generate Dataset
clc
%% Iris
% Sample#: 150 
% Feat#:4
% Class#: 3
% % % clear all;
 Dataset=load('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/iris/iris.dat');
% % % Ds=Dataset(:,1:end-1);
% % % Ds01 = Normalize01(Ds);
% % % ZscoreDs =  zscore(Dataset(:,1:end-1));
% % % 
% % % %  Save
% % % save('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/iris/iris','Dataset','Ds01','ZscoreDs');
% % % 

%%%%%%%%%%%


GeneNum = 4;
%% Load Train
fileTrain='/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/iris/iris.data';
format = [repmat('%f,', [1 GeneNum]) '%s'];
fid = fopen(fileTrain);
x = textscan(fid, format);
fclose(fid);
Train = cat(2, x{1:GeneNum});
TrainLabel = x{end};



%% Labels  AML=1 ALL=0
[row ~]=size(TrainLabel);
Label=ones(row,1);
for i=1:row
    if (strcmp(TrainLabel{i},'Iris-setosa'))
        Label(i)=1;
    elseif (strcmp(TrainLabel{i},'Iris-versicolor'))
        Label(i)=2;
    else
        Label(i)=3;
        
    end
end

