function [Dataset,Ds01,ZscoreDs] =LoadDs(DatasetNum)

switch DatasetNum
    case 1
       load('../Dataset/iris/iris.mat');
    case 2
       load('../Dataset/wine/wine.mat');
    case 3
     load('../Dataset/cancer/cancer.mat');
    case 4
     load('../Dataset/sonar/sonar.mat');
    case 5
     load('../Dataset/pima/pima.mat');
   case 6
      load('../Dataset/ionosphere/ionosphere.mat');
    otherwise
        disp('Enter Valid Number');
        DatasetNum = input('Enter Dataset Number :');
end