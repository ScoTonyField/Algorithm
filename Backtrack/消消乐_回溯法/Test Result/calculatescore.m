score = load('cuttingBacktracking_494_100.mat');
score = score.maxScore;

[n,~] = size(score);
for i = 1:n
    meanscore = mean(score(i,:));
    fprintf('����Ϊ��%f\n',meanscore)
end