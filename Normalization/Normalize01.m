%% Calculate x-min(X)/max(X)-Min(X)
function [NormalizeDs] = Normalize01(Dataset)
%% --------- Test 
%  Dataset=load('/Users/farinaz/Documents/GeneExpressionDataClustering/3-4 Idea & Impelementation/Dataset/iris/iris.dat');
%  Dataset=Dataset(: , 1:end-1);
%% --------- End Test 
[SampleNum , FeatNum] = size(Dataset);
%% Min andd Max
MinDataset = min(Dataset);
MaxDataset = max(Dataset);
%% if Min=Max,save index
Col = [];
for i = 1:FeatNum
    if (MinDataset(i) == MaxDataset(i))
        Col=[Col i];
    end
end
%% Diffrence
DiffMaxMin = MaxDataset - MinDataset;
%% Repmat
MinDatasetRep = repmat(MinDataset , SampleNum , 1);
DiffMaxMinRep = repmat(DiffMaxMin , SampleNum , 1);
%% Calculate Normalize
NormalizeDs=(Dataset - MinDatasetRep) ./ DiffMaxMinRep;
%% if min=max put 0 in all samples 
z=zeros(1,2);
if(size(Col)~=z)
    for i=1:size(Col,2)
       NormalizeDs(:,Col(i))=0;
    end
end

end