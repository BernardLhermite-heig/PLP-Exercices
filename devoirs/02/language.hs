module Language where

type Identifier = String

data Stmt
  = Def Definition
  | Expr Expr

data Expr
  = EApp Identifier [Expr]
  | ELet [Definition] Expr
  | EVar Identifier
  | EValue Value
  | ECaseOf Expr [(Pattern, Expr)]
  | EUnary Char Expr
  | EBinary Char Expr Expr

data Pattern
  = PVar Identifier
  | PValue Value
  | PAny

data Definition
  = Function Identifier [Arg] Expr
  | Variable Identifier Expr

data Arg = Arg Type Identifier

data Value = VBool Bool | VInteger Int | VTuple Value Value
  deriving (Show, Eq)

data Type = TBool | TInteger | TTuple Type Type
  deriving (Show, Eq)
