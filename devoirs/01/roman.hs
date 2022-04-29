{-
: Auteur:   Stéphane Marengo
: Date:     27.04.2022
: Exercice: Numération romaine
-}

module Roman (toRoman, fromRoman) where

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
toValue 'I' = 1
toValue 'V' = 5
toValue 'X' = 10
toValue 'L' = 50
toValue 'C' = 100
toValue 'D' = 500
toValue 'M' = 1000
toValue c = error $ "Invalid roman numeral: " ++ [c]

toRoman :: Int -> Maybe String
toRoman x
  | x < 0 || x >= 4000 = Nothing
  | otherwise = Just $ snd $ foldl convert (x, "") romanMap
  where
    convert (x, str) (value, symbol) = (rem, roman)
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