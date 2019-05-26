function [status] = pointKindone(point,initialMatrix)
    if nargin == 0
        
       initialMatrix = [3,3,4,3;...
                         3,2,3,3;...
                         2,4,3,4;...
                         1,3,4,3;...
                         3,3,1,1;...
                         3,4,3,3;...
                         1,4,4,3;...
                         1,2,3,2;];
                     
        point = findPoint(initialMatrix,4);
    end
    status = 0;
    [~,n]=size(point);
    [Row,Col] = size(initialMatrix);
    for i = 1:n
       row = point(1,i);
       col = point(2,i);
       row1 = row - 1;col1 = col - 1;
       row2 = row + 1;col2 = col - 1;
       row3 = row - 1;col3 = col + 1;
       row4 = row + 1;col4 = col + 1;
       % 判断列可能性
       
       if(0<row1 && row1<=Row && 0<col1 && col1<=Col && 0<row2 && row2<=Row && 0<col2 && col2<=Col)
           if((initialMatrix(row1,col1) == initialMatrix(row2,col2)) && (initialMatrix(row1,col1) == initialMatrix(row,col)))
               status = 1;
               break
           else
               status = 0;
           end
       elseif(0<row3 && row3<=Row && 0<col3 && col3<=Col && 0<row4 && row4<=Row && 0<col4 && col4<=Col)
           if((initialMatrix(row3,col3) == initialMatrix(row4,col4)) && (initialMatrix(row3,col3) == initialMatrix(row,col)))
               status = 1;
               break
           else
               status = 0;
           end
       % 判断行可能性    
       elseif(0<row1 && row1<=Row && 0<col1 && col1<=Col && 0<row3 && row3<=Row && 0<col3 && col3<=Col)
           if((initialMatrix(row1,col1) == initialMatrix(row3,col3)) && (initialMatrix(row1,col1) == initialMatrix(row,col)))
               status = 1;
               break
           else
               status = 0;
           end
       elseif(0<row2 && row2<=Row && 0<col2 && col2<=Col && 0<row4 && row4<=Row && 0<col4 && col4<=Col)
           if((initialMatrix(row2,col2) == initialMatrix(row4,col4)) && (initialMatrix(row2,col2) == initialMatrix(row,col)))
               status = 1;
               break
           else
               status = 0;
           end
       else
           status = 0;
       end
    end
end