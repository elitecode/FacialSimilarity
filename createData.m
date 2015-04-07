function [ Seq Names label d ] = createData( )
run('../vlfeat/toolbox/vl_setup')
imgPath1 = './data/male/';
imgPath2='./data/female/';
imgType = '*.jpg'; % change based on image type
images  = dir([imgPath1 imgType]);
Seq={};
Names={};
for idx = 1:length(images)
    Seq(idx) = {imread([imgPath1 images(idx).name])};
    Names(idx) = {images(idx).name};
    label(idx)=1;
end
n1=idx;
images  = dir([imgPath2 imgType]);
for idx = 1:length(images)
    Seq(idx+n1) = {imread([imgPath2 images(idx).name])};
    Names(idx+n1) = {images(idx).name};
    label(idx+n1)=0;
end
N=n1+idx;
f={};
d={};
N=size(Seq,2);
for i=1:N
    I1 = Seq{1,i};
    waitbar(i/N);
    Face1 = FaceDetect(I1);
    [a,b] = Sift(Face1, 1);
    f(i)={a};
    d(i)={b};
end


end

