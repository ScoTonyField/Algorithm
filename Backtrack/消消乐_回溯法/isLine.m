function [Matrix,score] = isLine(Matrix)
if nargin == 0
    Matrix = [3     3     0     3;
            3     2     0     3;
            2     4     0     4;
            1     3     4     3;
            3     3     3     1;
            3     4     3     3;
            1     4     4     4;
            1     2     1     2;];
end
[Row,Col] = size(Matrix);

score = 0;
for rowx = 1:Row
    for colx = 1:Col
        % 判断xpoint行最大消去得分
        loadPoint(1,1) = rowx; loadPoint(2,1) = colx;
        xnum = Matrix(rowx,colx);
        if(xnum ~= 0)
            count = 1;
            for i = (colx-2):(colx-1)
                if(0<i && i<Col && Matrix(rowx,i) == xnum)
                    count = count + 1;
                    loadPoint(1,count) = rowx;
                    loadPoint(2,count) = i;
                end
            end
            for i = (colx+1):(colx+2)
                if(0<i && i<=Col && Matrix(rowx,i) == xnum)
                    count = count + 1;
                    loadPoint(1,count) = rowx;
                    loadPoint(2,count) = i;
                end
            end
            if(colx>1 && colx+1<=Col && Matrix(rowx,(colx-1))==Matrix(rowx,(colx+1)))
            else
                loadPoint = [];
            end
            if(length(loadPoint)>2)
                [~,m] = size(loadPoint);
                for ii = 1:m
                    if(loadPoint(1,ii)~=0 && loadPoint(2,ii)~=0)
                        Matrix(loadPoint(1,ii),loadPoint(2,ii)) = 0;
                    end
                end
                loadPoint = [];
            end
            score = score + getScore(count);
            % 判断xpoint列最大消去得分
            count = 1;
            loadPoint(1,1) = rowx; loadPoint(2,1) = colx;
            for j = (rowx-2):(rowx-1)
                if(0<j && j<=Row && Matrix(j,colx) == xnum)
                    count = count + 1;
                    loadPoint(1,count) = j;
                    loadPoint(2,count) = colx;
                end
            end
            for j = (rowx+1):(rowx+2)
                if(0<j && j<=Row && Matrix(j,colx) == xnum)
                    count = count + 1;
                    loadPoint(1,count) = j;
                    loadPoint(2,count) = colx;
                end
            end
            if(rowx>1 && rowx+1<=Row && Matrix(rowx-1,colx)==Matrix(rowx+1,colx))
            else
                loadPoint = [];
            end
            if(length(loadPoint)>2)
                [~,m] = size(loadPoint);
                for ii = 1:m
                    if(loadPoint(1,ii)~=0 && loadPoint(2,ii)~=0)
                        Matrix(loadPoint(1,ii),loadPoint(2,ii)) = 0;
                    end
                end
                loadPoint = [];
            end
            score = score + getScore(count);
        end
    end
end
disp(score)
end