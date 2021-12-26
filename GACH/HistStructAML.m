clear all;
close all;
clc;
rand('state',0);

%% Get From Input

disp('================================================================');
disp('1: AMLALL    |    2: ProstateCancer   |     3 : Cancer ');
DatasetNum = input('*** Enter Dataset Number :     ');

[Ds] =LoadDsGE(DatasetNum);
X=Ds(:,1:end-1);


%% Initialization
[PatternNumber, FeatureNumber]=size(X);
L = floor(sqrt(PatternNumber));
Interval = BetaPartition(X,L);
[ ~, IntervalCol]= size(Interval);
histoVar=zeros(FeatureNumber,L);


Features=repmat(struct([]),1,FeatureNumber);

for i=1:FeatureNumber
Features(i).ID=i;
end
%% Find Historgram
result=[];
for i =1:FeatureNumber
    result=[result ; hist(X(:,i),L)];
    if(i==449)
    figure;
     hist(X(:,i),L)
    end
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


%% Merge Adjacent & Equally neighbors


%% Calculate effective measure

Eff=[];
for i=1:FeatureNumber
    
    [Features(i).Peak,Features(i).PeakLocation]=findpeaks(Features(i).Revised);
    Features(i).EffectiveMeasure=size(Features(i).Peak,2);
    Eff=[Eff size(findpeaks(result(i,:)),2)];

end
%% Return TWO TOP Ranked Features

[~,SortedFeatIndex]=sort(Eff,'descend');
disp(mat2str(SortedFeatIndex));




