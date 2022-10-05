clear; clc; close all;
check = 0
while check == 0
    difficulty = input('Please enter "easy", "medium", or "hard" for the deisred difficulty: ', "s");
    check = checkInputD(difficulty);
end
[boardSize, numberBombs] = sizeBombs(difficulty);
flags = zeros(boardSize);
boardGen = createboard(boardSize,numberBombs);

