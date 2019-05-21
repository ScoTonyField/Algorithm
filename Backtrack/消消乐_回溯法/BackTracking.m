function [Score, Matrix] = BackTracking(Matrix)
if nargin == 0
    K = 4;
    M = 8;
    N = 4;
    Matrix =    [3,3,4,3;...
        3,2,3,3;...
        2,4,3,4;...
        1,3,4,3;...
        3,3,1,1;...
        3,4,3,3;...
        1,4,4,3;...
        1,2,3,2;];
%     maxStep = 100;
end
M = 8;
N = 4;
K = 4;
fprintf('初始矩阵\n');
disp(Matrix)
Score = 0;
count = 1;
for i = M:-1:1
    for j = 1:N
        point(1) = i;
        point(2) = j;
        fprintf('当前坐标:%d,%d\n',i,j);
        if(goodMatrix(Matrix,K)~=0)
            [midMatrix,score] = moveMatrix(Matrix,point,1);
            if(isempty(find(midMatrix == 0)) && goodMatrix(Matrix,K)==0)
                [midMatrix,score] = moveMatrix(Matrix,point,2);
                if(find(midMatrix == 0)~=0 && goodMatrix(Matrix,K)~=0)
                    midMatrix = Down(midMatrix);
                    Score = Score + score;
                    [Matrix,score] = isLine(midMatrix);
                    Matrix = Down(Matrix);
                    Score = Score + score;
                end
            else
                midMatrix = Down(midMatrix);
                Score = Score + score;
                [Matrix,score] = isLine(midMatrix);
                Matrix = Down(Matrix);
                Score = Score + score;
            end
        else
            Score = Score + score;
            fprintf('分数为：%d',Score);
            fprintf('第%d次结束\n',count);
            count = count + 1;
            [Score, Matrix] = BackTracking(Matrix);
        end
        disp(Matrix)
    end
end
end