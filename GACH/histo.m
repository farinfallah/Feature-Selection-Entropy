clear all;
close all;
clc;
rand('state',0);

%% Get From Input
% 
disp('================================================================');
disp('1: Iris    |    2: Wine   |     3 :Cancer ');
disp('================================================================');
disp('4: Sonar   |    5: Pima   |     6 :Ionosphere');
disp('================================================================');

DatasetNum = input('*** Enter Dataset Number :     ');
% DatasetNum = 1;

%%
% load('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/AMLALL/D.mat');
% Ds01=Ds;
% Dataset=Ds;


%%

%% Select Dataset 
% Dataset : Dataset with label
% Ds01: standrize [0,1] x-min(X)/max(X)-Min(X)
% ZscoreDs: Dataset normalized with z-score
[Dataset,Ds01,ZscoreDs] = LoadDs(DatasetNum);

Label = Dataset(:,end);




%% Initialization
[M n]=size(Ds01);
X = Ds01;
L = floor(sqrt(M));
[Interval] = BetaPartition(X,L);
[ ~, IntervalCol]= size(Interval);
histoVar=zeros(n,L);

Feature.Hist=[];
Feature.Revised=[];
Feature.EffectiveMeasure=[];
Feature.Peak=[];
Feature.ID=[];
Features=repmat(Feature,1,n);

for i=1:n
Features(i).ID=i;
end
%% Find Historgram
result=[];
for i =1:n
    result=[result ; hist(X(:,i),L)];
    Features(i).Hist = hist(X(:,i),L);
    Features(i).Revised = hist(X(:,i),L);

end


% Count=zeros(n,L);
% for i=1:n
%     for j=1:M
%         for k=1:L
%             if(X(j,i)>=Interval(i,k)&& X(j,i)<=Interval(i,k+1))
%                 Count(i,k)=Count(i,k)+1;
%                 break;
%             end
%         end
%    end
% end


%% Delete Bins with less than 4 neighbors



for i=1:n
    for j=1:L
        if (result(i,j)<=4)
            result(i,j)=0;
            
        end 
        
          if (Features(i).Hist(j)<=4)
            Features(i).Revised(j)=0;
          end 
        
        
        
    end
end


%% Merge Adjacent & Equally neighbors


%% Calculate effective measure

Eff=[];
for i=1:n
    
    Features(i).Peak=findpeaks(Features(i).Revised);
    Features(i).EffectiveMeasure=size(Features(i).Peak,2);
 Eff=[Eff size(findpeaks(result(i,:)),2)];

end
%% Return TWO TOP Ranked Features

[~,SortedFeatIndex]=sort(Eff,'descend');

y=1;



