clear; clc; close all;
check = 0;
while check == 0
    difficulty = input('Please enter "easy", "medium", or "hard" for the deisred difficulty: ', "s");
    check = checkInputD(difficulty);
end
[boardSize, numberBombs] = sizeBombs(difficulty);
flags = zeros(boardSize);
winCheck = zeros(boardSize);
boardGen = createboard(boardSize,numberBombs);
gameOver = 0;
condition = logical(true);
displayBoard = zeros(boardSize) - 100
while condition
    row = input('row');
    col = input('col');
    [gameOver,winCheck,displayBoard] = computeInput(row,col,boardGen,boardSize,winCheck,displayBoard);
    displayBoard
    if gameOver == 1 || sum(winCheck,'all') == boardSize^2 - numberBombs
        condition = false;
    end
end
if gameOver == 1
    disp('You lose: hit a bomb.')
else 
    disp('Congratulations, you won.')
end