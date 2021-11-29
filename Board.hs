-- Code written by Alan Perez
-- Submitted on Nov 29, 2021

module Board where
  import Test

  mkColumn 0 = []
  mkColumn n = 0 : mkColumn (n - 1)

  mkBoard 0 _ = []
  mkBoard m n = mkColumn n : mkBoard (m - 1) n

  mkPlayer = 1
  mkOpponent = 2

  dropInColumn c p = reverse (helper (reverse c) p)
    where
      helper (h:t) p
        | h == 0 = p : t
        | otherwise = h : helper t p

  dropInSlot [] _ _ = []
  dropInSlot (h:t) i p
    | i == 1 = dropInColumn h p : t
    | otherwise = h : dropInSlot t (i - 1) p

  isColumnOpen [] = False
  isColumnOpen (h:_) = h == 0

  isSlotOpen [] _ = False
  isSlotOpen (h:_) 1 = isColumnOpen h
  isSlotOpen (_:t) i = isSlotOpen t (i - 1)

  numSlot bd = length bd

  isFull [] = True
  isFull (h:t)
    | isColumnOpen h = False
    | otherwise = isFull t
