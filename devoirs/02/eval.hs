module Eval (eval, emptyEnv, Env) where

import Language
import Semantics

emptyEnv :: Env
emptyEnv = []

value :: Identifier -> Env -> Value
value id env = case lookup id env of
  Nothing -> error ("undefined variable: " ++ id)
  Just v -> v

eval :: Stmt -> Env -> Either Env Value
eval (Def def) env = Left $ evalDef def env
eval (Expr expr) env = Right $ evalExpr expr env

evalDef :: Definition -> Env -> Env
evalDef (Definition id args expr) env = case args of
  [] -> (id, evalExpr expr env) : env -- Variable / Function sans paramètres
  _ -> (id, VFunction expr args env) : env -- Function avec paramètres

areValueEqual :: Value -> Value -> Env -> Bool
areValueEqual (VBool a) (VBool b) env = a == b
areValueEqual (VInteger a) (VInteger b) env = a == b
areValueEqual (VTuple l1 r1) (VTuple l2 r2) env = l && r
  where
    l = areValueEqual (evalExpr l1 env) (evalExpr l1 env) env
    r = areValueEqual (evalExpr r1 env) (evalExpr r2 env) env
areValueEqual _ _ _ = False

matchPattern :: Env -> Pattern -> Value -> Bool
matchPattern env pattern cond = case pattern of
  PVar id | areValueEqual (value id env) cond env -> True
  PValue val | areValueEqual val cond env -> True
  PAny -> True
  _ -> False

evalExpr :: Expr -> Env -> Value
evalExpr e@(EApp id exprs) env = case value id env of
  VFunction expr args env' -> case exprs of -- TODO fix les tuples
    [] -> evalExpr expr env
    _ -> evalExpr expr env'
    where
      env' = zipWith matchArg exprs args ++ env
      matchArg expr (Arg t id) -- TODO type auto?
        | tVal == t = (id, val)
        | otherwise = error ("type mismatch: excepted " ++ show t ++ ", actual " ++ show tVal)
        where
          val = evalExpr expr env
          tVal = typeof (Expr $ EValue val) []
  val -> val
evalExpr (ELet defs expr) env = evalExpr expr env'
  where
    env' = foldr evalDef env defs
evalExpr (EVar id) env = value id env
evalExpr (EValue value) env = value
evalExpr (ECaseOf expr patterns) env = evalExpr body env
  where
    cond = evalExpr expr env
    (pattern, body) = head $ filter (\(p, _) -> matchPattern env p cond) patterns
evalExpr (EUnary (Operator _ op) expr) env =
  case op of
    "-" -> case evalExpr expr env of
      (VInteger i) -> VInteger (- i)
      _ -> error "runtime error: integer expected"
    "!" -> case evalExpr expr env of
      VBool b -> VBool (not b)
      _ -> error "runtime error: boolean expected"
    _ -> error $ "runtime error: unknown operator " ++ op
evalExpr (EBinary (Operator opType op) lhs rhs) env =
  let v1 = evalExpr lhs env
      v2 = evalExpr rhs env
   in case op of
        op | op `elem` ["+", "-", "*", "/"] -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VInteger (operatorArithm op i1 i2)
          _ -> error "runtime error: integer expected"
        op | op == "==" || op == "!=" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (operatorComp op i1 i2)
          (VBool b1, VBool b2) -> VBool (b1 == b2)
          (VTuple l1 r1, VTuple l2 r2) -> evalExpr (EBinary (Operator opType op) (EValue v1) (EValue v2)) env
            where
              v1 = evalExpr (EBinary (Operator opType op) l1 l2) env
              v2 = evalExpr (EBinary (Operator opType op) l2 r2) env
          _ -> error "runtime error: integer or boolean expected"
        "<" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (i1 < i2)
          _ -> error "runtime error: integer expected"
        ">" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (i1 > i2)
          _ -> error "runtime error: integer expected"
        "<=" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (i1 <= i2)
          _ -> error "runtime error: integer expected"
        ">=" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (i1 >= i2)
          _ -> error "runtime error: integer expected"
        "&&" -> case (v1, v2) of
          (VBool b1, VBool b2) -> VBool (b1 && b2)
          _ -> error "runtime error: boolean expected"
        "||" -> case (v1, v2) of
          (VBool b1, VBool b2) -> VBool (b1 || b2)
          _ -> error "runtime error: boolean expected"
        _ -> error $ "runtime error: unknown operator " ++ op


operatorComp "==" = (==)
operatorComp "!=" = (/=)
operatorComp _ = error "runtime error: unknown operator"

operatorArithm "-" = (-)
operatorArithm "+" = (+)
operatorArithm "*" = (*)
operatorArithm "/" = div
operatorArithm _ = error "runtime error: unknown operator"