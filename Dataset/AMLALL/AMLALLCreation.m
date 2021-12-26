%% Leukimia
% Sample#:  ... ALL and ... AML 
% Feat#: 7129
% Class#: 2
clear all;
clc;
GeneNum = 7129;
%% Load Train
fileTrain='/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/AMLALL/AMLALL_train.data';
format = [repmat('%f,', [1 GeneNum]) '%s'];
fid = fopen(fileTrain);
x = textscan(fid, format);
fclose(fid);
Train = cat(2, x{1:GeneNum});
TrainLabel = x{end};

%% Load Test

fileTest='/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/AMLALL/AMLALL_test.data';
format = [repmat('%f,', [1 GeneNum]) , '%s'];
fid = fopen(fileTest);
x = textscan(fid, format);
fclose(fid);
Test = cat(2, x{1:GeneNum});
TestLabel = x{end};

%%  Train and Test

AMLALL=[Train;Test];

AMLALLLabel=[TrainLabel;TestLabel];

%% Labels  AML=1 ALL=0
[row ~]=size(AMLALLLabel);
Label=ones(row,1);
for i=1:row
    if (strcmp(AMLALLLabel{i},'ALL'))
        Label(i)=0;
    end
end

%% Construct  normalize Dataset
% 1. NormalAMLALL theresholded with floor 1 and ceiling 16000
for i=1:row
    for j=1:GeneNum
        if(AMLALL(i,j)<1)
            AMLALL(i,j)=1;
        end
        if(AMLALL(i,j)>16000)
             AMLALL(i,j)=16000;
        end
    end
end

% 2. a base log 10
AMLALLlog10=log10(AMLALL);
% Delete zeros
ZeroVec=zeros(row,1);
AMLALLnonzero=[];
z=0;
for i=1:GeneNum
    if(ZeroVec==AMLALLlog10(:,i))
      z=z+1;
    else
      AMLALLnonzero=[AMLALLnonzero,AMLALLlog10(:,i)];
    end
        
end
% 3. Standrize
[ F1New]=zscore(AMLALLnonzero); 
%% Standrize with zero mean and unit variance
% F1New=[];
% for i=1:row
% F1=AMLALLnonzero(i,:);
% V1=std(F1);
% M1=mean(F1);
% M1rep=repmat(M1,1,GeneNum);
% V1rep=repmat(V1,1,GeneNum);
% zcr=(F1-M1rep)./V1rep
% F1New=[F1New,zscr];
% end
%  AMLALLnonzero= AMLALLnonzero-mean( AMLALLnonzero(:));
%  F1New= AMLALLnonzero/std( AMLALLnonzero(:));

Ds=[F1New,Label];
save('Ds','Ds');

%% Normalization
% F1=NormalAMLALL(2,:);
% v1=std(F1)
% m1=mean(F1)
% x11=(F1(1)-m1)/v1