module Expr where

data Expr
  = Const Int
  | Sum Expr Expr
  | Prod Expr Expr

instance Show Expr where
  show (Const x) = show x
  show (Sum a b) = "(" ++ show a ++ " + " ++ show b ++ ")"
  show (Prod a b) = "(" ++ show a ++ " * " ++ show b ++ ")"

eval :: Expr -> Int
eval (Const a) = a
eval (Sum a b) = eval a + eval b
eval (Prod a b) = eval a * eval b

-- expr = Prod (Sum (Const 1) (Const 2)) (Const 5)