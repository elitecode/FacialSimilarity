function []=createbin()
A=imread('./data/skin1.jpg');
A=rgb2hsv(A);
[n,m,~]=size(A);
bin = zeros(5,5);
for i=1:n
    for j=1:m
        x = floor((A(i,j,1)*5))+1;
        y = floor((A(i,j,2)*5))+1;
        if(x==6)
            x=5;
        end
        if(y==6)
            y=5;
        end
        bin(x,y)=bin(x,y)+1;
    end
end
div=sum(sum(bin));
bin = bin/div;
save dataset bin
end
