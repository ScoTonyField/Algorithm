function [Matrix, score] = moveMatrix(initialMatrix,xpoint,direction)

% ============= 代码说明 ==================
% 输入：
% initialMatrix为输入的矩阵
% xpoint为交换前的点，ypoint为交换后的点
% 输出：
% score为一次操作后的得分
% Matrix为操作后的矩阵
% 调用函数：
% Swap为交换函数
% getScore为计算得分函数
% ========================================

[Matrix,xNewpoint,yNewpoint] = Swap(initialMatrix,xpoint,direction);
[Row,Col] = size(Matrix);
count = 1;
% 判断xpoint行最大消去得分
rowx = xNewpoint(1);colx = xNewpoint(2);
loadPoint(1,1) = rowx; loadPoint(2,1) = colx;
xnum = Matrix(rowx,colx);
score = 0;
for i = (colx-2):(colx-1)
    if(0<i && i<Col && Matrix(rowx,i) == xnum)
        count = count + 1;
        loadPoint(1,count) = rowx;
        loadPoint(2,count) = i;
    end
end
for i = (colx+1):(colx+2)
    if(0<i && i<=Col && Matrix(rowx,i) == xnum)
        count = count + 1;
        loadPoint(1,count) = rowx;
        loadPoint(2,count) = i;
    end
end
if(colx>1 && colx+1<=Col && Matrix(rowx,(colx-1))==Matrix(rowx,(colx+1)))
else
    loadPoint = [];
end
if(length(loadPoint)>2)
    [~,m] = size(loadPoint);
    for ii = 1:m
        Matrix(loadPoint(1,ii),loadPoint(2,ii)) = 0;
    end
    loadPoint = [];
end
score = score + getScore(count);
% 判断xpoint列最大消去得分
count = 1;
loadPoint(1,1) = rowx; loadPoint(2,1) = colx;
for j = (rowx-2):(rowx-1)
    if(0<j && j<=Row && Matrix(j,colx) == xnum)
        count = count + 1;
        loadPoint(1,count) = j;
        loadPoint(2,count) = colx;
    end
end
for j = (rowx+1):(rowx+2)
    if(0<j && j<=Row && Matrix(j,colx) == xnum)
        count = count + 1;
        loadPoint(1,count) = j;
        loadPoint(2,count) = colx;
    end
end
if(rowx>1 && rowx+1<=Row && Matrix(rowx-1,colx)==Matrix(rowx+1,colx))
else
    loadPoint = [];
end
if(length(loadPoint)>2)
    [~,m] = size(loadPoint);
    for ii = 1:m
        Matrix(loadPoint(1,ii),loadPoint(2,ii)) = 0;
    end
    loadPoint = [];
end

score = score + getScore(count);

% 判断ypoint行最大消去得分

count = 1;
rowy = yNewpoint(1);coly = yNewpoint(2);
loadPoint(1,1) = rowy;loadPoint(2,1) = coly;
ynum = Matrix(rowy,coly);
for i = (coly-2):(coly-1)
    if(0<i && i<=Col && Matrix(rowy,i) == ynum)
        count = count + 1;
        loadPoint(1,count) = rowy;
        loadPoint(2,count) = i;
    end
end
for i = (coly+1):(coly+2)
    if(0<i && i<=Col && Matrix(rowy,i) == ynum)
        count = count + 1;
        loadPoint(1,count) = rowy;
        loadPoint(2,count) = i;
    end
end
if(coly>1 && coly+1<=Col && Matrix(rowy,(coly-1))==Matrix(rowy,(coly+1)))
else
    loadPoint = [];
end
if(length(loadPoint)>2)
    [~,m] = size(loadPoint);
    for ii = 1:m
        Matrix(loadPoint(1,ii),loadPoint(2,ii)) = 0;
    end
    loadPoint = [];
end
score = score + getScore(count);

% 判断ypoint列最大消去得分
count = 1;
loadPoint(1,1) = rowy;loadPoint(2,1) = coly;
for j = (rowy-2):(rowy-1)
    if(0<j && j<=Row && Matrix(j,coly) == ynum)
        count = count + 1;
        loadPoint(1,count) = j;
        loadPoint(2,count) = coly;
    end
end
for j = (rowy+1):(rowy+2)
    if(0<j && j<=Row && Matrix(j,coly) == ynum)
        count = count + 1;
        loadPoint(1,count) = j;
        loadPoint(2,count) = coly;
    end
end
if(rowy>1 && rowy+1<=Row && Matrix(rowy-1,coly)==Matrix(rowy+1,coly))
else
    loadPoint = [];
end
if(length(loadPoint)>2)
    [~,m] = size(loadPoint);
    for ii = 1:m
        Matrix(loadPoint(1,ii),loadPoint(2,ii)) = 0;
    end
    loadPoint = [];
end
score = score + getScore(count);
end

