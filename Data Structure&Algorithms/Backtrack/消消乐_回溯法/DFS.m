function [Score,matrix] = DFS(row,col,matrix,totalNumber)
% [Row,Col] = size(matrix);
Score = 0;
i=row;
j=col;
% for i = Row:-1:1
%     for j = 1:Col
%         if(matrix(i,j)==0)
%             continue;
%         end
        point(1) = i;point(2) = j;
        if(isExchange(matrix,point,1,totalNumber))
            [matrix,score] = moveMatrix(matrix,point,1);
            matrix = Down(matrix);
            Score = Score + score;
            [matrix,score,Line] = isLine(matrix);
            while(Line==1)  
                matrix = Down(matrix);
                Score = Score + score;
                [matrix,score,Line] = isLine(matrix);
            end
%             fprintf('当前坐标：%d,%d\n',i,j);
%             fprintf('调整方向：向右移动\n');
%             fprintf('本步分数：%d\n',Score);
%             disp(matrix)
        elseif(isExchange(matrix,point,2,totalNumber))
            [matrix,score] = moveMatrix(matrix,point,2);
            matrix = Down(matrix);
            Score = Score + score;
            [matrix,score,Line] = isLine(matrix);
            while(Line==1) 
                matrix = Down(matrix);
                Score = Score + score;
                [matrix,score,Line] = isLine(matrix);
            end
%             fprintf('当前坐标：%d,%d\n',i,j);
%             fprintf('调整方向：向上移动\n');
%             fprintf('本步分数：%d\n',Score);
%             disp(matrix)
%         else
%             fprintf('当前坐标：%d,%d\n',i,j);
%             fprintf('当前分数没有改变：%d\n',Score);
%             disp(matrix)
        end
%     end
% end
end