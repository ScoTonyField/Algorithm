% ======================== 实验三 ===========================
% 实验介绍：
% 回溯法解决三消乐问题《开心消消乐》是一款乐元素研发的三消类休闲游戏。
% 游戏中消除的对象为小动物的头像，包括小浣熊、小狐狸、小青蛙和小鸡等动物头像。
% 玩家通过移动动物头像位置凑够同行/同列 3 个或 3 个以上即可消除。
% 函数说明：
% 
% ==========================================================
clear;
close;
clc;
Matrix = [3,3,4,3;...
                3,2,3,3;...
                2,4,3,4;...
                1,3,4,3;...
                3,3,1,1;...
                3,4,3,3;...
                1,4,4,3;...
                1,2,3,2;];
totalnumber = 4;
[Row,Col] = size(Matrix);
% 判断矩阵是否可以继续执行
% if(goodMatrix(Matrix,totalnumber)~=1)
%     fprintf("回溯法消消乐不能执行，请重新生成初始矩阵\n");
% else
%     for i = Row:-1:1
%         for j = 1:Col
%             for direction = 1:2
%                 [midMatrix,score] = moveMatrix(Matrix,point,direction);
%                 [Matrix] = Down(midMatrix);
%                 if(goodMatrix(Matrix,totalnumber)==1)
%                     totalScore = totalScore +score;
%                 else
%                     fprintf('计算完成%d\n',totalScore);
%                 end
%             end
%         end
%     end
% end
point(1) = 2;point(2) = 2;
direction = 1;
Score = 0;
[midMatrix,score] = moveMatrix(Matrix,point,direction);
[Matrix] = Down(midMatrix);
