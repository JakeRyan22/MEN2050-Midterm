
warning('off','images:imshow:magnificationMustBeFitForDockedFigure')%Turns off annoying warning when figure line is run
clear; close all; %clears workspace and closes all figures (the previous game if left open) 
load TicTacToe.mat; %loads the graphics files
figure('WindowStyle','docked');
imshow([Board{1,:};Board{2,:};Board{3,:}])%displays empty Tic Tac Toe board
winner = 'No one'; %initializes char array that tracks the winner of the game, defaults to nobody (tie)
nameOne = input('Player 1, enter your name: ' , "s");
check = 0; %variable used throughout to check validity of user entrys (prevents user from breaking code)

%makes sure that there is a difference between the default tie print and
%the winner print (cannot enter 'No one' for the name)
while check == 0
    if strcmp(nameOne,winner) == 1
        fprintf('Error: %s is an invalid name, please enter a different name. \n', nameOne)
        nameOne = input('Player 1, enter your name: ' , "s");
    else
        check = 1;
    end
end 

nameTwo = input('Player 2, enter your name: ' , "s");
check = 0;

%similar to check for nameOne, except nameTwo cannot be the same as
%nameOne in order for it to be clear who the winner is
while check == 0
    if strcmp(nameTwo,winner) == 1 || strcmp(nameTwo,nameOne) == 1
        fprintf('Error: %s is an invalid name, please enter a different name. \n', nameTwo)
        nameTwo = input('Player 2, enter your name: ' , "s");
    else
        check = 1;
    end
end

%calls an external function I made to flip a virtual coin
[firstTurn, secondTurn] = flipCoin(nameOne,nameTwo);
fprintf('%s will have the first turn, and will use Xs \n' , firstTurn) %tells user who goes first (it is up to the user to follow this instruction)


winTracker = zeros(3); %initializes a matrix used to track the winner
mistakeCounter1 = 0; %initialization for variable I use to track the mistakes the user makes, as an easter egg
mistakeCounter2 = 0;
for turn = 1:9 %there are 9 possible turns in tic tac toe, if someone wins before then it breaks out
    if strcmp(winner,'No one') == 1 %if nobody has won yet,
        if rem(turn,2) ~=0 %if it is an odd turn (so the player who goes first)
            fprintf('%s, left click on the space you want to place your X \n', firstTurn) %prompts user
            [x,y] = ginput(1); %takes input of a mouse click as coordinates on the board, then converts to a 1,2, or 3
            row = floor(y/123)+1; 
            col = floor(x/138)+1; %floor rounds down
            check = 0;
            
            %makes sure user clicks playable space
           
            while check == 0
                %easter egg is built into the checker, displays a random
                %message from the easterEgg function when user reaches 20
                %errors
                if mistakeCounter1 > 18
                    funnyPhrase = easterEgg();
                    disp(funnyPhrase)
                    mistakeCounter1 = mistakeCounter1 - 1;
                elseif row < 1 || row > 3 || col < 1 || col > 3
                    disp('Invalid space, click on the board please.')
                    mistakeCounter1 = mistakeCounter1 + 1;
                    [x,y] = ginput(1);
                    row = floor(y/123)+1;
                    col = floor(x/138)+1;

                elseif winTracker(row,col) ~= 0
                    disp('Space taken, please click another space.')
                    mistakeCounter1 = mistakeCounter1 + 1;
                    [x,y] = ginput(1);
                    row = floor(y/123)+1;
                    col = floor(x/138)+1;
                else
                    check = 1;
                end
            end
            
            Board{row,col} = X;
            winTracker(row,col) = 1;

            %creates variables to check the diagonal win conditions
            Diag1 = winTracker(1,1) + winTracker(2,2) + winTracker(3,3);
            Diag2 = winTracker(1,3) + winTracker(2,2) + winTracker(3,1);

            %if statement to change value of winner if any of the win
            %conditions are met.
            if sum(winTracker(row,:)) == 3 || sum(winTracker(:,col)) == 3 || Diag1 == 3 || Diag2 == 3
                winner = firstTurn;
            end
        else %even turns, so all the player who goes second's turns, code is nearly identical to the odd turns
            fprintf('%s, left click on the space you want to place your O \n', secondTurn)
            [x,y] = ginput(1);
            row = floor(y/123)+1;
            col = floor(x/138)+1;
            check = 0;
            while check == 0
                if mistakeCounter2 > 18
                    funnyPhrase = easterEgg();
                    disp(funnyPhrase)
                    mistakeCounter2 = mistakeCounter2 - 1;
                elseif row < 1 || row > 3 || col < 1 || col > 3
                    disp('Invalid space, click on the board please.')
                    mistakeCounter2 = mistakeCounter2 + 1;
                    [x,y] = ginput(1);
                    row = floor(y/123)+1;
                    col = floor(x/138)+1;
                elseif winTracker(row,col) ~= 0
                    disp('Space taken, please click another space.')
                    mistakeCounter2 = mistakeCounter2 + 1;
                    [x,y] = ginput(1);
                    row = floor(y/123)+1;
                    col = floor(x/138)+1;
                else
                    check = 1;
                end
            end
            Board{row,col} = O;
            winTracker(row,col) = -1;
            Diag1 = winTracker(1,1) + winTracker(2,2) + winTracker(3,3);
            Diag2 = winTracker(1,3) + winTracker(2,2) + winTracker(3,1);
            if sum(winTracker(row,:)) == -3 || sum(winTracker(:,col)) == -3 || Diag1 == -3 || Diag2 == -3
                winner = secondTurn;
            end
            
        end
        imshow([Board{1,:};Board{2,:};Board{3,:}]);
    else %if there is a winner, it breaks (if the value of winner is changed)
        break
    end
end %end of 9 turns
fprintf('%s is the winner, thank you for playing.\n' , winner) %prints out the name of the winner