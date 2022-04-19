import Control.Monad
import Data.Char
import Data.List
import System.Environment

data Token
  = Number String
  | String String
  | Boolean Bool
  | Null
  | StartArray Char
  | EndArray Char
  | StartObject Char
  | EndObject Char
  | Comma Char
  | Colon Char
  deriving (Show)

strip prefix cs = case stripPrefix prefix cs of
  Just str -> (True, str)
  Nothing -> (False, cs)

spanEnd :: (a -> Bool) -> [a] -> ([a], [a])
spanEnd p [] = ([], [])
spanEnd p (x : xs) =
  if p x
    then (x : ys, zs)
    else ([], xs)
  where
    (ys, zs) = spanEnd p xs

lexer :: [Char] -> [Token]
lexer [] = []
lexer (c : cs) =
  case c of
    c
      | isDigit c -> token Number isDigit (c : cs)
      | isSpace c -> lexer cs
    '[' -> StartArray c : lexer cs
    ']' -> EndArray c : lexer cs
    '{' -> StartObject c : lexer cs
    '}' -> EndObject c : lexer cs
    ',' -> Comma c : lexer cs
    ':' -> Colon c : lexer cs
    '"' -> String str : lexer rest
      where
        (str, rest) = spanEnd (/= '"') cs
    'n' -> case strip "ull" cs of
      (True, rest) -> Null : lexer rest
      (False, _) -> error "Invalid JSON"
    't' -> case strip "rue" cs of
      (True, rest) -> Boolean True : lexer rest
      (False, _) -> error "Invalid JSON"
    'f' -> case strip "alse" cs of
      (True, rest) -> Boolean False : lexer rest
      (False, _) -> error "Invalid JSON"
    _ -> error "Invalid JSON"

token :: (String -> Token) -> (Char -> Bool) -> String -> [Token]
token constructor filter cs = constructor token : lexer rest
  where
    (token, rest) = span filter cs

usage :: IO ()
usage = putStrLn "usage: json <file.json>"

main :: IO ()
main =
  do
    args <- getArgs
    if length args /= 1
      then usage
      else do
        content <- readFile $ head args
        -- print content
        print $ lexer content

testStr = "{ \"str\" : [ 123, true, null ] }"