clear;
close;
clc

Matrix = [3,3,4,3;...
        3,2,3,3;...
        2,4,3,4;...
        1,3,4,3;...
        3,3,1,1;...
        3,4,3,2;...
        2,4,4,3;...
        1,2,3,2;];
% totalnumber = 4;

K = 4;
M = 8;
N = 4;
% Step = 1;
for Step = 4:4
for runtimes = 1:1
    st=cputime;
%     Matrix = createMatrix(K,M,N);
    while(~goodMatrix(Matrix,K))
        Matrix = createMatrix(K,M,N);
    end
    MaxScore=0;
    point = zeros(1,2);
    score=0;
    AllPoint = zeros(Step,1);
    disp(Matrix)
    MaxMatrix = zeros(M,N);
    % [score,Matrix] = DFS(Matrix,K);
    [MaxScore,MaxMatrix]=BackTrace(MaxScore,score,MaxMatrix,Matrix,K,Step);
    fprintf("全局最高分：%d\n",MaxScore);
    fprintf("初始化矩阵：\n");
    disp(Matrix)
    fprintf("最高分矩阵：\n");
    disp(MaxMatrix)
    fprintf('===============================\n');
    maxScore(Step,runtimes) = MaxScore;
    et=cputime-st;
    runtime(Step,runtimes) = et;
end
end

% MeanMaxScore=mean(maxScore);
% MeanRuntime=mean(runtime);
% fprintf("平均最高分：\n");
% disp(MeanMaxScore)
% fprintf("平均运行时间：\n");
% disp(MeanRuntime)
% StartMatrix = Matrix;
% FinalMatrix = MaxMatrix;