import Control.Exception
import Control.Monad
import Data.Char
import Data.List
import System.Environment
import System.IO

main :: IO ()
main =
  do
    args <- getArgs
    when (length args == 1) $
      do
        let arg = head args
        let str = sort $ group $ arg
        let freq = map (\x -> (head x, length x)) $ group $ sort str
        writeFile arg (concat $ hist freq)

hist = map format

format :: (String, Int) -> String
format (c, n) = c ++ " " ++ replicate n '*' ++ "\n"

-- 109437923954612043294348237