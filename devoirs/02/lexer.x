{
module Lexer (lexer, AlexPosn(..), Token(..), TokenPosn(..)) where

}

%wrapper "posn"

$digit = 0-9
$alpha = [a-zA-Z] 
$lowercase = [a-z]
$uppercase = [A-Z]

-- Règles, chaque règle doit spécifier une lambda expression de type [Char] -> Token
tokens :-

  $white+                         ;
  "--".*                          ;
  "behold"                        { tok Behold }
  "summon"                        { tok Summon }
  "with"                          { tok With }
  --that                          { tok That }
  "and"                           { tok AndParam }
  "this"                          { tok This }
  "is"                            { tok Is }
  "("                             { tok LParen }
  ")"                             { tok RParen }
  "and his friend"                { tok AndHisFriend }
  "put that"                      { tok PutThat }
  "into"                          { tok Into }
  "what is"                       { tok WhatIs }
  "?"                             { tok QuestionMark }
  "perhaps"                       { tok Perhaps }
  "who cares"                     { tok WhoCares }
  "which does"                    { tok WhichDoes }
  "neg"                           { tok Neg }
  "not"                           { tok Not }
  "plus"                          { tok Plus }
  "minus"                         { tok Minus }
  "times"                         { tok Mult }
  "split"                         { tok Div }
  "rest"                          { tok Mod }
  "weaker than"                   { tok Lesser }
  "stronger than"                 { tok Greater }
  "as weak as"                    { tok LesserEq }
  "as strong as"                  { tok GreaterEq }
  "same as"                       { tok Eq }
  "different of"                  { tok Neq }
  "both"                          { tok And }
  "either"                        { tok Or }
  "yep"                           { tok Truthy }
  "pasyep"                        { tok Falsy }
  "Integer" | "Boolean"           { \p s -> TokenPosn (Type s) p }
  "suppose"                       { tok Suppose } 
  "then we can conclude"          { tok ThenWeCanConclude }
  "rather than"                   { tok RatherThan }

  $digit+                         { \p s -> TokenPosn (Integer $ read s) p }
  $alpha+                         { \p s -> TokenPosn (Name s) p }
  
  .                               { \p s -> TokenPosn (Error s) p }

{
-- Each right-hand side has type :: AlexPosn -> String -> Token
tok :: Token -> AlexPosn -> String -> TokenPosn
tok ctor p s = TokenPosn ctor p

-- The token type:
data TokenPosn = TokenPosn Token AlexPosn deriving (Eq)

instance Show TokenPosn where
  show (TokenPosn (Error s) (AlexPn _ l c)) 
    = "unkown token " ++ show s ++ " on line " ++ show l ++ ", column " ++ show c
  show (TokenPosn token (AlexPn _ l c)) 
    = show token ++ "(" ++ show l ++ ", " ++ show c ++ ")"

data Token
    = Behold
    | Summon
    | With
    | That
    | AndParam
    | This
    | Is
    | LParen
    | RParen
    | AndHisFriend
    | PutThat
    | Into
    | WhatIs
    | QuestionMark
    | Perhaps
    | WhoCares
    | WhichDoes
    | Neg
    | Not
    | Plus
    | Minus
    | Mult
    | Div
    | Mod
    | Lesser
    | Greater
    | LesserEq
    | GreaterEq
    | Eq
    | Neq
    | And
    | Or
    | Suppose
    | ThenWeCanConclude
    | RatherThan
    | Truthy
    | Falsy
    | Name String    
    | Integer Int
    | Type String

    | Error String
    deriving (Eq, Show)

isError (TokenPosn (Error _) _) = True
isError _ = False

hasErrors ts = if null errors then Nothing else Just errors
  where errors = filter isError ts

lexer s = case errors of
  (Nothing)     -> tokens
  (Just errors) -> error $ "Lexer error:" ++ showErrors errors
  where
    tokens = alexScanTokens s
    errors = hasErrors tokens

showErrors [] = ""
showErrors (e:es) = "\n\t-" ++ show e ++ showErrors es
}