module C4 where
  import Test
  import Board

  getRows bd = [getRow bd i | i <- [1 .. height bd]]
    where
      height bd = length (head bd)
      getRow [] _ = []
      getRow (h:t) i = h !! (i - 1) : getRow t i

  isWonList _ _ 4 = True
  isWonList [] _ _ = False
  isWonList (h:t) p s
    | h == p = isWonList t p (s + 1)
    | otherwise = isWonList t p 0

  isWonVertical [] _ = False
  isWonVertical (h:t) p
    | isWonList h p 0 = True
    | otherwise = isWonVertical t p

  isWonHorizontal bd p = isWonVertical (getRows bd) p

  isWonBy bd p
    | isWonHorizontal bd p = True
    | isWonVertical bd p = True
    | otherwise = False

  playerToChar n
    | n == 1 = 'O'
    | n == 2 = 'X'
    | otherwise = '.'

  rowToStr r = foldl (++) "" (map (\p -> (playerToChar p : " ")) r)

  boardToStr bd = foldl (\s r -> s ++ r ++ "\n") "" (map rowToStr (getRows bd))
