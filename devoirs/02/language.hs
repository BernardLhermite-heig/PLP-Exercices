{-
: Auteur:   Stéphane Marengo
: Date:     19.06.2022
-}

module Language where

import Data.List

type Identifier = String

type Env = [(Identifier, Value)]

type TEnv = [(Identifier, Type)]

data Stmt
  = Def Definition
  | Expr Expr
  deriving (Show)

data Definition
  = Definition Identifier [Arg] Expr
  deriving (Show)

data Expr
  = EApp Identifier [Expr]
  | ELet [Definition] Expr
  | EVar Identifier
  | EValue Value
  | ECaseOf Expr [(Pattern, Expr)]
  | EUnary Operator Expr
  | EBinary Operator Expr Expr
  | EIf Expr Expr Expr

data Operator = Operator OperatorType String
  deriving (Show)

data OperatorType = Arithmetic | Comparison | Relational | Logical
  deriving (Show)

data Pattern
  = PVar Identifier
  | PValue Value
  | PTuple Pattern Pattern
  | PAny
  deriving (Show)

data Arg = Arg Type Identifier
  deriving (Show)

instance Eq Arg where
  (==) (Arg t1 _) (Arg t2 _) = t1 == t2

data Value
  = VBool Bool
  | VInteger Int
  | VTuple Expr Expr
  | VFunction Expr [Arg] Env

data Type
  = TBool
  | TInteger
  | TTuple Arg Arg
  | TFunction Type [Type]
  | TAny
  deriving (Eq)

instance Show Expr where
  show (EValue v) = show v
  show _ = "pas nécessaire normalement"

instance Show Value where
  show (VBool b) = show b
  show (VInteger i) = show i
  show (VTuple e1 e2) = "(" ++ show e1 ++ "," ++ show e2 ++ ")"
  show (VFunction e args env) = splitWithArrow e args

instance Show Type where
  show TBool = "Boolean"
  show TInteger = "Integer"
  show (TTuple t1 t2) = "(" ++ show t1 ++ "," ++ show t2 ++ ")"
  show (TFunction t1 ts) = splitWithArrow t1 ts
  show TAny = "Any"

splitWithArrow y xs = foldl (\acc t -> show t ++ " -> " ++ acc) "" xs ++ show y