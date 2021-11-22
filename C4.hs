module C4 where
  import Test
  import Board

  myBoard = [[0, 1 ,2], [0, 2, 1], [0, 0, 0]]
  row [] _ = []
  row (h:t) i = h !! (i - 1) : row t i

  rows bd = [row bd i | i <- [1 .. height bd]]
    where height bd = length (head bd)

  p2c n
    | n == 1 = 'O'
    | n == 2 = 'X'
    | otherwise = '.'

  rowToStr r = foldl (++) "" (map (\p -> (p2c p : " ")) r)

  -- boardToStr bd =
