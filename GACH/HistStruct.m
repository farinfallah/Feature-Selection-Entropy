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
[Dataset,Ds01,~] = LoadDs(DatasetNum);
X = Ds01;

%% Initialization
[PatternNumber, FeatureNumber]=size(X);
L = floor(sqrt(PatternNumber));
% Interval = BetaPartition(X,L);
% [ ~, IntervalCol]= size(Interval);
Features=repmat(struct([]),1,FeatureNumber);

for i=1:FeatureNumber
Features(i).Number=i;
end
%% Find Historgram
result=[];
for i =1:FeatureNumber
    result=[result ; hist(X(:,i),L)];
    figure;
     hist(X(:,i),L)
    Features(i).Hist = hist(X(:,i),L);
    Features(i).Revised = Features(i).Hist;

end

%% Delete Bins with less than 4 neighbors

for i=1:FeatureNumber
    for j=1:L
        if (result(i,j)<=4)
            result(i,j)=0;
       
            
        end 
        
         if (Features(i).Hist(j)<=4)
            Features(i).Revised(j)=0;
         end 
         
    end
end


%% Merge Adjacent & Equally neighbors &&Calculate effective measure


Eff=[];
for i=1:FeatureNumber
    
    [Features(i).Peak,Features(i).PeakLocation]=findpeaks(Features(i).Revised);
    Features(i).EffectiveMeasure=size(Features(i).Peak,2);
    Eff=[Eff size(findpeaks(result(i,:)),2)];

end
%% Return TWO TOP Ranked Features

[~,SortedFeatIndex]=sort(Eff,'descend');
disp(mat2str(SortedFeatIndex));




