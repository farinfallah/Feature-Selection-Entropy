function [W]= Weight(Entropy)
[Erow,ECol] = size(Entropy);
    if(Erow==2)
        W = abs(Entropy(1,:) - Entropy(2,:));
    else
        W =(Entropy);
    end
end