function []=PlotFrqFor1Feat(Vector,Interval,Binsize,ClusterNum,SampleNum,Label)
Count=zeros(ClusterNum,Binsize);
  for j=1:SampleNum
        for k=1:Binsize
              if(Vector(j)>=Interval(k)&& Vector(j)<=Interval(k+1))
                  i=Label(j);
                Count(i,k)=Count(i,k)+1;
                break;
              end
        end
   end
 %% PLOT
 if(ClusterNum==3)
plot(Interval,Count(1,:),'-*r') ;hold on
plot(Interval,Count(2,:),'-ok');hold on
plot(Interval,Count(3,:),'-^')
 else
plot(Interval,Count(1,:),'-*r') ;hold on
plot(Interval,Count(2,:),'-ok');
 end