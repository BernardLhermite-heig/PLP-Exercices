-- Exo 1

module Personne where

import Data.Char (toUpper)

data Personne = Personne
  { prenom :: String,
    nom :: String,
    age :: Int,
    taille :: Float
  }
  deriving (Show, Eq)

initiales Personne {prenom = x, nom = y}
  | null x = "X." ++ initiale y
  | null y = initiale x ++ " X."
  | otherwise = initiale x ++ ' ' : initiale y
  where
    initiale (c : _) = toUpper c : ['.']

instance Enum Personne where
  succ (Personne a b c d) = Personne a b (c + 1) d

recherche :: (Personne -> Bool) -> [Personne] -> [Personne]
recherche = filter

vieillir :: [Personne] -> [Personne]
vieillir = map succ

moyenne :: [Personne] -> Double
moyenne xs = foldl (\x Personne {age = a} -> x + realToFrac a) 0 xs / realToFrac (length xs)

-- xs = [Personne "Bob" "Marley" 5 150, Personne "N" "T" 10 2]