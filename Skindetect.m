function [Z] = Skindetect(HSVImage,EdgeImage)


load ('dataset.mat');
[rows,col,o] = size(HSVImage);
Z = zeros(rows,col);

for i=1:rows
    for j=1:col
        k = floor(HSVImage(i,j,1)/0.2)+1;
            if (k==6)
                k = 5;
            end
            
        l = floor(HSVImage(i,j,2)/0.2)+1;
            if (l==6)
                l = 5;
            end
            
        if (bin(k,l)>(0.15) && EdgeImage(i,j)<0.3)
            
          Z(i,j) = 255;
        else
          Z(i,j) = 0;
        end
        
    end
end

end
                    
            