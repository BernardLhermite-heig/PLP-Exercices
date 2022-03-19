{-
: Exercice 1
-}

a1 = [[[5 ^ 2]]]

a2 = [(5 ^ 2, 'c')]

a3 = (5.0, [[5 ^ 2]])

a4 = ((5 ^ 2, 5 ^ 2), [True], 3.5)

{-
: Exercice 2

1. Num
2. (Num, String)
3. (Integer, String)
4. Bool
5. Int
6. Bool
-}

{-
: Exercice 3

1. Floating
2. (Fractional, String)
3. Char
4. [[Num]]
5. [(Char, Num)]
-}

{-
: Exercice 4

1. second :: [a] -> a
2. swap :: (a, b) -> (b, a)
3. pair :: a -> b -> (a, b)
4. double :: Num a => a -> a
5. palindrome :: Eq a => [a] -> Bool
6. twice :: (a -> a) -> a -> a
-}

{-
: Exercice 5

a. 5
b. 3
c. 2
d. 1
e. 4
-}

{-
: Exercice 6

1. a
2. d
3. d
4. c
5. a
6. e
7. d
8. a
9. c
-}

{-
: Exercice 7

1. c
2. a
3. b
4. c
-}

{-
: Exercice 8

1. Int(eger)
2. Num a => a -> a
3. Double
4. [Char]
5. [Char]
-}

{-
: Exercice 9
-}

insert :: a -> [a] -> [a]
insert x xs = x : xs

delete :: Eq a => a -> [a] -> [a]
delete x (y : ys)
  | y == x = ys
  | otherwise = y : delete x ys
delete _ _ = []

contains :: Eq a => a -> [a] -> Bool
contains x (y : ys)
  | x == y = True
  | otherwise = contains x ys
contains x [] = False

union :: Eq a => [a] -> [a] -> [a]
union (x : xs) ys
  | contains x ys = union xs ys
  | otherwise = x : union xs ys
union _ ys = ys

diff :: Eq a => [a] -> [a] -> [a]
diff (x : xs) ys
  | not (contains x ys) = x : diff xs ys
  | otherwise = diff xs ys
diff _ _ = []

{-
: Exercice 10

d : Eq a => ([a], [(a,a)]) -> a -> [a]
d': Eq a => ([a], [(a,a)]) -> [a] -> [a]
-}
