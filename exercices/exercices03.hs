import Data.Char
import Prelude hiding (fmap)

{-
: Exercice 1

[f x | x <- xs, p x]
-}
list1 f p xs = map f (filter p xs)

{-
: Exercice 2

check f [(𝑥1, 𝑦1) ... (𝑥𝑛, 𝑦𝑛) ]-> [(𝑥1, 𝑦1, 𝑓 𝑥1𝑦1) ... (𝑥𝑛, 𝑦𝑛, 𝑓 𝑥𝑛𝑦𝑛)]
-}

check :: (a -> b -> c) -> [(a, b)] -> [(a, b, c)]
check f = map (\(x, y) -> (x, y, f x y))

{-
: Exercice 3
-}

fmap :: [a -> a] -> a -> [a]
fmap (f : fs) x = f x : fmap fs x
fmap _ _ = []

{-
: Exercice 4
-}

listes :: [a] -> [[a]]
listes = map (: [])

{-
: Exercice 5
-}

carres :: Num a => [a] -> [a]
carres = map (^ 2)

{-
: Exercice 6
-}

carres' :: Num a => [a] -> [a]
carres' = map (flip (^) 2)

{-
: Exercice 7
-}

positiveAttitude :: [Integer] -> [Integer]
positiveAttitude = map abs

{-
: Exercice 8
-}

ex5 :: [String] -> [String]
ex5 = map (take 5)

{-
: Exercice 9
-}

minuscules :: String -> String
minuscules (x : xs) = x : map toLower xs
minuscules _ = []

{-
: Exercice 10

pas sûr d'avoir compris la donnée
-}

ex10 :: [Integer] -> [[Integer]]
ex10 xs = f [[], []] xs
  where
    f [ys, zs] (x : xs)
      | odd x = f [x : ys, zs] xs
      | otherwise = f [ys, x : zs] xs
    f [ys, zs] [] = [ys, zs]

{-
: Exercice 11

pas sûr d'avoir compris la donnée
-}

ex11 :: Ord a => a -> [a] -> [[a]]
ex11 n xs = f [[], []] xs
  where
    f [ys, zs] (x : xs)
      | x > n = f [x : ys, zs] xs
      | x < n = f [ys, x : zs] xs
      | otherwise = f [ys, zs] xs
    f [ys, zs] [] = [ys, zs]

{-
: Exercice 12
-}

cherche :: (a -> Bool) -> [a] -> a
cherche pred xs = head (filter pred xs)

{-
: Exercice 13
-}

existe :: Eq t => [t] -> (t -> Bool) -> Bool
existe xs pred = existeAcc xs False
  where
    existeAcc (x : xs) acc = pred x || existeAcc xs acc
    existeAcc [] acc = acc

{-
: Exercice 14
-}

tous :: Eq t => [t] -> (t -> Bool) -> Bool
tous xs pred = existeAcc xs True
  where
    existeAcc (x : xs) acc = pred x && existeAcc xs acc
    existeAcc [] acc = acc

{-
: Exercice 15
-}

existe' :: Eq t => [t] -> (t -> Bool) -> Bool
existe' xs pred = or (map pred xs)

tous' :: Eq t => [t] -> (t -> Bool) -> Bool
tous' xs pred = and (map pred xs)

{-
: Exercice 16
-}

collatz x = x : g [] x
  where
    f x
      | odd x = x * 3 + 1
      | otherwise = x `div` 2
    g xs 1 = xs
    g xs x = xi : g xs xi
      where
        xi = f x

len = length $ collatz 156159 -- 383

{-
: Exercice 17

Le reverse est plutôt laid mais c'est toujours plus rapide que la version classique
-}

fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n -2) + fibo (n - 1)

fiboMem n = reverse (fibo 0 [])
  where
    fibo 0 acc = fibo 1 (0 : acc)
    fibo 1 acc = fibo 2 (1 : acc)
    fibo n' (x : y : acc)
      | n' == n = x : y : acc
      | otherwise = fibo (n' + 1) (x + y : x : y : acc)