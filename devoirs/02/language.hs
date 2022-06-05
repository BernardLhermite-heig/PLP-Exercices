module Language where

type Identifier = String

data Stmt
  = Def Definition
  | Expr Expr
  deriving Show

data Expr
  = EApp Identifier [Expr]
  | ELet [Definition] Expr
  | EVar Identifier
  | EValue Value
  | ECaseOf Expr [(Pattern, Expr)]
  | EUnary Char Expr
  | EBinary String Expr Expr
  deriving Show

data Pattern
  = PVar Identifier
  | PValue Value
  | PAny
  deriving Show

data Definition
  = Function Identifier [Arg] Expr
  | Variable Identifier Expr
  deriving Show

data Arg = Arg Type Identifier
  deriving Show

data Value = VBool Bool | VInteger Int | VTuple Value Value
  deriving (Show, Eq)

data Type = TBool | TInteger | TTuple Type Type
  deriving (Show, Eq)
