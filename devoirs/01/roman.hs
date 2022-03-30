module Roman (toRoman, fromRoman) where

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

value 'I' = 1
value 'V' = 5
value 'X' = 10
value 'L' = 50
value 'C' = 100
value 'D' = 500
value 'M' = 1000

toRoman :: Int -> Maybe String
toRoman x
  | x < 0 || x >= 4000 = Nothing
  | otherwise = Just $ snd $ foldl f (x, "") romanMap
  where
    f (x, rom) (n, symb) = (rem, rom ++ concat (replicate k symb))
      where
        (k, rem) = divMod x n

fromRoman :: String -> Maybe Int
fromRoman str = if Just str == s then Just n else Nothing
  where
    n = convert str
    s = toRoman n
    convert [] = 0
    convert [s] = value s
    convert (s1 : s2 : str)
      | n1 < n2 = n2 - n1 + convert str
      | otherwise = n1 + convert (s2 : str)
      where
        n1 = value s1
        n2 = value s2