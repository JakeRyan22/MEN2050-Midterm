function [gameOver, winCheck] = computeInput(row,col,boardGen,boardSize)
winCheck = zeros(boardSize);
tile = boardGen(row,col);
justrevealed = zeros(boardSize);
if tile == 9
    gameOver = 1;
    winCheck(row,col) = 0;
else
    reveal(row,col);
    winCheck(row,col) = 1;
    justrevealed(row,col) = 1;
end
while sum(justrevealed,'all') > 0
    [row,col] = find(justrevealed);
    justrevealed(row,col) = 0;
    if row == 1 && col == 1
        if boardGen(row,col) == 0
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justrevealed(row+1,col) = 1;
            end
            if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
            reveal(row+1,col+1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row+1,col+1) = 1;
            end
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
            reveal(row,col+1);
            winCheck(row,col+1) = 1;
            justrevealed(row,col+1) = 1;
            end
        else
            if boardGen(row+1,col) == 0
            if winCheck(row+1,col) ~= 1
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justrevealed(row+1,col) = 1;
            end
        end
        if boardGen(row+1,col+1) == 0
            if winCheck(row+1,col+1) ~= 1
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justrevealed(row+1,col+1) = 1;
            end
        end
        if boardGen(row,col+1) == 0
            if winCheck(row,col+1) ~= 1
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justrevealed(row,col+1) = 1;
            end
        end
        end
    elseif row == 1 && col == boardSize
        if boardGen(row,col) == 0
        if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
            reveal(row+1,col-1);
            winCheck(row+1,col-1) = 1;
            justrevealed(row+1,col-1) = 1;
        end
        if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
            reveal(row+1,col);
            winCheck(row+1,col) = 1;
            justrevealed(row+1,col) = 1;
        end
        if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
            reveal(row,col-1);
            winCheck(row,col-1) = 1;
            justrevealed(row,col-1) = 1;
        end
        else
            if boardGen(row+1,col-1) == 0
            if winCheck(row+1,col-1) ~= 1
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justrevealed(row+1,col-1) = 1;
            end
        end
        if boardGen(row+1,col) == 0
            if winCheck(row+1,col) ~= 1
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justrevealed(row+1,col) = 1;
            end
        end
        if boardGen(row,col-1) == 0
            if winCheck(row,col-1) ~= 1
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justrevealed(row,col-1) = 1;
            end
        end
        end
    elseif row == boardSize && col == 1
        if boardGen(row,col) == 0
            if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
            reveal(row-1,col+1);
            winCheck(row-1,col+1) = 1;
            justrevealed(row-1,col+1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
            reveal(row-1,col);
            winCheck(row-1,col) = 1;
            justrevealed(row-1,col) = 1;
            end
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
            reveal(row,col+1);
            winCheck(row,col+1) = 1;
            justrevealed(row,col+1) = 1;
            end
        else
            if boardGen(row-1,col) == 0
            if winCheck(row-1,col) ~= 1
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row-1,col+1) == 0
            if winCheck(row-1,col+1) ~= 1
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justrevealed(row-1,col+1) = 1;
            end
        end
        if boardGen(row,col+1) == 0
            if winCheck(row,col+1) ~= 1
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justrevealed(row,col+1) = 1;
            end
        end
        end
    elseif row == boardSize && col == boardSize
        if boardGen(row,col) == 0
            if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
            reveal(row-1,col-1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row-1,col-1) = 1;
            end
            if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
            reveal(row,col-1);
            winCheck(row,col-1) = 1;
            justrevealed(row,col-1) = 1;
            end
            if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
            reveal(row-1,col);
            winCheck(row-1,col) = 1;
            justrevealed(row-1,col) = 1;
            end
        else
            if boardGen(row-1,col-1) == 0
            if winCheck(row-1,col-1) ~= 1
                reveal(row-1,col-1);
                winCheck(row-1,col-1) = 1;
                justrevealed(row-1,col-1) = 1;
            end
        end
        if boardGen(row-1,col) == 0
            if winCheck(row-1,col) ~= 1
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row,col-1) == 0
            if winCheck(row,col-1) ~= 1
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        end
    elseif row == 1 && col~= 1 && col ~= boardSize
        if boardGen(row,col) == 0
            if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
            reveal(row+1,col);
            winCheck(row+1,col) = 1;
            justrevealed(row+1,col) = 1;
        end
        if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
            reveal(row+1,col+1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row+1,col+1) = 1;
        end
        if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
            reveal(row,col+1);
            winCheck(row,col+1) = 1;
            justrevealed(row,col+1) = 1;
        end
        if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
            reveal(row+1,col-1);
            winCheck(row+1,col-1) = 1;
            justrevealed(row+1,col-1) = 1;
        end
        if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
            reveal(row,col-1);
            winCheck(row,col-1) = 1;
            justrevealed(row,col-1) = 1;
        end
        else
            if boardGen(row,col-1) == 0
            if winCheck(row,col-1) ~= 1
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row,col+1) == 0
            if winCheck(row,col+1) ~= 1
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justrevealed(row,col+1) = 1;
            end
        end
        if boardGen(row+1,col-1) == 0
            if winCheck(row+1,col-1) ~= 1
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justrevealed(row+1,col-1) = 1;
            end
        end
        if boardGen(row+1,col) == 0
            if winCheck(row+1,col) ~= 1
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justrevealed(row+1,col) = 1;
            end
        end
        if boardGen(row+1,col+1) == 0
            if winCheck(row+1,col+1) ~= 1
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justrevealed(row+1,col+1) = 1;
            end
        end
        end
    elseif col == 1 && row ~= 1 && row ~= boardSize
        if boardGen(row,col) == 0
        if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
            reveal(row+1,col);
            winCheck(row+1,col) = 1;
            justrevealed(row+1,col) = 1;
        end
        if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
            reveal(row+1,col+1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row+1,col+1) = 1;
        end
        if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
            reveal(row,col+1);
            winCheck(row,col+1) = 1;
            justrevealed(row,col+1) = 1;
        end
        if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
            reveal(row-1,col+1);
            winCheck(row-1,col+1) = 1;
            justrevealed(row-1,col+1) = 1;
        end
        if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
            reveal(row-1,col);
            winCheck(row-1,col) = 1;
            justrevealed(row-1,col) = 1;
        end
        else
            if boardGen(row-1,col) == 0
            if winCheck(row-1,col) ~= 1
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row-1,col+1) == 0
            if winCheck(row-1,col+1) ~= 1
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justrevealed(row-1,col+1) = 1;
            end
        end
        if boardGen(row+1,col) == 0
            if winCheck(row+1,col) ~= 1
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justrevealed(row+1,col) = 1;
            end
        end
        if boardGen(row+1,col+1) == 0
            if winCheck(row+1,col+1) ~= 1
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justrevealed(row+1,col+1) = 1;
            end
        end
        if boardGen(row,col+1) == 0
            if winCheck(row,col+1) ~= 1
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justrevealed(row,col+1) = 1;
            end
        end
        end
    elseif row == boardSize && col ~= 1 && col ~= boardSize
        if boardGen(row,col) == 0
            if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
            reveal(row,col+1);
            winCheck(row,col+1) = 1;
            justrevealed(row,col+1) = 1;
        end
        if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
            reveal(row-1,col-1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row-1,col-1) = 1;
        end
        if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
            reveal(row-1,col+1);
            winCheck(row-1,col+1) = 1;
            justrevealed(row-1,col+1) = 1;
        end
        if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
            reveal(row,col-1);
            winCheck(row,col-1) = 1;
            justrevealed(row,col-1) = 1;
        end
        if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
            reveal(row-1,col);
            winCheck(row-1,col) = 1;
            justrevealed(row-1,col) = 1;
        end
        else
            if boardGen(row-1,col-1) == 0
            if winCheck(row-1,col-1) ~= 1
                reveal(row-1,col-1);
                winCheck(row-1,col-1) = 1;
                justrevealed(row-1,col-1) = 1;
            end
        end
        if boardGen(row-1,col) == 0
            if winCheck(row-1,col) ~= 1
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row-1,col+1) == 0
            if winCheck(row-1,col+1) ~= 1
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justrevealed(row-1,col+1) = 1;
            end
        end
        if boardGen(row,col-1) == 0
            if winCheck(row,col-1) ~= 1
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row,col+1) == 0
            if winCheck(row,col+1) ~= 1
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justrevealed(row,col+1) = 1;
            end
        end
        end
    elseif col == boardSize && row ~= boardSize && row ~= 1
        if boardGen(row,col) == 0
           if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
            reveal(row+1,col);
            winCheck(row+1,col) = 1;
            justrevealed(row+1,col) = 1; 
           end
           if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
            reveal(row-1,col-1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row-1,col-1) = 1;
        end
        if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
            reveal(row+1,col-1);
            winCheck(row+1,col-1) = 1;
            justrevealed(row+1,col-1) = 1;
        end
        if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
            reveal(row,col-1);
            winCheck(row,col-1) = 1;
            justrevealed(row,col-1) = 1;
        end
        if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
            reveal(row-1,col);
            winCheck(row-1,col) = 1;
            justrevealed(row-1,col) = 1;
        end
        else
            if boardGen(row-1,col-1) == 0
            if winCheck(row-1,col-1) ~= 1
                reveal(row-1,col-1);
                winCheck(row-1,col-1) = 1;
                justrevealed(row-1,col-1) = 1;
            end
        end
        if boardGen(row-1,col) == 0
            if winCheck(row-1,col) ~= 1
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row,col-1) == 0
            if winCheck(row,col-1) ~= 1
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row+1,col-1) == 0
            if winCheck(row+1,col-1) ~= 1
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justrevealed(row+1,col-1) = 1;
            end
        end
        if boardGen(row+1,col) == 0
            if winCheck(row+1,col) ~= 1
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justrevealed(row+1,col) = 1;
            end
        end
        end
    else    
        if boardGen(row,col) == 0
        if winCheck(row+1,col) ~= 1 && boardGen(row+1,col) ~= 9
            reveal(row+1,col);
            winCheck(row+1,col) = 1;
            justrevealed(row+1,col) = 1;
        end
        if winCheck(row+1,col+1) ~= 1 && boardGen(row+1,col+1) ~= 9
            reveal(row+1,col+1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row+1,col+1) = 1;
        end
        if winCheck(row,col+1) ~= 1 && boardGen(row,col+1) ~= 9
            reveal(row,col+1);
            winCheck(row,col+1) = 1;
            justrevealed(row,col+1) = 1;
        end
        if winCheck(row-1,col-1) ~= 1 && boardGen(row-1,col-1) ~= 9
            reveal(row-1,col-1);
            winCheck(row+1,col+1) = 1;
            justrevealed(row-1,col-1) = 1;
        end
        if winCheck(row+1,col-1) ~= 1 && boardGen(row+1,col-1) ~= 9
            reveal(row+1,col-1);
            winCheck(row+1,col-1) = 1;
            justrevealed(row+1,col-1) = 1;
        end
        if winCheck(row-1,col+1) ~= 1 && boardGen(row-1,col+1) ~= 9
            reveal(row-1,col+1);
            winCheck(row-1,col+1) = 1;
            justrevealed(row-1,col+1) = 1;
        end
        if winCheck(row,col-1) ~= 1 && boardGen(row,col-1) ~= 9
            reveal(row,col-1);
            winCheck(row,col-1) = 1;
            justrevealed(row,col-1) = 1;
        end
        if winCheck(row-1,col) ~= 1 && boardGen(row-1,col) ~= 9
            reveal(row-1,col);
            winCheck(row-1,col) = 1;
            justrevealed(row-1,col) = 1;
        end
    else
        if boardGen(row-1,col-1) == 0
            if winCheck(row-1,col-1) ~= 1
                reveal(row-1,col-1);
                winCheck(row-1,col-1) = 1;
                justrevealed(row-1,col-1) = 1;
            end
        end
        if boardGen(row-1,col) == 0
            if winCheck(row-1,col) ~= 1
                reveal(row-1,col);
                winCheck(row-1,col) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row-1,col+1) == 0
            if winCheck(row-1,col+1) ~= 1
                reveal(row-1,col+1);
                winCheck(row-1,col+1) = 1;
                justrevealed(row-1,col+1) = 1;
            end
        end
        if boardGen(row,col-1) == 0
            if winCheck(row,col-1) ~= 1
                reveal(row,col-1);
                winCheck(row,col-1) = 1;
                justrevealed(row-1,col) = 1;
            end
        end
        if boardGen(row,col+1) == 0
            if winCheck(row,col+1) ~= 1
                reveal(row,col+1);
                winCheck(row,col+1) = 1;
                justrevealed(row,col+1) = 1;
            end
        end
        if boardGen(row+1,col-1) == 0
            if winCheck(row+1,col-1) ~= 1
                reveal(row+1,col-1);
                winCheck(row+1,col-1) = 1;
                justrevealed(row+1,col-1) = 1;
            end
        end
        if boardGen(row+1,col) == 0
            if winCheck(row+1,col) ~= 1
                reveal(row+1,col);
                winCheck(row+1,col) = 1;
                justrevealed(row+1,col) = 1;
            end
        end
        if boardGen(row+1,col+1) == 0
            if winCheck(row+1,col+1) ~= 1
                reveal(row+1,col+1);
                winCheck(row+1,col+1) = 1;
                justrevealed(row+1,col+1) = 1;
            end
        end
        end
    end
end