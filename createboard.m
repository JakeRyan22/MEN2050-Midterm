function boardGen = createboard(boardSize,numberBombs)
rng shuffle
randomizer = randperm(boardSize^2);
counter = 1;
boardGen = ones(boardSize);
for row = 1:boardSize
    for col = 1:boardSize
        if randomizer(counter) <= numberBombs
            boardGen(counter) = 0;
        end
        counter = counter + 1;
    end
end
counter = 1;
for row = 1:boardSize
    for col = 1:boardSize
        if counter == 1
                if boardGen(counter) == 0
                    if boardGen(counter+1) > 0
                        boardGen(counter + 1) = boardGen(counter + 1) + 1;
                    end
                    if boardGen(counter + boardSize) > 0
                        boardGen(counter + boardSize) = boardGen(counter + boardSize) + 1;
                    end
                    if boardGen(counter + (boardSize+1)) > 0
                        boardGen(counter + (boardSize+1)) = boardGen(counter + (boardSize+1)) + 1;
                    end
                end
        elseif counter == boardSize
                if boardGen(counter) == 0
                    if boardGen(counter-1) > 0
                        boardGen(counter -1) = boardGen(counter - 1) + 1;
                    end
                    if boardGen(counter + boardSize) > 0
                        boardGen(counter + boardSize) = boardGen(counter + boardSize) + 1;
                    end
                    if boardGen(counter + (boardSize-1)) > 0
                        boardGen(counter + (boardSize-1)) = boardGen(counter + (boardSize-1)) + 1;
                    end
                end
        elseif counter == boardSize^2-boardSize+1
                if boardGen(counter) == 0
                    if boardGen(counter+1) > 0
                        boardGen(counter + 1) = boardGen(counter + 1) + 1;
                    end
                    if boardGen(counter - boardSize) > 0
                        boardGen(counter - boardSize) = boardGen(counter + boardSize) + 1;
                    end
                    if boardGen(counter - (boardSize-1)) > 0
                        boardGen(counter - (boardSize-1)) = boardGen(counter - (boardSize-1)) + 1;
                    end
                end
        elseif counter == boardSize^2
                if boardGen(counter) == 0
                    if boardGen(counter-1) > 0
                        boardGen(counter - 1) = boardGen(counter - 1) + 1;
                    end
                    if boardGen(counter - boardSize) > 0
                        boardGen(counter - boardSize) = boardGen(counter - boardSize) + 1;
                    end
                    if boardGen(counter - (boardSize+1)) > 0
                        boardGen(counter - (boardSize+1)) = boardGen(counter - (boardSize+1)) + 1;
                    end
                end
        elseif rem((counter-1),boardSize) == 0
                if boardGen(counter) == 0
                    if boardGen(counter+1) > 0
                        boardGen(counter + 1) = boardGen(counter + 1) + 1;
                    end
                    if boardGen(counter + boardSize) > 0
                        boardGen(counter + boardSize) = boardGen(counter + boardSize) + 1;
                    end
                    if boardGen(counter + (boardSize+1)) > 0
                        boardGen(counter + (boardSize+1)) = boardGen(counter + (boardSize+1)) + 1;
                    end
                    if boardGen(counter-boardSize) > 0
                        boardGen(counter - boardSize) = boardGen(counter -boardSize) + 1;
                    end
                    if boardGen(counter-(boardSize-1)) > 0
                        boardGen(counter -(boardSize-1)) = boardGen(counter -(boardSize-1)) + 1;
                    end
                end
        elseif counter <= boardSize-1  && counter >= 2
                if boardGen(counter) == 0
                    if boardGen(counter+1) > 0
                        boardGen(counter + 1) = boardGen(counter + 1) + 1;
                    end
                    if boardGen(counter + boardSize) > 0
                        boardGen(counter + boardSize) = boardGen(counter + boardSize) + 1;
                    end
                    if boardGen(counter + (boardSize+1)) > 0
                        boardGen(counter + (boardSize+1)) = boardGen(counter + (boardSize+1)) + 1;
                    end
                    if boardGen(counter-1) > 0
                        boardGen(counter - 1) = boardGen(counter -1) + 1;
                    end
                    if boardGen(counter+(boardSize-1)) > 0
                        boardGen(counter +(boardSize-1)) = boardGen(counter +(boardSize-1)) + 1;
                    end
                end
        elseif counter >= boardSize^2 - boardSize + 2 && counter <= boardSize^2 - 1
                if boardGen(counter) == 0
                    if boardGen(counter+1) > 0
                        boardGen(counter + 1) = boardGen(counter + 1) + 1;
                    end
                    if boardGen(counter -1) > 0
                        boardGen(counter -1) = boardGen(counter -1) + 1;
                    end
                    if boardGen(counter - (boardSize+1)) > 0
                        boardGen(counter - (boardSize+1)) = boardGen(counter - (boardSize+1)) + 1;
                    end
                    if boardGen(counter-boardSize) > 0
                        boardGen(counter - boardSize) = boardGen(counter -boardSize) + 1;
                    end
                    if boardGen(counter-(boardSize-1)) > 0
                        boardGen(counter -(boardSize-1)) = boardGen(counter -(boardSize-1)) + 1;
                    end
                end
        elseif rem(counter,boardSize) == 0
                if boardGen(counter) == 0
                    if boardGen(counter-1) > 0
                        boardGen(counter - 1) = boardGen(counter - 1) + 1;
                    end
                    if boardGen(counter + boardSize) > 0
                        boardGen(counter + boardSize) = boardGen(counter + boardSize) + 1;
                    end
                    if boardGen(counter + (boardSize-1)) > 0
                        boardGen(counter + (boardSize-1)) = boardGen(counter + (boardSize-1)) + 1;
                    end
                    if boardGen(counter-boardSize) > 0
                        boardGen(counter - boardSize) = boardGen(counter -boardSize) + 1;
                    end
                    if boardGen(counter-(boardSize+1)) > 0
                        boardGen(counter -(boardSize+1)) = boardGen(counter -(boardSize+1)) + 1;
                    end
                end
        else
                if boardGen(counter) == 0
                    if boardGen(counter+1) > 0
                        boardGen(counter + 1) = boardGen(counter + 1) + 1;
                    end
                    if boardGen(counter + boardSize) > 0
                        boardGen(counter + boardSize) = boardGen(counter + boardSize) + 1;
                    end
                    if boardGen(counter + (boardSize+1)) > 0
                        boardGen(counter + (boardSize+1)) = boardGen(counter + (boardSize+1)) + 1;
                    end
                    if boardGen(counter-boardSize) > 0
                        boardGen(counter - boardSize) = boardGen(counter -boardSize) + 1;
                    end
                    if boardGen(counter-(boardSize-1)) > 0
                        boardGen(counter -(boardSize-1)) = boardGen(counter -(boardSize-1)) + 1;
                    end
                    if boardGen(counter + (boardSize-1)) > 0
                        boardGen(counter + (boardSize-1)) = boardGen(counter + (boardSize-1)) + 1;
                    end
                    if boardGen(counter - (boardSize+1)) > 0
                        boardGen(counter - (boardSize+1)) = boardGen(counter - (boardSize+1)) + 1;
                    end
                    if boardGen(counter-1) > 0
                        boardGen(counter - 1) = boardGen(counter -1) + 1;
                    end
                end
        end
        counter = counter + 1;
    end
end