function [Beta] = Partition(Binsize)
% Binsize=4;
Beta = zeros(1,Binsize);
Dis=(1/Binsize);
Beta(1)=Dis/2;
for i=2:Binsize
    Beta(i)=Beta(i-1)+Dis;
end

end