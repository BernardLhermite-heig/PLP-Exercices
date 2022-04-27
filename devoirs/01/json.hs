{-
: Auteur: Stéphane Marengo
: Date: 27.04.2022
-}

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

tryStrip :: String -> String -> (Bool, String)
tryStrip prefix cs = case stripPrefix prefix cs of
  Just str -> (True, str)
  Nothing -> (False, cs)

spanWithoutEndCharacters :: (Char -> Bool) -> String -> (String, String)
spanWithoutEndCharacters p [] = ([], [])
spanWithoutEndCharacters p (x : xs)
  | p x = (x : ys, zs)
  | otherwise = ([], xs)
  where
    (ys, zs) = spanWithoutEndCharacters p xs

lexer :: String -> [Token]
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
        (str, rest) = spanWithoutEndCharacters (/= '"') cs
    'n' -> customStrip "ull" Null
    't' -> customStrip "rue" (Boolean True)
    'f' -> customStrip "alse" (Boolean False)
    _ -> invalid
  where
    invalid = error "Invalid JSON"
    customStrip suffix d = case tryStrip suffix cs of
      (True, rest) -> d : lexer rest
      (False, _) -> invalid

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
        print $ lexer content