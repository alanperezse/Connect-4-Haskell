module Game where
  import System.IO
  import Data.Char
  import Test
  import Board
  import C4

  playerToChar n
    | n == 1 = 'O'
    | n == 2 = 'X'
    | otherwise = '.'

  rowToStr r = foldl (++) "" (map (\p -> (playerToChar p : " ")) r)

  boardToStr bd = foldl (\s r -> s ++ r ++ "\n") (boardIndeces 1 (length bd)) (map rowToStr (getRows bd))
    where
      boardIndeces n m
        | n > m = "\n"
        | otherwise = [intToDigit n, ' '] ++ boardIndeces (n + 1) m


  getNum width = do
    line <- getLine
    let parsed = reads line :: [(Int, String)] in
      if length parsed == 0
      then getNum' width
      else let (x, _) = head parsed in
        if (x > 0 && x <= width)
        then return x
        else getNum' width
    where
      getNum' width = do
        putStr "Invalid input! Try again: "
        getNum width

  readSlot bd p = do
    putStrLn (playerToChar p : "'s turn.")
    let width = length bd
    putStr ("Select a slot [1 - " ++ (intToDigit width : []) ++ "]: ")
    num <- getNum width
    return num

  result bd p
    | isWonBy bd p = playerToChar p : " is the winner!"
    | isFull bd = "Tie!"
    | otherwise = "Continue"

  main = do
    putStrLn "Starting game...\n"
    let bd = mkBoard 7 6
    outcome <- (loop bd 1)
    putStrLn outcome
    where
      loop bd p = do
        putStrLn (boardToStr bd)
        let adv = if p == 1 then 2 else 1
        let r = result bd adv
        if r /= "Continue" then do
          return r
        else do
          num <- readSlot bd p
          putStrLn ""
          let new_bd = dropInSlot bd num p
          loop new_bd adv
