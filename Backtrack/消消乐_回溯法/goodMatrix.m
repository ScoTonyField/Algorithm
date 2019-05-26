function [status] = goodMatrix(initialMatrix,totalnumber)
if nargin == 0
   initialMatrix = [0     0     0     0;
                 0     0     0     3;
                 3     0     0     3;
                 3     0     0     4;
                 2     0     0     3;
                 1     0     0     1;
                 1     2     3     3;
                 1     2     1     2;];
            totalnumber = 4;
end
for num = 1:totalnumber
    point = findPoint(initialMatrix,num);
    [status1] = pointKindx(point,initialMatrix);
    [status2] = pointKindy(point,initialMatrix);
    [status3] = pointKindone(point,initialMatrix);
    if((status1+status2+status3)>0)
        status = 1;
        break
    else
        status = 0;
    end
end
end