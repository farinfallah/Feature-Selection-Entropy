
function [Binsize]=RegBinCreation(Ds01)
BestFeatNum=RegBin(Ds01);
[SampleNum FeatNum]=size(Ds01);
BestFeat=Ds01(:,BestFeatNum);
MaxNum=20;

for b=2:MaxNum
Count{b-1}=zeros(1,b);
Interval=0:(1/b):1;
% for i=1:FeatNum
    for j=1:SampleNum
        for k=1:b
              if(BestFeat(j)>=Interval(k)&& BestFeat(j)<=Interval(k+1))
                Count{b-1}(k)=Count{b-1}(k)+1;
                break;
              end
        end
   end
% end
end

for i=1:MaxNum-1
   MyCount=Count{i};
   Interval=1:(i+1);

   [~,m(i),b(i)] = regression(Interval,MyCount,'one');
 y{i}=m(i).*Interval+repmat(b(i),1,size(Interval,2));
%   figure(i);
%   bar(MyCount)
%   hold on
%  plot(Interval,y{i},'*-r')

end
%% ---------
for i=1:MaxNum-1
   MyCount=Count{i};
   Interval=1:(i+1);
   out(i)=sum(abs(Interval-y{i}),2);

end
[s id]=sort(out);

Binsize=id(1)+1;
% Finalout=[];
% for j=1:MaxNum-1
%     if(rem(j,LabelSize)==(LabelSize-2))
%         Finalout=[Finalout,out(j)];
%     end
% end
% [s id]=sort(Finalout);
% Binsize=id(1)*LabelSize;
end
