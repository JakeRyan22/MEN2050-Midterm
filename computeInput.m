function gameOver = computeInput(row,col,boardGen,boardSize)
tile = boardGen(row,col)
if tile == 9
    gameOver = 1