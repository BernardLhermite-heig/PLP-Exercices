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
getStats (file, content) ((t, tw, tl, tb), xs) = (total, stats : xs)
  where
    (w, l, b) = count content
    stats = (file, w, l, b)
    total = (t, tw + w, tl + l, tb + b)

count :: String -> (Int, Int, Int)
count content = (w, l, bytes)
  where
    str = lines content
    bytes = length content
    countWords str = length $ words str
    (w, l) = foldl (\(words, lines) line -> (countWords line + words, succ lines)) (0, 0) str