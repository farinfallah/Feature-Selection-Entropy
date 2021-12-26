function [Out1,Out2,Out3]=TriParamGenerator(TriInterval)
% TriInterval=0:0.25:1;
[row col]=size(TriInterval);
n=size(TriInterval,2)-1;
Out1=[];
Out2=[];
Out3=[];
for i=1:(col-1)
     m1=(TriInterval(i)+TriInterval(i+1))/2;
    Out1=[Out1;TriInterval(i),m1,TriInterval(i+1)];
    Out2=[Out2;TriInterval(i),TriInterval(i),TriInterval(i+1)];
    Out3=[Out3;TriInterval(i),TriInterval(i+1),TriInterval(i+1)];
end

end