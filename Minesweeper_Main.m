clear; clc; close all;
check = 0;%variable used to check user input
while check == 0
    difficulty = input('Please enter "easy", "medium", or "hard" for the deisred difficulty: ', "s");
    check = checkInputD(difficulty); %repeats until the user inputs a valid difficulty
end
[boardSize, numberBombs] = sizeBombs(difficulty); %computes difficulty for board size and number of bombs
boardGen = createboard(boardSize,numberBombs); %generates board matrix, bomb = 9
flags = zeros(boardSize); %flags matrix that keeps track of where flags are placed
winCheck = zeros(boardSize); %winCheck keeps track of revealed tiles, also used to check win condition
gameOver = 0; %tracks lose condition (user hits bomb)
condition = logical(true); %used for game loop, stays true if user hasn't won or lost yet
displayBoard = zeros(boardSize) - 100; %temporary display board used for testing purposes
while condition %main game loop
    displayBoard %temporary display board, will be replaced w/ fn but this is where it would go
    row = input('row'); 
    col = input('col');%temporary way to get user input for testing purposes
    [gameOver,winCheck,displayBoard] = computeInput(row,col,boardGen,boardSize,winCheck,displayBoard);
    %computes a [row,col] input to reveal the correct tiles and check if the win or lose condition is met
    if gameOver == 1 || sum(winCheck,'all') == boardSize^2 - numberBombs %if bomb hit or all non bomb tiles revealed
        condition = false; %ends main game loop
    end
end

%prints win or lose based on if bomb was hit in the main game loop
if gameOver == 1
    disp('You lose: hit a bomb.')
else 
    disp('Congratulations, you won.')
end