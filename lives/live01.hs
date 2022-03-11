import Distribution.Simple.Utils (xargs)
import System.Win32 (COORD (y))

-- ghci
-- :l ss.hs
-- :r -> reload

{-
: variable
-}
myInt = 5

pi' = 3.14

a = 'a'

str = "hello"

true = True

{-
: expression
-}

arithmetic = ((1 + 2) * (4 `mod` 5) `div` 6) ^ 2

floating = 1.2 + 3.4 * 5.6 / 7.8

logic = True && False || not False

conditional = if 4 > 5 then "woohoo" else "wtf"

{-
: function
-}

identity x = x

square x = x * x

perimiter x y = 2 * x + 2 * y

{-
: application
-}

id5 = identity 5

square10 = square 10

perimiter4with5 = perimiter 4 5

{-
: infix
-}

myInfixDiv = 5 `div` 2

myPrefixDiv = div 5 2

myInfixAdd = 5 + 2

myPrefixAdd = (+) 5 2

myMin x y = if x < y then x else y -- Peut être appelé 4 `myMin` 5

{-
: recursion
-}

-- 0 + 1 + 2 + ... + n
total n = if n == 0 then 0 else n + total (n - 1)

fact n = if n < 1 then 1 else n * fact (n - 1)

{-
: list
-}

myEmptyList = []

my3List = [1, 2, 3]

myConcatList = [1] ++ [2, 3]

myConstructedList = 1 : [2, 3]

myConstructedList' = 1 : (2 : (3 : []))

myHeadLisit = head [1, 2, 3]

myTail = tail [1, 2, 3]

myInitList = init [1, 2, 3]

myLastList = last [1, 2, 3]

myListLength = length [1, 2, 3]

myReversedList = reverse [1, 2, 3]

myNthElement = [1, 2, 3] !! 2

{-
: string
-}

myString = "abc"

myString' = 'a' : 'b' : 'c' : []

myStringLength = length "abc"

myReversedString = reverse "abc"

{-
: tuple
-}

my0Tuple = ()

my3Tuple = ("foo", 12, True)

my2Tuple = (1, "foo")

myFirstElem = fst (1, "foo")

mySecondElem = snd (1, "foo")

myZippedList = zip [1, 2, 3] ["foo", "bar", "baz"]

{-
: list comprehension
{1 .. 10} liste en extension
{ n : n appartient à N, n est un multiple de 2 } liste en compréhension
-}

myExtensionList = [1 .. 10]

mySteppedExtensionList = [0, 2 .. 10]

myListComprehension =
  [n | n <- [1 .. 10], n `mod` 2 == 0]

myListComprehension' =
  [n + m | n <- [0 .. 10], m <- [0 .. 10]]

{-
: let
-}

increment n = n + 1

increment' n =
  let m = n + 1
   in m

greeting name =
  let message = "hello "; point = "."
   in message ++ name ++ point

{-
: guard
-}

fibo n =
  if n == 0
    then 0
    else
      if n == 1
        then 1
        else fibo (n - 1) + fibo (n - 2)

fibo' n
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fibo' (n - 1) + fibo' (n - 2)

replicate' n x
  | n == 0 = []
  | True = x : replicate' (n -1) x

myCompare x y
  | x > y = "greater"
  | x < y = "lower"

{-
: pattern matching
-}

myLength xs = if null xs then 0 else 1 + myLength (tail xs)

myLength' xs
  | null xs = 0
  | otherwise = 1 + myLength' (tail xs)

myLength'' [] = 0
myLength'' (_ : xs) = 1 + myLength'' xs

myElem x [] = False
myElem x (y : ys)
  | x == y = True
  | otherwise = myElem x ys

{-
: pattern
-}

pliteral 1 = True

puniverse _ = "puniverse"

pemptyList [] = False

plist (1 : x : _ : []) = 1.5

plist' [1, x, _] = 'a'

ptuple ("foo", True, x, _, []) = 10

palias xs@(_ : ys) = 5

my3ListSum [x, y, z] = x + y + z

mySwap (a, b) = (b, a)

{-
: pattern usage
-}

function _ = "f"

lett = let (_, b) = (1, 2) in b

lcomp = [x | (x : _) <- [[1, 2], [3], [4, 5, 6]]]

{-
: case
-}

-- max [(1, 2), (3, 4), (5, 6)] -> [2,4,6]
myMax xs =
  case xs of
    ((a, b) : ys) ->
      if a > b
        then a : myMax ys
        else b : myMax ys
    _ -> []
myMax' xs =
  case xs of
    ((a, b) : ys)
      | a > b -> a : myMax ys
      | otherwise -> b : myMax ys
    _ -> []
