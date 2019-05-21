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
            fprintf('��ǰ���꣺%d,%d\n',i,j);
            fprintf('�������������ƶ�\n');
            fprintf('��ǰ������%d\n',Score);
            disp(matrix)
        elseif(isExchange(matrix,point,2,totalNumber))
            [midMatrix,score] = moveMatrix(matrix,point,2);
            midMatrix = Down(midMatrix);
            Score = Score + score;
            [Matrix,score] = isLine(midMatrix);
            matrix = Down(Matrix);
            Score = Score + score;
            fprintf('��ǰ���꣺%d,%d\n',i,j);
            fprintf('��ǰ������%d\n',Score);
            fprintf('�������������ƶ�\n');
            disp(matrix)
        else
            fprintf('��ǰ���꣺%d,%d\n',i,j);
            fprintf('��ǰ����û�иı䣺%d\n',Score);
            disp(matrix)
        end
    end
end
end