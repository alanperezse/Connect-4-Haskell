module Test where
  testColEmpty = [0, 0, 0, 0, 0]
  testCol = [0, 0, 0, 1, 2]
  testColFull = [1, 1, 2, 2, 1]
  testColWinP1 = [0, 0, 1, 1, 1, 1]
  testColWinP2 = [2, 2, 2, 2, 1, 1]

  testBoardWinV1 = [[0, 0, 2, 2, 1, 2],[0, 0, 1, 1, 1, 1]]
  testBoardWinV2 = [[0, 0, 1, 1, 2, 1],[0, 0, 2, 2, 2, 2]]

  testBoardWinH1 = [[0,1],[1,1],[2,1],[2,1]]
  testBoardWinH2 = [[0,2],[2,2],[1,2],[1,2]]


  testBoard = [[0, 0, 0, 0, 0],[1, 2, 2, 1, 2],[0, 0, 2, 1, 2],[0, 0, 0, 2, 2]]
  testBoardFull = [[2, 2, 1, 1, 1],[1, 2, 2, 1, 2],[2, 1, 2, 1, 2],[1, 2, 1, 2, 2]]
