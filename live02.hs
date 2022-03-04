{-
: basic types
-}
int :: Int
int = 123

integer :: Integer
integer = 32323213 ^ 10

double :: Double
double = 3.14

boolean :: Bool
boolean = True

char :: Char
char = 'a'

string :: String -- [Char]
string = "hello"

{-
: expression
-}

arithmetic :: Integer
arithmetic = (1 + 2) * (3 `div` 4) `mod` 5 - 6 ^ 7

floating :: Double
floating = 1.0 + 2.0 * 3.0 / 4.0

logic :: Bool
logic = True || not False

relational :: Bool
relational = 1 < 2 || 3 >= 4

conditional :: Bool
conditional = if "abc" < "ABC" then True else False

{-
: function type
-}

constant :: Int -> Int
constant n = n

add :: Int -> Int -> Int
add n m = n + m

choose :: Char -> String
choose c
  | c == 'y' = "Yes"
  | otherwise = "No"

isTrue :: Bool -> Bool
isTrue True = True
isTrue _ = False

isFalse :: Bool -> Bool
isFalse b = b'
  where
    b' = not (isTrue b)

{-
: type variable
-}

identity' :: p -> p
identity' x = x

ignore :: a -> b -> a
ignore x y = x

weird :: Int -> Bool -> p -> Int
weird x y z = x

{-
: list type
-}

emptyList :: [a]
emptyList = []

list2 :: a -> a -> [a]
list2 x y = [x, y]

listInteger :: [Integer]
listInteger = [1, 2, 3]

string' :: [Char] -- String
string' = "hello"

{-
: tuple type
-}

emptyTuple :: ()
emptyTuple = ()

tuple2 :: a -> b -> (a, b)
tuple2 x y = (x, y)

tuple3 :: a -> b -> c -> (a, b, c)
tuple3 x y z = (x, y, z)

tupleCharBool :: (Char, Bool)
tupleCharBool = ('a', False)

myZip :: [a] -> [b] -> [(a, b)]
-- myZip _ [] = []
-- myZip [] _ = []
myZip _ _ = []
myZip (x : xs) (y : ys) = (x, y) : myZip xs ys

myZip' xs ys =
  case (xs, ys) of
    (x : xs, y : ys) -> (x, y) : myZip' xs ys
    (_, _) -> []

{-
: list comprehension
-}

-- comprehension =
--     let
--         xs :: [a]
--         p :: a -> Bool
--         f :: a -> b
--         f x = if f x then ... else ...
--     in [f x | x <- xs, p x] -- [b]
--     --  ^^^   ^    ^^  ^^^^
--     --  b     a    [a]  Bool

{-
: type constraint
-}

add' :: Num a => a -> a -> a
add' x y = x + y

-- Num
-- Integral
-- Fractional
-- Eq
-- Ord
-- Show
-- Read
-- Enum

{-
: Num (+, -, *, abs)
-}

sum' :: Num a => a -> a -> a
sum' x y = x + y

diff :: Num a => a -> a -> a
diff x y = x - y

total :: Num a => [a] -> a
total [] = 0
total [x] = x
total (x : xs) = x + total xs

{-
: Integral (`div`, `mod`)
-}

division :: Integral a => a -> a -> a
division x y = div x y

modulo :: Integral a => a -> a -> a
modulo x y = mod x y

{-
: Eq (==, /=)
-}

equal :: Eq a => a -> a -> Bool
equal x y = x == y

different :: Eq a => a -> a -> Bool
different x y = x /= y

exist :: Eq a => a -> [a] -> Bool
exist _ [] = False
exist x (y : ys)
  | x == y = True
  | otherwise = exist x ys

{-
: Eq (>, >=, <, <=, min, max, compare)
-}

greater :: Ord a => a -> a -> Bool
greater x y = x > y

min' :: Ord a => a -> a -> a
min' x y = min x y

compare' :: Ord a => a -> a -> Ordering
compare' x y = compare x y

-- Ordering: LT, GT, EQ
compare'' :: Ord a => a -> a -> Ordering
compare'' x y
  | x < y = LT
  | x > y = GT
  | otherwise = EQ

sorted :: Ord a => [a] -> Bool
sorted (x : y : zs)
  | x <= y = sorted (y : zs)
  | otherwise = False
sorted _ = True

{-
: Show (show)
-}

toString :: Show a => a -> String
toString x = show x

{-
: Read (read)
-}

fromString :: Read a => String -> a
fromString x = read x

{-
: :: type specification / assertion / coercion
-}

{-
: type signature
-}

-- symbol :: type constraint => symbol type
dummy :: (Eq a, Num b) => (b, a, a, c) -> (b, Bool)
dummy (x, y, z, _) = (x + 1, y == z)

{-
: type inference
-}

zero :: [Int] -- [Integer]
zero = 0 : []

ternary :: Bool -> a -> a -> a
ternary x y z = if x then y else z

first :: (a, b) -> a
first t = fst t