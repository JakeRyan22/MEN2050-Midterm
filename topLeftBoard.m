winCheck(tmpr,tmpc) = 1;
if boardGen(tmpr,tmpc) == 0
    for i = tmpr:tmpr+1
        for j = tmpc:tmpc+1
            if winCheck(i,j) == 0
                [displayBoard,mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,displayBoard,boardGen,boardSize,mineSweeperGraphics,MineSweeperBoard);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
else
    for i = tmpr:tmpr+1
        for j = tmpc:tmpc+1
            if winCheck(i,j) == 0 && boardGen(i,j) == 0
                [displayBoard,mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,displayBoard,boardGen,boardSize,mineSweeperGraphics,MineSweeperBoard);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
end