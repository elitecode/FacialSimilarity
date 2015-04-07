function [Z] = MyGauss(Sigma,Size)

d=zeros(Size,Size);
for i=1:Size
    for j=1:Size
        d(i,j)=(exp(-(((i-((Size+1)/2))^2+(j-((Size+1)/2))^2)/(Sigma*Sigma))))^0.5;
    end
end
Z=d;
S = sum(sum(d));
Z=d./S;
end