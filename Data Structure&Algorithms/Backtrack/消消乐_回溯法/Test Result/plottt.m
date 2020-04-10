clear;
close;
clc;

score = load('cuttingBacktracking_484_100_1~7_2.8.mat');
score = score.maxScore;
meanScore = mean(score,2);
figure(1)
plot(meanScore)
legend('parameter:2.0')

time = load('runningTime_cuttingBacktracking_484_100_1~7_2.8.mat');
time = time.runtime;
meanTime = mean(time,2);
figure(2)
plot(meanTime)
