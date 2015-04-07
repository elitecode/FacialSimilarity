function [Face] = FaceDetect(Image)

hsvIm = rgb2hsv(Image);

Im1 = MyConv(hsvIm,MyGauss(5,5));

EdgeIm = rgb2gray(hsvIm-Im1);

SkinImage = Skindetect(hsvIm,EdgeIm);


[m,n]=size(SkinImage);

sumRows=sum(SkinImage,2)/(n*255);
idx=find(sumRows<0.15);
SkinImage(idx,:)=[];
Image(idx,:,:)=[];

[m,n]=size(SkinImage);
sumCols=sum(SkinImage,1)/(m*255);
idx=find(sumCols<0.15);
SkinImage(:,idx)=[];
Image(:,idx,:)=[];

[P,clusters] = bwlabel(SkinImage,8);
for i=1:clusters
    [r,c]=find(P==i);
    rMin=min(r);
    rMax=max(r);
    cMin=min(c);
    cMax=max(c);
    t(i,:)=[rMin,cMin,rMax-rMin,cMax-cMin];
end

    area=t(:,3).*t(:,4);
    minIdx=find(area==max(area));
    t=t(minIdx,:);

Face=Image(t(1):t(3)+t(1),t(2):t(2)+t(4),:);
end

