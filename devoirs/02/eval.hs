module Eval (eval, emptyEnv, Env) where

import Language
import Semantics hiding (throwError)

emptyEnv :: Env
emptyEnv = []

getValue :: Identifier -> Env -> Value
getValue id env = case lookup id env of
  Nothing -> throwError $ "undefined variable: " ++ id
  Just v -> v

eval :: Stmt -> Env -> Either Env Value
eval (Def def) env = Left $ evalDef def env
eval (Expr expr) env = Right $ evalExpr expr env

evalDef :: Definition -> Env -> Env
evalDef (Definition id args expr) env = case args of
  [] -> (id, evalExpr expr env) : env -- Variable / Function sans paramètres
  _ -> (id, VFunction expr args env) : env -- Function avec paramètres

areValueEqual :: Value -> Value -> Env -> Bool
areValueEqual (VBool a) (VBool b) _ = a == b
areValueEqual (VInteger a) (VInteger b) _ = a == b
areValueEqual (VTuple l1 r1) (VTuple l2 r2) env = l && r
  where
    l = areValueEqual (evalExpr l1 env) (evalExpr l1 env) env
    r = areValueEqual (evalExpr r1 env) (evalExpr r2 env) env
areValueEqual _ _ _ = False

matchPattern :: Pattern -> Value -> Env -> Bool
matchPattern pattern cond env = case pattern of
  PVar id -> case lookup id env of
    Nothing -> False
    Just v -> True
  PValue val | areValueEqual val cond env -> True
  PAny -> True
  _ -> False

evalCaseOf expr cases env = case matchingCases of
  [] -> throwError $ "no matching case for: " ++ show expr
  _ -> evalExpr body (localEnv ++ env)
    where
      (_, body) = head matchingCases
  where
    cond = evalExpr expr env
    localEnv = [(id, cond) | (PVar id, _) <- cases]
    matchingCases = filter (\(p, _) -> matchPattern p cond localEnv) cases

evalExpr :: Expr -> Env -> Value
evalExpr e@(EApp id exprs) env = case getValue id env of
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
          (tVal, _) = typeof (Expr $ EValue val) []
  val -> val
evalExpr (ELet defs expr) env = evalExpr expr env'
  where
    env' = foldr evalDef env defs
evalExpr (EVar id) env = getValue id env
evalExpr (EValue value) env = value
evalExpr (ECaseOf expr patterns) env = evalCaseOf expr patterns env
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
          (VInteger i1, VInteger i2) ->
            if op == "/" && i2 == 0
              then throwError "divide by zero"
              else VInteger (toArithm op i1 i2)
          _ -> error "runtime error: integer expected"
        op | op == "==" || op == "!=" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (toComp op i1 i2)
          (VBool b1, VBool b2) -> VBool (b1 == b2)
          (VTuple l1 r1, VTuple l2 r2) -> evalExpr (EBinary (Operator opType op) (EValue v1) (EValue v2)) env
            where
              v1 = evalExpr (EBinary (Operator opType op) l1 l2) env
              v2 = evalExpr (EBinary (Operator opType op) r1 r2) env
          _ -> error "runtime error: integer or boolean expected"
        op | op `elem` ["<", ">", "<=", ">="] -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (toComp op i1 i2)
          _ -> error "runtime error: integer expected"
        op | op `elem` ["&&", "||"] -> case (v1, v2) of
          (VBool b1, VBool b2) -> VBool (toLogic op b1 b2)
          _ -> error "runtime error: boolean expected"
        _ -> error $ "runtime error: unknown operator " ++ op
evalExpr (EIf cond thenExpr elseExpr) env = error "not implemented"

toComp "==" = (==)
toComp "!=" = (/=)
toComp _ = error "runtime error: unknown operator"

toLogic "&&" = (&&)
toLogic "||" = (||)
toLogic _ = error "runtime error: unknown operator"

toRel ">" = (>)
toRel "<" = (<)
toRel ">=" = (>=)
toRel "<=" = (<=)
toRel _ = error "runtime error: unknown operator"

toArithm "-" = (-)
toArithm "+" = (+)
toArithm "*" = (*)
toArithm "/" = div
toArithm _ = error "runtime error: unknown operator"

throwError msg = error ("runtime error: " ++ msg ++ " ")