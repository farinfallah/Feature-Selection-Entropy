function [Ds] =LoadDsGE(DatasetNum)

switch DatasetNum
    case 1
       load('../Dataset/AMLALL/AMLALL.mat');
    case 2
       load('../Dataset/wine/wine.mat');
    case 3
     load('../Dataset/cancer/cancer.mat');
  

    otherwise
        disp('Enter Valid Number');
        DatasetNum = input('Enter Dataset Number :');
end