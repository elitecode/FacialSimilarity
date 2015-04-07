function [Z] = MyConv(ImageIn,Mask)

[a1,b1,c1] = size(ImageIn);
[a2,b2,c2] = size(Mask);

B = zeros(a1,b2-1,c1);
C = zeros(a2-1,b1+b2+b2-2,c1);

A = horzcat(B,ImageIn,B);
A = vertcat(C,A,C);

for i=1:a2
    M1(a2-i+1,:) = Mask(i,:);
end
for i=1:b2
    M2(:,b2-i+1) = M1(:,i);
end

for i=1:(a1+a2-1)
    for j=1:(b1+b2-1)
        for k=1:c1
           X=double(A(i:i+a2-1,j:j+b2-1,k));
           Z(i,j,k) = sum(sum(X.*M2));
        end
    end
end
Z=Z(a2:a2+a1-1,b2:b2+b1-1,:);
end


        