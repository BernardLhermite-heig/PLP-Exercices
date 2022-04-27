{-
: Auteur: Stéphane Marengo
: Date: 27.04.2022
-}

import Control.Monad
import System.Environment
import Text.Printf (printf)

usage :: IO ()
usage = putStrLn "usage: word <file> [<file> ...]"

main :: IO ()
main =
  do
    args <- getArgs
    if null args
      then usage
      else do
        contents <- mapM readFile args
        let files = zip args contents
            stats = foldr getStats (("total", 0, 0, 0), []) files

        printStats stats

printStats :: ((String, Int, Int, Int), [(String, Int, Int, Int)]) -> IO ()
printStats (total, xs) = do
  printf "%-10s %5s %5s %5s\n" "file" "word" "line" "byte"
  mapM_ format xs
  format total
  where
    format (f, w, l, b) = printf "%-10s %5d %5d %5d\n" f w l b

getStats :: (String, String) -> ((String, Int, Int, Int), [(String, Int, Int, Int)]) -> ((String, Int, Int, Int), [(String, Int, Int, Int)])
getStats (file, content) ((totalStr, totalWords, totalLines, totalBytes), stats) = (total, stat : stats)
  where
    (nWords, nLines, nBytes) = count content
    stat = (file, nWords, nLines, nBytes)
    total = (totalStr, totalWords + nWords, totalLines + nLines, totalBytes + nBytes)

count :: String -> (Int, Int, Int)
count content = (nWords, nLines, nBytes)
  where
    lines' = lines content
    nBytes = length content
    countWords str = length $ words str
    (nWords, nLines) = foldl (\(words, lines) line -> (countWords line + words, succ lines)) (0, 0) lines'