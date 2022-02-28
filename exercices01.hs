import Data.Char

{- Exercice 1
    a. True
    b. False
    c. manque un 'i' et le else
    d. True
    e. peut pas écrire 4.
    f. 3
    g. doit avoir le même type de retour dans le then et le else
    h. false
    i. 6.0
-}
{- Exercice 2
    a. 3
    b. exception car liste vide
    c. [2,3]
    d. ["a","b","c"]
    e. "abcd"
    f. "bcd"
    g. ne doit pas avoir de paranthèse autour du 1
    h. [3,3,4]
    i. [3,2,2]
-}

{-
: Exercice 3
-}
-- a
oddList = [1, 3 .. 20]

-- b
evenList = [n | n <- [1 .. 20], even n]

-- c
perfectSquare = [n * n | n <- [1 ..], n * n < 100]

-- d
pairs = [(x, y) | x <- [0 .. 6], y <- [0 .. 6], x < y]

-- e
pairs' = let range = [1 .. 7] in [(x, y) | x <- range, y <- range, x < y]

-- f
triplets = let r = [1 .. 99] in [(x, y, z) | x <- r, y <- r, z <- r, x ^ 2 + y ^ 2 == z ^ 2]

{-
: Exercice 4
-}

somme x y z = x + y + z

carre x = x * x

triangles n =
  let r = [1 .. n]
   in [(x, y, z) | x <- r, y <- r, z <- r, carre x + carre y == carre z]

ou p q = p || q

et p q = p && q

{-
: Exercice 5
-}
truthTableOr = [(x, y, ou x y) | let r = [False, True], x <- r, y <- r]

truthTableAnd = [(x, y, et x y) | let r = [False, True], x <- r, y <- r]

{-
: Exercice 6
-}

dropSubstring xs sub =
  let len = length sub
   in if take len xs == sub then drop len xs else xs

{-
: Exercice 7
-}

clean s =
  let sub = "Hello"
      len = length sub
      capitalized (head : tail) = toUpper head : tail
      capitalized [] = []
   in if take len s == sub
        then capitalized (drop len s)
        else s

{-
: Exercice 8
-}

tuple n = (n ^ 2, (n + 1) ^ 2, (n + 2) ^ 2)

{-
: Exercice 9
-}

noms = ["Bob", "Bob2", "Bob3"]

ages = [11, 12, 13]

tuples = zip noms ages

ageFromName list name = lookup name list

ageFromName' xs name =
  case xs of
    ((name', age) : ys)
      | name' == name -> age
      | otherwise -> ageFromName' ys name
    _ -> -1

{-
: Exercice 10
-}

myList = [1 .. 10]

myLength = length myList

myHead = head myList

my5Th = myList !! 5

myLast = last myList

myTail = tail myList

myInit = init myList

myTake = take 5 myList

myDrop = drop 5 myList

myConcatList = myList ++ [2, 3]

{-
: Exercice 11
-}

slice s i j = [s !! x | x <- [i .. j]]

slice' xs i j =
  case xs of
    (y : ys)
      | i > 0 -> slice' ys (i - 1) (j - 1)
      | j >= 0 -> y : slice' ys i (j - 1)
    _ -> []

{-
: Exercice 12
-}
insert x n xs = take n xs ++ [x] ++ drop n xs

insert' x n xs =
  case xs of
    (y : ys)
      | n <= 1 -> x : y : ys
      | otherwise -> y : insert' x (n - 1) ys
    _ -> [x]

{-
: Exercice 13
-}

sieve n xs = [x | x <- xs, x `mod` n /= 0]

{-
: Exercice 14
-}

prime n =
  case n of
    1 -> False
    2 -> False
    n -> null ([x | x <- [2 .. (n - 1)], n `mod` x == 0])

{-
: Exercice 15
-}

parts n = [(x, y) | let r = [2 .. (n - 1)], x <- r, y <- r, x + y == n, prime x && prime y]

{-
: Exercice 16
-}

add (a, b) (c, d) = (a + c, b + d)

{-
: Exercice 17
-}
prod (a, b, c) (a', b', c') = a * a' + b * b' + c * c'

{-
: Exercice 18
-}

addList xs =
  case xs of
    [v1@(a, b), v2@(c, d)] -> add v1 v2
    (v1@(a, b) : ys) -> add v1 (addList ys)
    _ -> (0, 0)

prodList xs =
  let mult [(a, b, c)] = (a, b, c)
      mult [(a, b, c), (d, e, f)] = (a * d, b * e, c * f)
      mult (v@(a, b, c) : ys) = mult [v, mult ys]
      mult [] = (0, 0, 0)
      (a, b, c) = mult xs
   in a + b + c

{-
: Exercice 19
-}
head' [] = error "vide"
head' (x : xs) = x

tail' [] = error "vide"
tail' (x : xs) = xs

{-
: Exercice 20
-}
my5ThElement (_ : _ : _ : _ : x : _) = x
my5ThElement _ = error "Pas trouvé"

{-
: Exercice 21
-}

pgcd a b
  | a == b = a
  | a > b = pgcd (a - b) b
  | otherwise = pgcd a (b - a)

{-
: Exercice 22
-}

secToHMS s =
  let hms (h, m, s')
        | s' >= 3600 = hms (h + 1, m, s' - 3600)
        | s' >= 60 = hms (h, m + 1, s' - 60)
        | otherwise = (h, m, s')
   in hms (0, 0, s)

{-
: Exercice 23

        c
     _________
    |   ______| a
    |  |
    |  | b
    |  |
    |__|
     a
-}
equerre a b c = rect1 + rect2
  where
    rect1 = a * b
    rect2 = a * c

{-
: Exercice 24
-}

insertionSort xs =
  let insert x (y : ys)
        | x < y = x : y : ys
        | otherwise = y : insert x ys
      insert x [] = [x]
   in case xs of
        (x : ys) -> insert x (insertionSort ys)
        _ -> []