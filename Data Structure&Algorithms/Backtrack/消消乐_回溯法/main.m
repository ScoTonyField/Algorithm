function [MeanMaxScore,MeanRuntime,StartMatrix,FinalMatrix] = main(K,M,N,Step)
% ======================== ʵ���� ===========================
% ʵ����ܣ�
% ���ݷ�������������⡶���������֡���һ����Ԫ���з���������������Ϸ��
% ��Ϸ�������Ķ���ΪС�����ͷ�񣬰���С��ܡ�С���ꡢС���ܺ�С���ȶ���ͷ��
% ���ͨ���ƶ�����ͷ��λ�ôչ�ͬ��/ͬ�� 3 ���� 3 �����ϼ���������
% ����˵����
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
    fprintf("ȫ����߷֣�%d\n",MaxScore);
    fprintf("��ʼ������\n");
    disp(Matrix)
    fprintf("��߷־���\n");
    disp(MaxMatrix)
    maxSocre(runtimes) = MaxScore;
    et=cputime-st;
    runtime(runtimes) = et;
end
MeanMaxScore=mean(MaxScore);
MeanRuntime=mean(runtime);
fprintf("10��ƽ����߷֣�\n");
    disp(MeanMaxScore)
fprintf("10��ƽ������ʱ�䣺\n");
    disp(MeanRuntime)
StartMatrix = Matrix;
FinalMatrix = MaxMatrix;
end
