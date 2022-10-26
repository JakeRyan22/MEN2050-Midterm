function [displayBoard,mineSweeperGraphics,MineSweeperBoard] = reveal(row,col,displayBoard,boardGen,boardSize,mineSweeperGraphics,MineSweeperBoard)
displayBoard(row,col) = boardGen(row,col);
MineSweeperBoard{row,col} = mineSweeperGraphics{displayBoard(row,col) + 1};