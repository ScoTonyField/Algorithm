function [Matrix,xNewpoint,yNewpoint] = Swap(initialMatrix,xpoint,direction)
    [~,Col] = size(initialMatrix);
    row = xpoint(1);col = xpoint(2);
    if(direction == 1 && col+1<=Col)
        temp = initialMatrix(row,col);
        initialMatrix(row,col) = initialMatrix(row,col+1);
        initialMatrix(row,col+1) = temp;
        Matrix = initialMatrix;
        xNewpoint(1) = row;xNewpoint(2) = col+1;
        yNewpoint(1) = row;yNewpoint(2) = col;
    elseif(direction == 2 && row-1>0)
        temp = initialMatrix(row,col);
        initialMatrix(row,col) = initialMatrix(row-1,col);
        initialMatrix(row-1,col) = temp;
        Matrix = initialMatrix;
        xNewpoint(1) = row-1;xNewpoint(2) = col;
        yNewpoint(1) = row;yNewpoint(2) = col;
    else
        Matrix = initialMatrix;
        xNewpoint(1) = row;xNewpoint(2) = col;
        yNewpoint(1) = row;yNewpoint(2) = col;
    end
end