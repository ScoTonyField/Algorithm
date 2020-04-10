K = 4;
M = 8;
N = 4;

for n = 1:10
    matrix = createMatrix(K,M,N);
    while(~goodMatrix(Matrix))
        matrix = createMatrix(K,M,N);
    end
end