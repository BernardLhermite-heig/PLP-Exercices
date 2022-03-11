{-
: lambda
-}

increment :: Num a => a -> a
increment = \x -> x + 1

triplet :: a -> b -> c -> (a, b, c)
triplet = \x y z -> (x, y, z)

swap :: (a, b) -> (b, a)
swap = \(a, b) -> (b, a)

first :: [a] -> a
first = \(x : _) -> x

{-
: currying
-}

triplet' :: a -> b -> c -> (a, b, c)
triplet' x y z = (x, y, z)

triplet'' :: a -> b -> c -> (a, b, c)
triplet'' = \x -> \y -> \z -> (x, y, z)

{-
: partial application
-}
-- triplet :: a -> b -> c -> (a, b, c)
partialTriplet :: b -> c -> (Integer, b, c)
partialTriplet = triplet 1

partialTriplet' :: c -> (Integer, Bool, c)
partialTriplet' = triplet 1 True

-- (+) :: Num a => a -> a -> a

partialPlus :: Num a => a -> a
partialPlus = (+) 1 -- <=> \x -> x + 1

{-
: higher-order function
-}

hasMultipleOf3 :: Integral a => [a] -> Bool
hasMultipleOf3 [] = False
hasMultipleOf3 (x : xs)
  | x `mod` 3 == 0 = True
  | otherwise = hasMultipleOf3 xs

hasMultipleOf _ [] = False
hasMultipleOf n (x : xs)
  | x `mod` n == 0 = True
  | otherwise = hasMultipleOf n xs

some :: (a -> Bool) -> [a] -> Bool
some _ [] = False
some f (x : xs) -- = f x || some f xs
  | f x = True
  | otherwise = some f xs

{-
: map :: (a -> b) -> [a] -> [b]
-}

stringify :: Show a => [a] -> [String]
stringify [] = []
stringify (x : xs) = show x : stringify xs

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

{-
: filter :: (a -> Bool) -> [a] -> [a]
-}

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x : xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs

{-
: zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-}

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys
zipWith' _ _ _ = []

{-
: foldl :: Foldable t => (b -> t -> b) -> b -> t -> b
-}

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f acc [] = acc
foldl' f acc (x : xs) = foldl' f (f acc x) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x : xs) = reverse' xs ++ [x]

reverse'' xs = reverseAcc xs []
  where
    reverseAcc (x : xs) acc = reverseAcc xs (x : acc)
    reverseAcc [] acc = acc

{-
: foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-}
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f acc [] = acc
foldr' f acc (x : xs) = f x (foldr' f acc xs)

{-
: flip :: (a -> b -> c) -> (b -> a -> c)
-}
flip' f = \x -> \y -> f y x

{-
: ($) application
-}

application =
  let _ = sqrt (1 + 2 + 3)
      _ = sqrt $ 1 + 2 + 3
   in ()

{-
: function composition
-}

f x = 2 * x

g x = x + 1

fog x = f (g x)

fog' x = (f . g) x

compose :: (a -> b) -> (c -> a) -> c -> b
compose f g = \x -> f (g x)

fog'' = compose f g

len [] = 0
len (_ : xs) = 1 + len xs

len' [] = 0
len' xs = 1 + len' (tail xs)

len'' [] = 0
len'' xs = succ $ len' $ tail xs

len''' [] = 0
len''' xs = (succ . len''') (tail xs)

len'''' [] = 0
len'''' xs = (succ . len'''' . tail) xs

len''''' [] = 0
len''''' xs = succ . len''''' . tail $ xs

{-
: infinite list
-}

infList x = [1 .. x]

{-
: lazy evaluation
-}

lazy1 =
  let f x y = x
      g x = g x
   in f 5 (g 10)

lazy2 =
  let f (x : y : z : _) = (x, y, z)
      g x = x : g x
   in f (g 5)
