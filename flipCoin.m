function [firstTurn , secondTurn] = flipCoin(nameOne,nameTwo)
%to see who goes first in TicTacToe, flips a virtual coin by shuffling
%random numbers and creating a random 1 or 0, assigning char arrays of the
%names entered to firstTurn based on the random number.
rng shuffle
oneorzero = randi([0 1]);
if oneorzero == 1
    firstTurn = nameOne;
    secondTurn = nameTwo;
else
    firstTurn = nameTwo;
    secondTurn = nameOne;
end