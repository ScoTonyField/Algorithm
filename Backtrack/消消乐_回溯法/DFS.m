function [Score,matrix] = DFS(matrix,totalNumber)
[Row,Col] = size(matrix);
Score = 0;
for i = Row:-1:1
    for j = 1:Col
        point(1) = i;point(2) = j;
        if(isExchange(matrix,point,1,totalNumber))
            [midMatrix,score] = moveMatrix(matrix,point,1);
            midMatrix = Down(midMatrix);
            Score = Score + score;
            [Matrix,score] = isLine(midMatrix);
            matrix = Down(Matrix);
            Score = Score + score;
            fprintf('当前坐标：%d,%d\n',i,j);
            fprintf('调整方向：向右移动\n');
            fprintf('当前分数：%d\n',Score);
            disp(matrix)
        elseif(isExchange(matrix,point,2,totalNumber))
            [midMatrix,score] = moveMatrix(matrix,point,2);
            midMatrix = Down(midMatrix);
            Score = Score + score;
            [Matrix,score] = isLine(midMatrix);
            matrix = Down(Matrix);
            Score = Score + score;
            fprintf('当前坐标：%d,%d\n',i,j);
            fprintf('当前分数：%d\n',Score);
            fprintf('调整方向：向上移动\n');
            disp(matrix)
        else
            fprintf('当前坐标：%d,%d\n',i,j);
            fprintf('当前分数没有改变：%d\n',Score);
            disp(matrix)
        end
    end
end
end