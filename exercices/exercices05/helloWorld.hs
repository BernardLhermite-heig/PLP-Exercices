import System.Environment

usage = putStrLn "usage: helloWorld -[en/fr/it/es/de]"

lang (_ : arg) = case arg of
  "fr" -> "bonjourmonde"
  "it" -> "helloworld en italien"
  "es" -> "helloworld en espagnol"
  "de" -> "helloworld en allemand"
  _ -> "helloworld"

main =
  do
    args <- getArgs
    if length args /= 1
      then usage
      else print $ lang $ head args
