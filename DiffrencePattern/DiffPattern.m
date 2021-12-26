 function [BestFeature] = DiffPattern(name)
%  name='iris';
url=strcat('../Dataset/',name);
url=strcat(url,'/');
url=strcat(url,name);
url=strcat(url,'.mat');
D=load(url);
Ds=D.Ds01;
[SampleNum FeatNum]=size(Ds);
[s ii]=sort(Ds);
Sum=zeros(1,FeatNum);
for i=1:FeatNum
    MyCol=unique(Ds(:,i));
    for j=1:size(MyCol,2)
      Sum(i)=Sum(i)+(MyCol(j)-MyCol(j+1));
    end
end

[sorted index]=sort(Sum);
BestFeature=index(1);
end