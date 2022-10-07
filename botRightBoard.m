function [winCheck,justRevealed,displayBoard] = botRightBoard(row,col,winCheck,boardGen,justRevealed,displayBoard)
winCheck(row,col) = 1;
justRevealed;
if boardGen(row,col) == 0
    for i = row-1:row
        for j = col-1:col
            if winCheck(i,j) == 0
                displayBoard = reveal(i,j,displayBoard,boardGen);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
else
    for i = row-1:row
        for j = col-1:col
            if winCheck(i,j) == 0 && boardGen(i,j) == 0
                displayBoard = reveal(i,j,displayBoard,boardGen);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
end