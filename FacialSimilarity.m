function [ out_img gender name  ] = FacialSimilarity( testImage,Seq,Names,label,d)
N=size(Seq,2);
testFace=FaceDetect(testImage);
[testF,testD]= Sift(testFace,1);
mm = [];
max=0;
idx=-1;
for i=1:N
    [matches] = matchFeatures(d{i}, testD) ;
    mm(i) = size(matches,2);
end
[kmm kid] = sort(mm,'descend');
idx = kid(1:11);
W = mm(kid(1:11));
result=idx;
gend = sum(label(result).*W);
if(gend/sum(W)>0.5)
    disp('male')
    gender = 1;
else
    disp('female')
    gender = 0;
end
index = 1;
for i=1:11
    if(gender==label(result(i)))
        out_img(index) = Seq(result(i));
        str = Names{result(i)};
        str=str(1:length(str)-9)
        name(index) = {strrep(str,'_',' ')};
        index = index+1;
    end
end
if(gender==0)
    gender = 'Female';
else
    gender = 'Male';
end
end

