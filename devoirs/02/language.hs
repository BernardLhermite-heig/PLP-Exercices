module Language where

type Identifier = String

type Env = [(Identifier, Value)]

data Stmt
  = Def Definition
  | Expr Expr
  deriving (Show)

data Definition = Definition Identifier [Arg] Expr
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

data Arg = Arg Type Identifier
  deriving (Show)

--todo tuple de N
data Value
  = VBool Bool
  | VInteger Int
  | VTuple Expr Expr
  | VFunction Expr [Arg] Env
  deriving (Show)

data Type = TBool | TInteger | TTuple Type Type | TFunction Type [Type] | TAny
  deriving (Show, Eq)