function score = getScore(count)
    if count == 3
        score = 1;
    elseif count == 4
        score = 4;
    elseif count == 5
        score = 10;
    else
        score = 0;
    end
end