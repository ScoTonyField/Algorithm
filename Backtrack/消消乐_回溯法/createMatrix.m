function [initialMatrix] = createMatrix(K,M,N)

    if nargin == 0
       K = 8;M = 16;N = 8; 
    end
    
    initialMatrix = zeros(M,N);
    for i = 1:M
        for j = 1:N
            initialMatrix(i,j) = unidrnd(K);
            col1 = j-1;col2 = j-2;
            row1 = i-1;row2 = i-2;
            if(col1>0 && col2 >0 && initialMatrix(i,j)==initialMatrix(i,col1) && initialMatrix(i,col1)==initialMatrix(i,col2))
                Knum = 1:K;
                Knum(initialMatrix(i,j)) = [];
                numArr = Knum(randperm(length(Knum)));
                num = numArr(1);
                initialMatrix(i,j) = num;
            end
            if(row1>0 && row2 >0 && initialMatrix(i,j)==initialMatrix(row1,j) && initialMatrix(row1,j)==initialMatrix(row2,j))
                Knum = 1:K;
                Knum(initialMatrix(i,j)) = [];
                numArr = Knum(randperm(length(Knum)));
                num = numArr(1);
                initialMatrix(i,j) = num;
            end
        end 
    end
end