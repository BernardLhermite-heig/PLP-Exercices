{-
: Auteur: Stéphane Marengo
: Date: 27.04.2022
-}

module Roman (toRoman, fromRoman) where

import Data.List
import Data.Maybe

romanMap :: [(Int, [Char])]
romanMap =
  [ (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]

toValue :: Char -> Int
toValue c
  | isJust f = fst $ fromJust f
  | otherwise = 0
  where
    f = find ((== [c]) . snd) romanMap

toValue' 'I' = 1
toValue' 'V' = 5
toValue' 'X' = 10
toValue' 'L' = 50
toValue' 'C' = 100
toValue' 'D' = 500
toValue' 'M' = 1000

toRoman :: Int -> Maybe String
toRoman x
  | x < 0 || x >= 4000 = Nothing
  | otherwise = Just $ snd $ foldl toRoman' (x, "") romanMap
  where
    toRoman' (x, str) (value, symbol) = (rem, roman)
      where
        roman = str ++ concat (replicate quot symbol)
        (quot, rem) = divMod x value

fromRoman :: String -> Maybe Int
fromRoman str
  | Just str == validStr = Just n
  | otherwise = Nothing
  where
    n = convert str
    validStr = toRoman n
    convert [] = 0
    convert [c] = toValue c
    convert (c1 : c2 : str)
      | n1 < n2 = n2 - n1 + convert str
      | otherwise = n1 + convert (c2 : str)
      where
        n1 = toValue c1
        n2 = toValue c2