justRevealed = zeros(boardSize);
gameOver = 0;
check = 0;
disp('Type an r to reveal the tile or an f to flag it.')

while check == 0
    h = figure(1);
    waitforbuttonpress;
    k = get(h,'CurrentKey');
    if k == 'r' || k == 'f'
        check = 1;
    else
        disp('Invalid key. Please enter an r to reveal the tile or an f to flag it.')
    end
end

if k == 'r'
    if boardGen(row,col) == 9
        gameOver = 1;
        winCheck(row,col) = 0;
    else
        gameOver = 0;
        [displayBoard,mineSweeperGraphics,MineSweeperBoard] = reveal(row,col,displayBoard,boardGen,boardSize,mineSweeperGraphics,MineSweeperBoard);
        winCheck(row,col) = 1;
        justRevealed(row,col) = 1;
    end
    while 1 == 1
        [tmpr,tmpc] = find(justRevealed,1);
        justRevealed(tmpr,tmpc) = 0;
        edgeCase = [tmpr,tmpc];
        if isempty(edgeCase)
            break
        end
        if isequal(edgeCase,[1,1])
            topLeftBoard;
        elseif isequal(edgeCase,[1,boardSize])
            topRightBoard;
        elseif isequal(edgeCase,[boardSize,1])
            botLeftBoard;
        elseif isequal(edgeCase,[boardSize,boardSize])
            botRightBoard;
        elseif tmpr == 1
            topBoard;
        elseif tmpr == boardSize
            botBoard;
        elseif tmpc == 1
            leftBoard;
        elseif tmpc == boardSize
            rightBoard;
        else
            midBoard;
        end
    end
elseif k == 'f'
    if winCheck(row,col) == 1
        disp('You cannot flag a tile that has already been revealed, please try again.')
    elseif flags(row,col) == 0
        displayBoard(row,col) = 11;
        flags(row,col) = 1;
        MineSweeperBoard{row,col} = mineSweeperGraphics{12};
    else
        displayBoard(row,col) = 10;
        flags(row,col) = 0;
        MineSweeperBoard{row,col} = mineSweeperGraphics{11};
    end
end