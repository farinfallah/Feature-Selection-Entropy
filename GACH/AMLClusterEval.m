clear all;
close all;
clc;
rand('state',0);

F10=[449 523 643 873 1169 1231 1492 1724 2079 2110 ];
F20=[449 523 643 873 1169 1231 1492 1724 2079 2110 2628 2644 3000 3764 4543 4704 4814 5482 5587 5616];
F30=[449 523 643 873 1169 1231 1492 1724 2079 2110 2628 2644 3000 3764 4543 4704 4814 5482 5587 5616 5793 6047 6624 6625 6694 6821 10 17 22 31];

load('../Dataset/AMLALL/Ds.mat');
[EstimatedLabel,Centroid]=kmeans(Ds(:,1:end-1),2);
[Data] = Data2Struct(Ds(:,1:end-1), EstimatedLabel);
[CC1]=CC1(Data,Centroid,6891);
[CC2]=CC2(Data,Centroid);
[CC3]=CC3(Data);
[CC4]=CC4(Data,Centroid);






D10=Ds(:,F10);
D20=Ds(:,F20);
D30=Ds(:,F30);

[EstimatedLabel10,Centroid10]=kmeans(D10,2);
[EstimatedLabel20,Centroid20]=kmeans(D20,2);
[EstimatedLabel30,Centroid30]=kmeans(D30,2);


[Data10] = Data2Struct(D10, EstimatedLabel10);
[Data20] = Data2Struct(D20, EstimatedLabel20);
[Data30] = Data2Struct(D30, EstimatedLabel30);
% 
[CC110]=CC1(Data10,Centroid10,10);
[CC120]=CC1(Data20,Centroid20,20);
[CC130]=CC1(Data30,Centroid30,30);

[CC210]=CC2(Data10,Centroid10);
[CC220]=CC2(Data10,Centroid20);
[CC230]=CC2(Data10,Centroid30);

[CC310]=CC3(Data10);
[CC320]=CC3(Data20);
[CC330]=CC3(Data30);


[CC410]=CC4(Data10,Centroid10);
[CC420]=CC4(Data10,Centroid20);
[CC430]=CC4(Data10,Centroid30);














