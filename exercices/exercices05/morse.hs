import Control.Exception
import Control.Monad
import Data.Char
import System.Environment
import System.IO

morse :: Char -> [Char]
morse '0' = "----- "
morse '1' = ".---- "
morse '2' = "..--- "
morse '3' = "...-- "
morse '4' = "....- "
morse '5' = "..... "
morse '6' = "-.... "
morse '7' = "--... "
morse '8' = "---.. "
morse '9' = "----. "
morse 'A' = ".- "
morse 'B' = "-... "
morse 'C' = "-.-. "
morse 'D' = "-.. "
morse 'E' = ". "
morse 'F' = "..-. "
morse 'G' = "--. "
morse 'H' = ".... "
morse 'I' = ".. "
morse 'J' = ".--- "
morse 'K' = "-.- "
morse 'L' = ".-.. "
morse 'M' = "-- "
morse 'N' = "-. "
morse 'O' = "--- "
morse 'P' = ".--. "
morse 'Q' = "--.- "
morse 'R' = ".-. "
morse 'S' = "... "
morse 'T' = "- "
morse 'U' = "..- "
morse 'V' = "...- "
morse 'W' = ".-- "
morse 'X' = "-..- "
morse 'Y' = "-.-- "
morse 'Z' = "--.. "
morse _ = "???"

main :: IO ()
main =
  do
    args <- getArgs
    when (length args == 1) $
      do
        let file = head args
        contents <- readFile file
        putStrLn $ encode contents

encode contents = unwords $ toMorse contents

toMorse :: String -> [String]
toMorse = map (morse . toUpper)