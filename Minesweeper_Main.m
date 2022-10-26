clear; clc; close all;
difficultySelect
load minesweeper.mat;
figure('WindowStyle','docked');
[boardSize, numberBombs] = sizeBombs(difficulty); %computes difficulty for board size and number of bombs
boardGen = createboard(boardSize,numberBombs); %generates board matrix, bomb = 9
flags = zeros(boardSize); %flags matrix that keeps track of where flags are placed
winCheck = zeros(boardSize); %winCheck keeps track of revealed tiles, also used to check win condition
gameOver = 0; %tracks lose condition (user hits bomb)
condition = logical(true); %used for game loop, stays true if user hasn't won or lost yet
displayBoard = zeros(boardSize) +10; %temporary display board used for testing purposes
while condition %main game loop
    graphicsCompute
    row = input('row'); 
    col = input('col');%temporary way to get user input for testing purposes
    [gameOver,winCheck,displayBoard,flags] = computeInput(row,col,boardGen,boardSize,winCheck,displayBoard,flags);
    %computes a [row,col] input to reveal the correct tiles and check if the win or lose condition is met
    if gameOver == 1 || sum(winCheck,'all') == boardSize^2 - numberBombs %if bomb hit or all non bomb tiles revealed
        condition = false; %ends main game loop
    end
end

%prints win or lose based on if bomb was hit in the main game loop
if gameOver == 1
    disp('You lose: hit a bomb.')
    graphicsCompute
else 
    disp('Congratulations, you won.')
    graphicsCompute
end