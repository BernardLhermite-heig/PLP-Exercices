-- PLP
-- 5. Haskell / IO
-- 25.03.2022

{-
: IO action
-}

{-
: putStr
-}

println s = putStr (s ++ "\n")

{-
: putChar
-}
printc c = putChar c

{-
: print
-}

data Boolean = Truthy | Falsy
  deriving (Show)

-- print Truthy => Truthy