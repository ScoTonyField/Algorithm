score = load('runningTime_484_1.mat');
score = score.runtime;

[n,~] = size(score);
for i = 1:n
    meanscore = mean(score(i,:));
    fprintf('����Ϊ��%f\n',meanscore)
end