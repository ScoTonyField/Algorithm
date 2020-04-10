function [point] = findPoint(initialMatrix,number)

    if nargin < 2
       initialMatrix = [3,3,4,3;...
                         3,2,3,3;...
                         2,4,3,4;...
                         1,3,4,3;...
                         3,3,1,1;...
                         3,4,3,3;...
                         1,4,4,3;...
                         1,2,3,2;];
        number = 3;
    end
    
    [row,col] = size(initialMatrix);
    count = 1;
    point = [];
    for i = 1:row
        for j = 1:col
            if(initialMatrix(i,j) == number)
                point(1,count)=i;
                point(2,count)=j;
                count = count + 1;
            end
        end
    end
end