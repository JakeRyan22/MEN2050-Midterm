clear; clc; close all;
check = 0
while check = 0
    difficulty = input('Would you like to play on easy, medium, or hard difficulty?' "s")
    check = checkInputD(difficulty)
end

createboard