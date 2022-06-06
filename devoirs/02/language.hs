module Language where

type Identifier = String

data Stmt
  = Def Definition
  | Expr Expr
  deriving (Show)

data Expr
  = EApp Identifier [Expr]
  | ELet [Definition] Expr
  | EVar Identifier
  | EValue Value
  | ECaseOf Expr [(Pattern, Expr)]
  | EUnary Operator Expr
  | EBinary Operator Expr Expr
  deriving (Show)

data Operator = Operator OperatorType String
  deriving (Show)

data OperatorType = Arithmetic | Comparison | Relational | Logical
  deriving (Show)

data Pattern
  = PVar Identifier
  | PValue Value
  | PAny
  deriving (Show)

data Definition = Definition Identifier [Arg] Expr
  deriving (Show)

data Arg = Arg Type Identifier
  deriving (Show)

data Value = VBool Bool | VInteger Int | VTuple Expr Expr
  deriving (Show)

data Type = TBool | TInteger | TTuple Type Type | TAny
  deriving (Show, Eq)