import Control.Monad
import System.Environment
import Text.Printf (printf)

main :: IO ()
main =
  do
    args <- getArgs
    unless (null args) $
      do
        contents <- mapM readFile args
        let stats = zipWith (\f (w, l, b) -> (f, w, l, b)) args (map count contents)
        let total = foldl (\(f, w, l, b) (_, w', l', b') -> (f, w + w', l + l', b + b')) ("total", 0, 0, 0) stats
        putStrLn (printf "%-10s %5s %5s %5s" "file" "word" "line" "byte")
        mapM_ (putStrLn . printStats) stats
        putStrLn $ printStats total

printStats :: (String, Int, Int, Int) -> String
printStats (file, words, lines, bytes) = printf "%-10s %5d %5d %5d" file words lines bytes

count :: String -> (Int, Int, Int)
count content = (w, l, bytes)
  where
    str = lines content
    bytes = length content
    countWords str = length $ words str
    (w, l) = foldl (\(words, lines) line -> (countWords line + words, succ lines)) (0, 0) str