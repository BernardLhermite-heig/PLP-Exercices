module Language where

import Data.List

-- Expr (ELet [Definition "y" [] (EValue (VBool True)),Definition "x" [] (EValue (VInteger 5))] (EVar "y"))
-- Def (Definition "swag" [Arg TBool "y",Arg TInteger "x"] (EVar "x"))
-- Expr (EValue (VTuple (EValue (VInteger 5)) (EValue (VBool True))))
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
  deriving (Show)

-- behold swag with Integer x which does 1 plus x
-- summon swag with 5
-- EApp "swag" [EValue (VInteger 5)]
-- put that behold x with Integer z which does z plus 1 and this y is 2 into x plus y
{-
:> behold swag with Integer x which does 1 plus x
> summon swag with 5
EApp "swag" [EValue (VInteger 5)] VFunction (EBinary (Operator Arithmetic "+") (EValue (VInteger 1)) (EVar "x")) [Arg TInteger "x"] []
-}
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
  | TTuple Type Type
  | TFunction Type [Type]
  | TAny
  deriving (Eq)

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