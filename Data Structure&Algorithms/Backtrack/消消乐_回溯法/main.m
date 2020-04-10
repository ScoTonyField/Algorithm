function [MeanMaxScore,MeanRuntime,StartMatrix,FinalMatrix] = main(K,M,N,Step)
% ======================== 实验三 ===========================
% 实验介绍：
% 回溯法解决三消乐问题《开心消消乐》是一款乐元素研发的三消类休闲游戏。
% 游戏中消除的对象为小动物的头像，包括小浣熊、小狐狸、小青蛙和小鸡等动物头像。
% 玩家通过移动动物头像位置凑够同行/同列 3 个或 3 个以上即可消除。
% 函数说明：
% 
% ==========================================================

% Matrix = [3,3,4,3;...
%         3,2,3,3;...
%         2,4,3,4;...
%         1,3,4,3;...
%         3,3,1,1;...
%         3,4,3,2;...
%         2,4,4,3;...
%         1,2,3,2;];
% totalnumber = 4;

% K = 4;
% M = 8;
% N = 4;
% Step = 3;
% rand('seed',0);
for runtimes = 1:1
    st=cputime; 
    Matrix = createMatrix(K,M,N);
    MaxScore=0;
    point = zeros(1,2);
    score=0;   
    AllPoint = zeros(Step,3);
    disp(Matrix)
    MaxMatrix = zeros(M,N);
    % [score,Matrix] = DFS(Matrix,K);
    [MaxScore,MaxMatrix]=BackTrace(MaxScore,score,MaxMatrix,Matrix,K,Step);
    fprintf("全局最高分：%d\n",MaxScore);
    fprintf("初始化矩阵：\n");
    disp(Matrix)
    fprintf("最高分矩阵：\n");
    disp(MaxMatrix)
    maxSocre(runtimes) = MaxScore;
    et=cputime-st;
    runtime(runtimes) = et;
end
MeanMaxScore=mean(MaxScore);
MeanRuntime=mean(runtime);
fprintf("10次平均最高分：\n");
    disp(MeanMaxScore)
fprintf("10次平均运行时间：\n");
    disp(MeanRuntime)
StartMatrix = Matrix;
FinalMatrix = MaxMatrix;
end
