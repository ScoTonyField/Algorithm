function  [MaxScore,MaxMatrix]= BackTrace(MaxScore,score,MaxMatrix,matrix,totalNumber,Step)
if MaxScore < score
    MaxScore = score;
    MaxMatrix = matrix;
end
if Step == 0
    fprintf("Step:%d\n",Step);
    fprintf("当前最高分数：%d\n",MaxScore);
    fprintf("叶子节点分数：%d\n",score);
    fprintf("最终棋盘：\n");
    fprintf("分支结束！返回上一代！\n\n");
else%isempty(findPoint(matrix,0)) | (~isempty(findPoint(matrix,0)) & length(findPoint(matrix,0))*rand()<1)
    for i = size(matrix,1):-1:1
        for j = 1:size(matrix,2)
            [Score,matrix_now] = DFS(i,j,matrix,totalNumber);
            
%剪枝
            if Score>2
                [MaxScore,MaxMatrix]=BackTrace(MaxScore,score + Score,MaxMatrix,matrix_now,totalNumber,Step - 1);
            elseif Score==1
                if ~isempty(findPoint(matrix,0)) & length(findPoint(matrix,0))*rand()<1
                    [MaxScore,MaxMatrix]=BackTrace(MaxScore,score + Score,MaxMatrix,matrix_now,totalNumber,Step - 1);
                end
            end

%未剪枝
%               if Score>0
%                  [MaxScore,MaxMatrix]=BackTrace(MaxScore,score + Score,MaxMatrix,matrix_now,totalNumber,Step - 1);
%               end
        end
    end
end
end

