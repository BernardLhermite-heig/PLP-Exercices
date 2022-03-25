-- PLP
-- 5. Haskell / IO
-- 25.03.2022
import Control.Exception

{-
: maybe
-}

search k ((k', v):kvs)
  | k == k'   = Just v
  | otherwise = search k kvs
search _ []   = Nothing

{-
: 
-}

search' k ((k', v):kvs)
  | k == k'   = v
  | otherwise = search' k kvs
search' _ []  = error "not found"

{-
: exception
-- import Control.Exception
-}

data MyException = KeyNotFound
  deriving(Show)

instance Exception MyException

{-
: throw
-}

search'' k ((k', v):kvs)
  | k == k'   = v
  | otherwise = search'' k kvs
search'' _ []  = throw KeyNotFound

{-
: catch
-}

data MyWeirdException = GotZeroError | GotOneError
  deriving (Show)

instance Exception MyWeirdException

dangerous n = catch (something n) catcher
  where
    something :: Int -> IO ()
    something 0 = throw GotZeroError
    something 1 = throw GotOneError
    something _ = putStrLn "everything is fine"
    catcher :: MyWeirdException -> IO ()
    catcher GotZeroError = putStrLn "Error: got 0"
    catcher GotOneError  = putStrLn "Error: got 1"

-- cf équivalent en Java