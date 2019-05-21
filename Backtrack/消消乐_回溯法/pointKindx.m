function [status] = pointKindx(point,initialMatrix)
if nargin == 0
    
   initialMatrix = [0     0     0     0;
                 0     0     0     3;
                 3     0     0     3;
                 3     0     0     4;
                 2     0     0     3;
                 1     0     0     1;
                 1     2     3     3;
                 1     2     1     2;];
    point = findPoint(initialMatrix,4);
end

[~,n]=size(point);
[Row,Col] = size(initialMatrix);
if(n<=1)
    status = 0;
else
    for i = 1:(n-1)
        if(point(1,i) == point(1,i+1))
            if(point(2,i)+1 == point(2,i+1))
                row = point(1,i);
                col = point(2,i);
                row1 = row -1;col1 = col -1;
                row2 = row +1;col2 = col -1;
                row3 = row -1;col3 = col +2;
                row4 = row +1;col4 = col +2;
                row5 = row +3;col5 = col;
                row6 = row -2;col6 = col;
                if(0<row1 && row1<=Row && 0<col1 && col1<=Col && (initialMatrix(row1,col1) == initialMatrix(row,col)))
                    status = 1;
                elseif(0<row2 && row2<=Row && 0<col2 && col2<=Col && (initialMatrix(row2,col2) == initialMatrix(row,col)))
                    status = 1;
                elseif(0<row3 && row3<=Row && 0<col3 && col3<=Col && (initialMatrix(row3,col3) == initialMatrix(row,col)))
                    status = 1;
                elseif(0<row4 && row4<=Row && 0<col4 && col4<=Col && (initialMatrix(row4,col4) == initialMatrix(row,col)))
                    status = 1;
                elseif(0<row5 && row5<=Row && 0<col5 && col5<=Col && (initialMatrix(row5,col5) == initialMatrix(row,col)))
                    status = 1;
                elseif(0<row6 && row6<=Row && 0<col6 && col6<=Col && (initialMatrix(row6,col6) == initialMatrix(row,col)))
                    status = 1;
                else
                    status = 0;
                end
            else
                status = 0;
            end
        else
            status = 0;
        end
    end
end
end