 function [i] = RegBin(Ds)

[SampleNum FeatNum]=size(Ds);
Xx=(1:SampleNum)';
for i=1:FeatNum
    X=Ds(:,i);
    X=sort(X);
    [~,m(i),b(i)] = regression(Xx,X,'one');
    y(i,:)=m(i).*Xx+repmat(b(i),SampleNum,1);
% figure(i);
% bar(X)
% hold on
% plot(Xx,y(i,:),'*-r')
end

XRep=repmat(X,1,FeatNum)';
MySum=sum(abs(XRep-y),2);
[s i]=sort(MySum);
% out=i(1);

end