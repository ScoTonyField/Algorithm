function [Matrix,xNewpoint,yNewpoint] = Swap(initialMatrix,xpoint,direction)
if nargin == 0
    initialMatrix = [3,3,4,3;...
        3,2,3,3;...
        2,4,3,4;...
        1,3,4,3;...
        3,3,1,1;...
        3,4,3,3;...
        1,4,4,3;...
        1,2,3,2;];
    xpoint(1) = 6;
    xpoint(2) = 1;
    direction = 1;
end
[~,Col] = size(initialMatrix);
row = xpoint(1);col = xpoint(2);
if(initialMatrix(row,col)~=0)
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
else
    Matrix = initialMatrix;
    xNewpoint = xpoint;
    yNewpoint = xpoint;
end
% xNewpoint
% yNewpoint
end