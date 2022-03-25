-- PLP
-- 5. Haskell / IO
-- 25.03.2022

import Control.Monad

{-
: getLine
-}

readln = getLine

{-
getChar
-}

getc = getChar

{-
: do
-}

echo0 =
  do
    getLine
    putStrLn "foo"

{-
: <-
-}

echo1 =
  do
    s1 <- getLine
    s2 <- getLine
    putStrLn (s1 ++ s2)


{-
: loop
-}

echo2 =
  do
    s <- getLine
    putStrLn s
    echo2

{-
: return :: a -> IO a
-}

echo3 =
  do
    s <- getLine
    putStrLn s
    if null s then
      return ()
    else
      echo3

{-
: when :: Bool -> IO a -> IO b
(import Control.Monad)
-}

echo4 =
  do
    s <- getLine
    when (not (null s)) $
      do
        putStrLn s
        echo4

{-
: unless :: Bool -> IO a -> IO b
-}
echo5 =
  do
    s <- getLine
    unless (null s) $
      do
        putStrLn s
        echo5

{-
: let <definition>
-}

echo6 =
  do
    firstname <- getLine
    lastname  <- getLine
    let fullname = firstname ++ " " ++ lastname
        greeting = "Hello"
    putStrLn (greeting ++ " " ++ fullname)

  