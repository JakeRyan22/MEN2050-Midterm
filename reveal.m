function [displayBoard] = reveal(row,col,displayBoard,boardGen)
displayBoard(row,col) = boardGen(row,col);