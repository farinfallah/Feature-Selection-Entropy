%% Calculate z-score 
function [NormalizeDs] = ZScore(Dataset)
NormalizeDs = zscore(Dataset);
end
