function [gameOver,winCheck,displayBoard,flags] = computeInput(row,col,boardGen,boardSize,winCheck,displayBoard,flags)
tile = boardGen(row,col);
justRevealed = zeros(boardSize);
gameOver = 0;
button{1} = 'Reveal';
button{2} = 'Flag';
flagOrReveal = menu('please select to Reveal or Flag selected square', button{1}, button{2});
if flagOrReveal == 1
    if tile == 9
        gameOver = 1;
        winCheck(row,col) = 0;
    else
        gameOver = 0;
        displayBoard = reveal(row,col,displayBoard,boardGen);
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
            [winCheck,justRevealed,displayBoard] = topLeftBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        elseif isequal(edgeCase,[1,boardSize])
            [winCheck,justRevealed,displayBoard] = topRightBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        elseif isequal(edgeCase,[boardSize,1])
            [winCheck,justRevealed,displayBoard] = botLeftBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        elseif isequal(edgeCase,[boardSize,boardSize])
            [winCheck,justRevealed,displayBoard] = botRightBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        elseif tmpr == 1
            [winCheck,justRevealed,displayBoard] = topBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        elseif tmpr == boardSize
            [winCheck,justRevealed,displayBoard] = botBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        elseif tmpc == 1
            [winCheck,justRevealed,displayBoard] = leftBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        elseif tmpc == boardSize
            [winCheck,justRevealed,displayBoard] = rightBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        else
            [winCheck,justRevealed,displayBoard] = midBoard(tmpr,tmpc,winCheck,boardGen,justRevealed,displayBoard);
        end
    end
elseif flagOrReveal == 2
    if winCheck(row,col) == 1
        disp('You cannot flag a tile that has already been revealed, please try again.')
    elseif flags(row,col) == 0
        displayBoard(row,col) = 12;
        flags(row,col) = 1;
    else
        displayBoard(row,col) = -100;
        flags(row,col) = 0;
    end
end