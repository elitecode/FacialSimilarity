function [ matches ] = matchFeatures( desc1, desc2 )
%  dist=pdist2(desc1',desc2','euclidean');
matches=[];
 threshhold=0.7;
 m=size(desc1,2);
 n=size(desc2,2);
 count=1;
 for i=1:m
    for j=1:n 
        distances(j)=norm(double(desc1(:,i)-desc2(:,j)));
    end
%     distances=dist(i,:);
    sorted=sort(distances);
    min1=sorted(1);
    min2=sorted(2);
    minIdx=find(distances==min1);

    if min1/min2 < threshhold
        matches(1,count)=i;
        matches(2,count)=minIdx;
        count=count+1;
    end
 end

