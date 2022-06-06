module Eval (eval) where

import Language

type Env = [(Identifier, Value)]

value :: Identifier -> Env -> Value
value id env = case lookup id env of
  Nothing -> error ("undefined variable: " ++ id)
  Just v -> v

eval :: Stmt -> Env -> Either Env Value
eval (Def def) env = Left $ evalDef def env
eval (Expr expr) env = Right $ evalExpr expr env

evalDef :: Definition -> Env -> Env
evalDef (Definition id args expr) env = error "not implemented" --(id, result) : env

evalExpr :: Expr -> Env -> Value
evalExpr (EApp id exprs) env = error "not implemented"
evalExpr (ELet defs expr) env = error "not implemented"
evalExpr (EVar id) env = value id env
evalExpr (EValue value) env = value
evalExpr (ECaseOf expr patterns) env = error "not implemented"
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
        "+" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VInteger (i1 + i2)
          _ -> error "runtime error: integer expected"
        "-" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VInteger (i1 - i2)
          _ -> error "runtime error: integer expected"
        "*" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VInteger (i1 * i2)
          _ -> error "runtime error: integer expected"
        "/" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VInteger (i1 `div` i2)
          _ -> error "runtime error: integer expected"
        op | op == "==" || op == "!=" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (i1 == i2)
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