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
% �жϾ����Ƿ���Լ���ִ��
% if(goodMatrix(Matrix,totalnumber)~=1)
%     fprintf("���ݷ������ֲ���ִ�У����������ɳ�ʼ����\n");
% else
%     for i = Row:-1:1
%         for j = 1:Col
%             for direction = 1:2
%                 [midMatrix,score] = moveMatrix(Matrix,point,direction);
%                 [Matrix] = Down(midMatrix);
%                 if(goodMatrix(Matrix,totalnumber)==1)
%                     totalScore = totalScore +score;
%                 else
%                     fprintf('�������%d\n',totalScore);
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
