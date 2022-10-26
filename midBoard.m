winCheck(tmpr,tmpc) = 1;
if boardGen(tmpr,tmpc) == 0
    disp('zero reveal around')
    for i = tmpr-1:tmpr+1
        for j = tmpc-1:tmpc+1
            if winCheck(i,j) == 0
                [displayBoard,mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,displayBoard,boardGen,boardSize,mineSweeperGraphics,MineSweeperBoard);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
else
    disp('not zero check around for zeros')
    for i = tmpr-1:tmpr+1
        for j = tmpc-1:tmpc+1
            if winCheck(i,j) == 0 && boardGen(i,j) == 0
                disp('found zero')
                [displayBoard,mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,displayBoard,boardGen,boardSize,mineSweeperGraphics,MineSweeperBoard);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
end