{-
: Auteur: Stéphane Marengo
: Date: 27.04.2022
-}

module Peano where

data Nat
  = Zero
  | Succ Nat
  deriving (Show)

add :: Nat -> Nat -> Nat
add Zero x = x
add (Succ x) y = Succ (x `add` y)

sub :: Nat -> Nat -> Nat
sub Zero _ = Zero
sub x Zero = x
sub (Succ x) (Succ y) = x `sub` y

mult :: Nat -> Nat -> Nat
mult Zero _ = Zero
mult _ Zero = Zero
mult (Succ x) y = y `add` (x `mult` y)

pow :: Nat -> Int -> Nat
pow x 0 = Succ Zero
pow x 1 = x
pow x n = x `mult` (x `pow` (n - 1))

eq :: Nat -> Nat -> Bool
eq Zero Zero = True
eq Zero _ = False
eq _ Zero = False
eq (Succ x) (Succ y) = x `eq` y

neq :: Nat -> Nat -> Bool
neq x y = not $ x `eq` y

lt :: Nat -> Nat -> Bool
lt _ Zero = False
lt Zero _ = True
lt (Succ x) (Succ y) = x `lt` y

gt :: Nat -> Nat -> Bool
gt x y = y `lt` x

lte :: Nat -> Nat -> Bool
lte x y = not $ y `lt` x

gte :: Nat -> Nat -> Bool
gte x y = not $ x `lt` y

fromInt :: Int -> Nat
fromInt n
  | n <= 0 = Zero
  | otherwise = Succ $ fromInt (n - 1)

toInt :: Nat -> Int
toInt Zero = 0
toInt (Succ x) = 1 + toInt x

toString :: Nat -> String
toString Zero = "Z"
toString (Succ x) = "S(" ++ toString x ++ ")"

zero :: Nat
zero = Zero

succ' :: Nat -> Nat
succ' = Succ

pred' :: Nat -> Nat
pred' Zero = Zero
pred' (Succ x) = x

isZero :: Nat -> Bool
isZero Zero = True
isZero _ = False