-- PLP
-- 5. Haskell / IO
-- 25.03.2022

import System.Environment
import Data.Char

{-
: getArgs
import System.Environment
-}

usage = putStrLn "usage: live05d <sentence>"

encode xs = map ord xs

main =
  do
    args <- getArgs
    if length args /= 1 then
      usage
    else
      do
        let sentence = head args
            cipher = encode sentence
        print cipher
