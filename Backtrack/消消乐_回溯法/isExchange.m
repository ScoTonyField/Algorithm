function status = isExchange(initialMatrix,xpoint,direction,totalNumber)
zeroNumber_old = length(find(initialMatrix == 0));
[Matrix,~] = moveMatrix(initialMatrix,xpoint,direction);
zeroNumber_new = length(find(Matrix == 0));
if(goodMatrix(Matrix,totalNumber)~=0 && zeroNumber_new >zeroNumber_old)
    status = 1;
else
    status = 0;
end
end