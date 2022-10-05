function [gameOver, winCheck] = computeInputLC(row,col,boardGen,boardSize)
winCheck = zeros(boardSize)
tile = boardGen(row,col)
if tile == 9
    gameOver = 1;
    winCheck(row,col) = 0;
else
    reveal(row,col);
    winCheck(row,col) = 1
    