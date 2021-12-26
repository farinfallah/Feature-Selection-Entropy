clear all;
close all;
clc;
rand('state',0);

%% Get From Input
% 
% disp('================================================================');
% disp('1: Iris    |    2: Wine   |     3 :Cancer ');
% disp('================================================================');
% disp('4: Sonar   |    5: Pima   |     6 :Ionosphere');
% disp('================================================================');

% DatasetNum = input('*** Enter Dataset Number :     ');
 DatasetNum = 1;


%% Select Dataset 
% Dataset : Dataset with label
% Ds01: standrize [0,1] x-min(X)/max(X)-Min(X)
% ZscoreDs: Dataset normalized with z-score
[Dataset,Ds01,ZscoreDs] = LoadDs(DatasetNum);
X = Ds01;

%% Initialization
[PatternNumber, FeatureNumber]=size(X);
L = floor(sqrt(PatternNumber));
[Beta] = Partition(L);

Features=repmat(struct([]),1,FeatureNumber);

for i=1:FeatureNumber
Features(i).ID=i;
end
%% Find Historgram


Hist=zeros(FeatureNumber,L);
Revised=zeros(FeatureNumber,L);
% 
% for i=1:FeatureNumber
%     for j=1:PatternNumber
%         for k=1:L
%             if(X(j,i)>=Beta(k)&& X(j,i)<=Beta(k+1))
%                 Hist(i,k)=Hist(i,k)+1;
%                 Revised(i,k)=Revised(i,k)+1;
% 
%                 break;
%             end
%         end
%    end
% end

BinDis=zeros(PatternNumber,L);

for i=1:FeatureNumber
    for j=1:PatternNumber
        for k=1:L
             BinDis(j,k)=abs(X(j,i)-Beta(k));  
        end
    end
    %find argmin and min
    
end
%% Delete Bins with less than 4 neighbors

for i=1:FeatureNumber
    for j=1:L
        if (Hist(i,j)<=4)
            Revised(i,j)=0;
            
        end 
       
    end
end


%% Merge Adjacent & Equally neighbors




%% Calculate effective measure

Eff=[];
for i=1:FeatureNumber

    Eff=[Eff size(findpeaks(Revised(i,:)),2)];

end
%% Return TWO TOP Ranked Features

[~,SortedFeatIndex]=sort(Eff,'descend');
disp(SortedFeatIndex);


%% ADD To STRUCTURE
for i=1:FeatureNumber
    Features(i).ID=i;
    Features(i).Hist=Hist(i,:);
    Features(i).Revised=Hist(i,:);
    [Features(i).Peak , Features(i).PeakLocation]=findpeaks(Features(i).Revised);
    Features(i).EffectiveMeasure=size(Features(i).Peak,2);
end




