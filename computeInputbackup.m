function [gameOver,winCheck] = computeInput(row,col,boardGen,boardSize,winCheck)
tile = boardGen(row,col);
justRevealed = zeros(boardSize);
if tile == 9
    gameOver = 1;
    winCheck(row,col) = 0;
else
    gameOver = 0;
    reveal(row,col);
    winCheck(row,col) = 1;
    justRevealed(row,col) = 1;
end
while sum(justRevealed) > 0
    [row,col] = find(justRevealed);
    justRevealed(row,col) = 0;
    if isequal([row,col],[1,1])
        if boardGen(row,col) == 0
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justRevealed(row+1,col) = 1;
            end
            if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row+1,col+1) = 1;
            end
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justRevealed(row,col+1) = 1;
            end
        else
            if boardGen(row+1,col) == 0
                if winCheck(row+1,col) ~= 1
                    reveal(row+1,col);
                    winCheck(row+1,col) = 1;
                    justRevealed(row+1,col) = 1;
                end
            end
            if boardGen(row+1,col+1) == 0
                if winCheck(row+1,col+1) ~= 1
                    reveal(row+1,col+1);
                    winCheck(row+1,col+1) = 1;
                    justRevealed(row+1,col+1) = 1;
                end
            end
            if boardGen(row,col+1) == 0
                if winCheck(row,col+1) ~= 1
                    reveal(row,col+1);
                    winCheck(row,col+1) = 1;
                    justRevealed(row,col+1) = 1;
                end
            end
        end
    elseif isequal([row,col],[1,boardSize])
        if boardGen(row,col) == 0
            if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justRevealed(row+1,col-1) = 1;
            end
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justRevealed(row+1,col) = 1;
            end
            if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justRevealed(row,col-1) = 1;
            end
        else
            if boardGen(row+1,col-1) == 0
                if winCheck(row+1,col-1) ~= 1
                    reveal(row+1,col-1);
                    winCheck(row+1,col-1) = 1;
                    justRevealed(row+1,col-1) = 1;
                end
            end
            if boardGen(row+1,col) == 0
                if winCheck(row+1,col) ~= 1
                    reveal(row+1,col);
                    winCheck(row+1,col) = 1;
                    justRevealed(row+1,col) = 1;
                end
            end
            if boardGen(row,col-1) == 0
                if winCheck(row,col-1) ~= 1
                    reveal(row,col-1);
                    winCheck(row,col-1) = 1;
                    justRevealed(row,col-1) = 1;
                end
            end
        end
    elseif isequal([row,col],[boardSize, 1])
        if boardGen(row,col) == 0
            if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justRevealed(row-1,col+1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justRevealed(row-1,col) = 1;
            end
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justRevealed(row,col+1) = 1;
            end
        else
            if boardGen(row-1,col) == 0
                if winCheck(row-1,col) ~= 1
                    reveal(row-1,col);
                    winCheck(row-1,col) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row-1,col+1) == 0
                if winCheck(row-1,col+1) ~= 1
                    reveal(row-1,col+1);
                    winCheck(row-1,col+1) = 1;
                    justRevealed(row-1,col+1) = 1;
                end
            end
            if boardGen(row,col+1) == 0
                if winCheck(row,col+1) ~= 1
                    reveal(row,col+1);
                    winCheck(row,col+1) = 1;
                    justRevealed(row,col+1) = 1;
                end
            end
        end
    elseif isequal([row,col],[boardSize,boardSize])
        if boardGen(row,col) == 0
            if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
                reveal(row-1,col-1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row-1,col-1) = 1;
            end
            if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justRevealed(row,col-1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justRevealed(row-1,col) = 1;
            end
        else
            if boardGen(row-1,col-1) == 0
                if winCheck(row-1,col-1) ~= 1
                    reveal(row-1,col-1);
                    winCheck(row-1,col-1) = 1;
                    justRevealed(row-1,col-1) = 1;
                end
            end
            if boardGen(row-1,col) == 0
                if winCheck(row-1,col) ~= 1
                    reveal(row-1,col);
                    winCheck(row-1,col) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row,col-1) == 0
                if winCheck(row,col-1) ~= 1
                    reveal(row,col-1);
                    winCheck(row,col-1) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
        end
    elseif row == 1
        if boardGen(row,col) == 0
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justRevealed(row+1,col) = 1;
            end
            if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row+1,col+1) = 1;
            end
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justRevealed(row,col+1) = 1;
            end
            if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justRevealed(row+1,col-1) = 1;
            end
            if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justRevealed(row,col-1) = 1;
            end
        else
            if boardGen(row,col-1) == 0
                if winCheck(row,col-1) ~= 1
                    reveal(row,col-1);
                    winCheck(row,col-1) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row,col+1) == 0
                if winCheck(row,col+1) ~= 1
                    reveal(row,col+1);
                    winCheck(row,col+1) = 1;
                    justRevealed(row,col+1) = 1;
                end
            end
            if boardGen(row+1,col-1) == 0
                if winCheck(row+1,col-1) ~= 1
                    reveal(row+1,col-1);
                    winCheck(row+1,col-1) = 1;
                    justRevealed(row+1,col-1) = 1;
                end
            end
            if boardGen(row+1,col) == 0
                if winCheck(row+1,col) ~= 1
                    reveal(row+1,col);
                    winCheck(row+1,col) = 1;
                    justRevealed(row+1,col) = 1;
                end
            end
            if boardGen(row+1,col+1) == 0
                if winCheck(row+1,col+1) ~= 1
                    reveal(row+1,col+1);
                    winCheck(row+1,col+1) = 1;
                    justRevealed(row+1,col+1) = 1;
                end
            end
        end
    elseif col == 1
        if boardGen(row,col) == 0
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justRevealed(row+1,col) = 1;
            end
            if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row+1,col+1) = 1;
            end
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justRevealed(row,col+1) = 1;
            end
            if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justRevealed(row-1,col+1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justRevealed(row-1,col) = 1;
            end
        else
            if boardGen(row-1,col) == 0
                if winCheck(row-1,col) ~= 1
                    reveal(row-1,col);
                    winCheck(row-1,col) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row-1,col+1) == 0
                if winCheck(row-1,col+1) ~= 1
                    reveal(row-1,col+1);
                    winCheck(row-1,col+1) = 1;
                    justRevealed(row-1,col+1) = 1;
                end
            end
            if boardGen(row+1,col) == 0
                if winCheck(row+1,col) ~= 1
                    reveal(row+1,col);
                    winCheck(row+1,col) = 1;
                    justRevealed(row+1,col) = 1;
                end
            end
            if boardGen(row+1,col+1) == 0
                if winCheck(row+1,col+1) ~= 1
                    reveal(row+1,col+1);
                    winCheck(row+1,col+1) = 1;
                    justRevealed(row+1,col+1) = 1;
                end
            end
            if boardGen(row,col+1) == 0
                if winCheck(row,col+1) ~= 1
                    reveal(row,col+1);
                    winCheck(row,col+1) = 1;
                    justRevealed(row,col+1) = 1;
                end
            end
        end
    elseif row == boardSize
        if boardGen(row,col) == 0
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justRevealed(row,col+1) = 1;
            end
            if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
                reveal(row-1,col-1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row-1,col-1) = 1;
            end
            if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justRevealed(row-1,col+1) = 1;
            end
            if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justRevealed(row,col-1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justRevealed(row-1,col) = 1;
            end
        else
            if boardGen(row-1,col-1) == 0
                if winCheck(row-1,col-1) ~= 1
                    reveal(row-1,col-1);
                    winCheck(row-1,col-1) = 1;
                    justRevealed(row-1,col-1) = 1;
                end
            end
            if boardGen(row-1,col) == 0
                if winCheck(row-1,col) ~= 1
                    reveal(row-1,col);
                    winCheck(row-1,col) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row-1,col+1) == 0
                if winCheck(row-1,col+1) ~= 1
                    reveal(row-1,col+1);
                    winCheck(row-1,col+1) = 1;
                    justRevealed(row-1,col+1) = 1;
                end
            end
            if boardGen(row,col-1) == 0
                if winCheck(row,col-1) ~= 1
                    reveal(row,col-1);
                    winCheck(row,col-1) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row,col+1) == 0
                if winCheck(row,col+1) ~= 1
                    reveal(row,col+1);
                    winCheck(row,col+1) = 1;
                    justRevealed(row,col+1) = 1;
                end
            end
        end
    elseif col == boardSize
        if boardGen(row,col) == 0
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justRevealed(row+1,col) = 1;
            end
            if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
                reveal(row-1,col-1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row-1,col-1) = 1;
            end
            if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justRevealed(row+1,col-1) = 1;
            end
            if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justRevealed(row,col-1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justRevealed(row-1,col) = 1;
            end
        else
            if boardGen(row-1,col-1) == 0
                if winCheck(row-1,col-1) ~= 1
                    reveal(row-1,col-1);
                    winCheck(row-1,col-1) = 1;
                    justRevealed(row-1,col-1) = 1;
                end
            end
            if boardGen(row-1,col) == 0
                if winCheck(row-1,col) ~= 1
                    reveal(row-1,col);
                    winCheck(row-1,col) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row,col-1) == 0
                if winCheck(row,col-1) ~= 1
                    reveal(row,col-1);
                    winCheck(row,col-1) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row+1,col-1) == 0
                if winCheck(row+1,col-1) ~= 1
                    reveal(row+1,col-1);
                    winCheck(row+1,col-1) = 1;
                    justRevealed(row+1,col-1) = 1;
                end
            end
            if boardGen(row+1,col) == 0
                if winCheck(row+1,col) ~= 1
                    reveal(row+1,col);
                    winCheck(row+1,col) = 1;
                    justRevealed(row+1,col) = 1;
                end
            end
        end
    else
        if boardGen(row,col) == 0
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justRevealed(row+1,col) = 1;
            end
            if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row+1,col+1) = 1;
            end
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justRevealed(row,col+1) = 1;
            end
            if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
                reveal(row-1,col-1);
                winCheck(row+1,col+1) = 1;
                justRevealed(row-1,col-1) = 1;
            end
            if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justRevealed(row+1,col-1) = 1;
            end
            if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justRevealed(row-1,col+1) = 1;
            end
            if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justRevealed(row,col-1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justRevealed(row-1,col) = 1;
            end
        else
            if boardGen(row-1,col-1) == 0
                if winCheck(row-1,col-1) ~= 1
                    reveal(row-1,col-1);
                    winCheck(row-1,col-1) = 1;
                    justRevealed(row-1,col-1) = 1;
                end
            end
            if boardGen(row-1,col) == 0
                if winCheck(row-1,col) ~= 1
                    reveal(row-1,col);
                    winCheck(row-1,col) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row-1,col+1) == 0
                if winCheck(row-1,col+1) ~= 1
                    reveal(row-1,col+1);
                    winCheck(row-1,col+1) = 1;
                    justRevealed(row-1,col+1) = 1;
                end
            end
            if boardGen(row,col-1) == 0
                if winCheck(row,col-1) ~= 1
                    reveal(row,col-1);
                    winCheck(row,col-1) = 1;
                    justRevealed(row-1,col) = 1;
                end
            end
            if boardGen(row,col+1) == 0
                if winCheck(row,col+1) ~= 1
                    reveal(row,col+1);
                    winCheck(row,col+1) = 1;
                    justRevealed(row,col+1) = 1;
                end
            end
            if boardGen(row+1,col-1) == 0
                if winCheck(row+1,col-1) ~= 1
                    reveal(row+1,col-1);
                    winCheck(row+1,col-1) = 1;
                    justRevealed(row+1,col-1) = 1;
                end
            end
            if boardGen(row+1,col) == 0
                if winCheck(row+1,col) ~= 1
                    reveal(row+1,col);
                    winCheck(row+1,col) = 1;
                    justRevealed(row+1,col) = 1;
                end
            end
            if boardGen(row+1,col+1) == 0
                if winCheck(row+1,col+1) ~= 1
                    reveal(row+1,col+1);
                    winCheck(row+1,col+1) = 1;
                    justRevealed(row+1,col+1) = 1;
                end
            end
        end
    end
end