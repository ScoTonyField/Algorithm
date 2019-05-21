function [Matrix]=Down(initialMatrix)
if nargin == 0
    initialMatrix = [3,2,4,3;...
                    0,0,0,5;...
                    0,4,3,4;...
                    0,3,4,3;...
                    3,3,1,1;...
                    0,4,0,3;...
                    1,4,0,3;...
                    1,2,3,2;];

end
[Row,Col] = size(initialMatrix);
for i = 1:Col
    col = initialMatrix(:,i);
    exMatrix = zeros(Row,1);
    index = length(col);
    for j = length(col):-1:1
        if(col(j)~=0)
          exMatrix(index) = col(j);
          index = index - 1;
       end
    end
    Matrix(:,i) = exMatrix;
end
end