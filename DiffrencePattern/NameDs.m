function [name] = NameDs(DatasetNum)

switch DatasetNum
    case 1
        name ='iris';
    case 2
          name ='wine';
    case 3
          name ='cancer';
     case 4
           name ='sonar';
    case 5
          name ='pima';
   case 6
         name ='ionosphere';
    
end