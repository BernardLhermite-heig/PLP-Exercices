{-
: Auteur:   Stéphane Marengo
: Date:     19.06.2022
-}

module Eval (eval, emptyEnv, Env) where

import Language

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
evalDef (Definition id [] expr) env = (id, evalExpr expr env) : env -- Variable / Function sans paramètres
evalDef (Definition id args expr) env = (id, VFunction expr args env) : env -- Function avec paramètres

evalExpr :: Expr -> Env -> Value
evalExpr (EApp id exprs) env = evalApp id exprs env
evalExpr (ELet defs expr) env = evalLet defs expr env
evalExpr (EVar id) env = getValue id env
evalExpr (EValue value) env = value
evalExpr (ECaseOf expr patterns) env = evalCaseOf expr patterns env
evalExpr (EUnary (Operator opType op) expr) env = evalUnary opType op expr env
evalExpr (EBinary (Operator opType op) lhs rhs) env = evalBinary opType op lhs rhs env
evalExpr (EIf cond thenExpr elseExpr) env = evalIf cond thenExpr elseExpr env

evalIf cond thenExpr elseExpr env = case evalExpr cond env of
  VBool True -> evalExpr thenExpr env
  VBool False -> evalExpr elseExpr env
  _ -> throwError "if condition must be a boolean"

evalLet defs expr env = evalExpr expr env'
  where
    env' = foldr evalDef env defs

evalApp id exprs env = case getValue id env of
  VFunction expr args env' -> case exprs of
    [] -> evalExpr expr env
    _ -> evalExpr expr env'
    where
      env' = f env args exprs
      f env ((Arg (TTuple aL aR) id) : args) (expr : exprs) =
        case evalExpr expr env of 
          VTuple l r -> (id, VTuple l r) : matchArg l aL : matchArg r aR : f env args exprs
            where
              v1 = evalExpr l env
              v2 = evalExpr r env
          _ -> throwError "function argument must be a tuple"
      f env (arg : args) (expr : exprs) = matchArg expr arg : f env args exprs
      f env [] [] = env
      f env _ _ = throwError "wrong number of arguments"
      matchArg expr (Arg t id) = (id, evalExpr expr env)
  val -> val

evalUnary _ op expr env =
  case op of
    "-" -> case evalExpr expr env of
      (VInteger i) -> VInteger (- i)
      _ -> throwError "integer expected"
    "!" -> case evalExpr expr env of
      VBool b -> VBool (not b)
      _ -> throwError "boolean expected"
    _ -> throwError $ "unknown operator " ++ op

evalBinary opType op lhs rhs env =
  let v1 = evalExpr lhs env
      v2 = evalExpr rhs env
   in case op of
        op | op `elem` ["+", "-", "*", "/"] -> case (v1, v2) of
          (VInteger i1, VInteger i2) ->
            if op == "/" && i2 == 0
              then throwError "divison by zero"
              else VInteger (toArithm op i1 i2)
          _ -> throwError $ show op ++ " operator applied to non-integer"
        op | op == "==" || op == "!=" -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (toComp op i1 i2)
          (VBool b1, VBool b2) -> VBool (b1 == b2)
          (VTuple l1 r1, VTuple l2 r2) -> evalExpr (EBinary (Operator opType op) (EValue v1) (EValue v2)) env
            where
              v1 = evalExpr (EBinary (Operator opType op) l1 l2) env
              v2 = evalExpr (EBinary (Operator opType op) r1 r2) env
          _ -> throwError $ op ++ " operator applied to non-comparable"
        op | op `elem` ["<", ">", "<=", ">="] -> case (v1, v2) of
          (VInteger i1, VInteger i2) -> VBool (toRel op i1 i2)
          _ -> throwError $ op ++ " operator applied to non-integer"
        op | op `elem` ["&&", "||"] -> case (v1, v2) of
          (VBool b1, VBool b2) -> VBool (toLogic op b1 b2)
          _ -> throwError $ op ++ " operator applied to non-boolean"
        _ -> throwError $ "unknown operator " ++ op

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
  PTuple l r -> case cond of
    VTuple l1 r1 -> matchPattern l (evalExpr l1 env) env && matchPattern r (evalExpr r1 env) env
    _ -> False
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

toComp "==" = (==)
toComp "!=" = (/=)
toComp op = throwError $ "unknown operator " ++ op

toLogic "&&" = (&&)
toLogic "||" = (||)
toLogic op = throwError $ "unknown operator " ++ op

toRel ">" = (>)
toRel "<" = (<)
toRel ">=" = (>=)
toRel "<=" = (<=)
toRel op = throwError $ "unknown operator " ++ op

toArithm "-" = (-)
toArithm "+" = (+)
toArithm "*" = (*)
toArithm "/" = div
toArithm op = throwError $ "unknown operator " ++ op

throwError msg = error ("runtime error: " ++ msg ++ " ")