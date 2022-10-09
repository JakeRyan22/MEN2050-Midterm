function boardGen = createboard(boardSize,numberBombs)
rng shuffle
randomizer = randperm(boardSize^2);
boardGen = zeros(boardSize);
counter = 1;
for row = 1:boardSize
    for col = 1:boardSize
        if randomizer(counter) <= numberBombs
            boardGen(row,col) = 9;
        end
        counter = counter + 1;
    end
end
for row = 1:boardSize
    for col = 1:boardSize
        edgeCase = [row,col];
        if isequal(edgeCase,[1,1])
            [boardGen] = topLeftBoardCreate(row,col,boardGen);
        elseif isequal(edgeCase,[1,boardSize])
            [boardGen] = topRightBoardCreate(row,col,boardGen);
        elseif isequal(edgeCase,[boardSize,1])
            [boardGen] = botLeftBoardCreate(row,col,boardGen);
        elseif isequal(edgeCase,[boardSize,boardSize])
            [boardGen] = botRightBoardCreate(row,col,boardGen);
        elseif row == 1
            [boardGen] = topBoardCreate(row,col,boardGen);
        elseif row == boardSize
            [boardGen] = botBoardCreate(row,col,boardGen);
        elseif col == 1
            [boardGen] = leftBoardCreate(row,col,boardGen);
        elseif col == boardSize
            [boardGen] = rightBoardCreate(row,col,boardGen);
        else
            [boardGen] = midBoardCreate(row,col,boardGen);
        end
    end
end