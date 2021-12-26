function [NewDs] = TextDs(name , FeatNum)
%% Load Train
format = [repmat('%f,', [1 FeatNum]) '%s'];
fid = fopen(name);
x = textscan(fid, format);
fclose(fid);
NewDsFeat = cat(2, x{1:FeatNum});
NewDsLabel = x{end};
NewDsLabelUnq=unique(NewDsLabel);
%%
[SampleNum, ~]=size(NewDsLabel);
NewDsLabelConvert=zeros(SampleNum,1);
for i=1:SampleNum
    for j=1:size(NewDsLabelUnq,1)
        if(strcmp(NewDsLabel{i},NewDsLabelUnq{j}))
            NewDsLabelConvert(i)=j;
        end
       
    end
end

NewDs=[NewDsFeat,NewDsLabelConvert];
end