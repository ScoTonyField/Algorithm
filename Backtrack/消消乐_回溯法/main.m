% ======================== ʵ���� ===========================
% ʵ����ܣ�
% ���ݷ�������������⡶���������֡���һ����Ԫ���з���������������Ϸ��
% ��Ϸ�������Ķ���ΪС�����ͷ�񣬰���С��ܡ�С���ꡢС���ܺ�С���ȶ���ͷ��
% ���ͨ���ƶ�����ͷ��λ�ôչ�ͬ��/ͬ�� 3 ���� 3 �����ϼ���������
% ����˵����
% 
% ==========================================================
clear;
close;
clc;

% Matrix = [3,3,4,3;...
%         3,2,3,3;...
%         2,4,3,4;...
%         1,3,4,3;...
%         3,3,1,1;...
%         3,4,3,2;...
%         2,4,4,3;...
%         1,2,3,2;];
% totalnumber = 4;
K = 4;
M = 4;
N = 8;
for i = 1:20
Matrix = createMatrix(K,M,N);
MaxScore(i)=0;
point = zeros(1,2);
score=0;
Step = 1;
AllPoint = zeros(Step,1);
disp(Matrix)
MaxMatrix = zeros(M,N);
% [score,Matrix] = DFS(Matrix,K);
[MaxScore(i),MaxMatrix]=BackTrace(MaxScore(i),score,MaxMatrix,Matrix,K,Step);
fprintf("ȫ����߷֣�%d\n",MaxScore(i));
fprintf("��ʼ������\n");
disp(Matrix)
fprintf("��߷־���\n");
disp(MaxMatrix)
end
