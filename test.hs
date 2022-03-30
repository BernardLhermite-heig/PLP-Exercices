t = ['a', 'b', 'c']

sousensembles [] = [[]]
sousensembles (x : xs) = [x : ps | ps <- sousensembles xs] ++ sousensembles xs

split xs = foldr (\t (xs, ys) -> (t : ys, xs)) ([], []) xs

ins x [] = [x]
ins x l@(y : ys)
  | x < y = x : l
  | otherwise = y : ins x ys

ss [] = [[]]
ss (x : xs) = ss xs ++ map (x :) (ss xs)

part xs = foldr (\x (a, b) -> (x : b, a)) ([], []) xs

tri [x] = [x]
tri (x : xs) = ins x (tri xs)

p (a, b) = a == b

filtre _ 0 _ = []
filtre _ _ [] = []
filtre p n (x : xs)
  | p x = x : filtre p (n -1) xs
  | otherwise = filtre p n xs

{-

1 2 3
    3 ([], []) -> ([3], [])
  2 ([3], []) -> ([2], [3])

-}

union xs ys = xs ++ [y | y <- ys, y `notElem` xs]

inter xs ys = [x | x <- xs, x `elem` ys]

inter' xs ys = filter (`elem` ys) xs

union' xs ys = xs ++ filter (`notElem` xs) ys


ts = max [ 20.82034834,  13.92793633,  -9.82680497, -18.60063521,-7.14075923, -12.20074865,  14.72438011,  17.56291759,-14.64451313, -30.77387448,  16.07106928, -17.88127797,-15.4689036 ]