module Language where

-- Expr (ELet [Definition "y" [] (EValue (VBool True)),Definition "x" [] (EValue (VInteger 5))] (EVar "y"))
-- Def (Definition "swag" [Arg TBool "y",Arg TInteger "x"] (EVar "x"))
-- Expr (EValue (VTuple (EValue (VInteger 5)) (EValue (VBool True))))
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

--todo tuple de N
data Value
  = VBool Bool
  | VInteger Int
  | VTuple Expr Expr
  | VFunction Expr [Arg] Env
  deriving (Show)

data Type = TBool | TInteger | TTuple Type Type | TFunction Type [Type] | TAny
  deriving (Show, Eq)