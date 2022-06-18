module Semantics (typeof, emptyTEnv, TEnv) where

import Language

emptyTEnv :: TEnv
emptyTEnv = []

typeof :: Stmt -> TEnv -> (Type, TEnv)
typeof (Def def) env = typeofDef def env
typeof (Expr expr) env = (typeofExpr expr env, env)

typeofDef :: Definition -> TEnv -> (Type, TEnv)
typeofDef def@(Definition id args expr) env = (getType id env', env')
  where
    env' = addToEnv def env

addToEnv :: Definition -> TEnv -> TEnv
addToEnv (Definition id [] expr) env = (id, typeofExpr expr env) : env -- Variables
addToEnv (Definition id args expr) env = (id, TFunction (typeofExpr expr env') args') : env -- Fonctions
  where
    env' = foldl f env args
    args' = map (\(Arg t id) -> t) args
    f env (Arg (TTuple t1 t2) id) = (id, TTuple t1 t2) : f (f env t2) t1 -- TODO renommer f
    f env (Arg t id) = (id, t) : env -- TODO throw si argument dupliqué

addAllToEnv :: [Definition] -> TEnv -> TEnv
addAllToEnv defs env = foldr addToEnv env defs

typeofExpr :: Expr -> TEnv -> Type
typeofExpr (EApp id args) env = typeofApp id args env
typeofExpr (EIf x y z) env = typeofIf x y z env
typeofExpr (ELet defs expr) env = typeofLet defs expr env
typeofExpr (EVar id) env = typeofVar id env
typeofExpr (EValue value) env = typeofValue value env
typeofExpr (ECaseOf expr cases) env = typeofCaseOf expr cases env
typeofExpr (EUnary (Operator opType op) expr) env = typeofUnary opType op expr env
typeofExpr (EBinary (Operator opType op) lhs rhs) env = typeofBinary opType op lhs rhs env

typeofApp id args env = case lookup id env of
  Just (TFunction t args') ->
    maybe t throwError (hasArgsError args' args)
  Just t -> t
  Nothing -> throwError "call to unknown function"
  where
    hasArgsError [] [] = Nothing
    hasArgsError (e : excepteds) (a : actuals) =
      if e == aType
        then hasArgsError excepteds actuals
        else Just $ "wrong type of argument in application of function " ++ id ++ ": expected " ++ show e ++ " got " ++ show aType
      where
        aType = typeofExpr a env
    hasArgsError _ _ = Just $ "wrong number of arguments in application of function " ++ id

typeofIf x y z env = case (typeofExpr x env, t1, t2) of
  (TBool, t1, t2) | t1 == t2 -> t1
  _ -> throwError $ "both branches must have the same type: t1 = " ++ show t1 ++ ", t2 = " ++ show t2
  where
    t1 = typeofExpr y env
    t2 = typeofExpr z env

typeofLet defs expr env = typeofExpr expr env'
  where
    env' = addAllToEnv defs env

typeofVar = getType

typeofCaseOf expr cases env =
  if any (\(c, e) -> (c /= condType && c /= TAny) || e /= exprType) caseTypes
    then throwError "case types do not match"
    else exprType
  where
    condType = typeofExpr expr env -- Augmenter env de expr si PVar
    caseTypes = map f cases
    exprType = snd $ head caseTypes
    f (PVar id, expr) = (condType, typeofExpr expr ((id, condType) : env))
    f (pattern, expr) = (typeofPattern pattern env, typeofExpr expr env)

typeofUnary opType op expr env =
  let t = typeofExpr expr env
      throwError' = throwError $ "unary operator " ++ op ++ " cannot be applied to type " ++ show t
   in case opType of
        Arithmetic | op == "-" ->
          case t of
            TInteger -> t
            _ -> throwError'
        Logical | op == "!" ->
          case t of
            TBool -> t
            _ -> throwError'
        _ -> throwError $ "undefined operator" ++ op

typeofBinary opType op lhs rhs env =
  let t1 = typeofExpr lhs env
      t2 = typeofExpr rhs env
      throwError' = throwError $ show opType ++ " operator " ++ op ++ " cannot be applied to types " ++ show t1 ++ " and " ++ show t2
   in case opType of
        Arithmetic | op `elem` ["+", "-", "*", "/"] ->
          case (t1, t2) of
            (TInteger, TInteger) -> TInteger
            _ -> throwError'
        Logical | op `elem` ["&&", "||"] ->
          case (t1, t2) of
            (TBool, TBool) -> TBool
            _ -> throwError'
        Comparison | op `elem` ["==", "!="] ->
          case (t1, t2) of
            (t1, t2) -> TBool
        Relational | op `elem` ["<", ">", "<=", ">="] ->
          case (t1, t2) of
            (TInteger, TInteger) -> TBool
            _ -> throwError'
        _ -> throwError $ "undefined operator" ++ op

typeofValue :: Value -> TEnv -> Type
typeofValue (VInteger _) env = TInteger
typeofValue (VBool _) env = TBool
typeofValue (VTuple l r) env = TTuple (Arg (typeofExpr l env) "") (Arg (typeofExpr r env) "")
typeofValue _ env = error "not implemented" -- TODO ?

typeofPattern :: Pattern -> TEnv -> Type
typeofPattern (PVar id) env = getType id env
typeofPattern (PValue value) env = typeofValue value env
typeofPattern (PTuple l r) env = TTuple (Arg (typeofPattern l env) "") (Arg (typeofPattern r env) "")
typeofPattern PAny env = TAny

throwError msg = error ("type error: " ++ msg ++ " ")

getType :: Identifier -> TEnv -> Type
getType x env = case lookup x env of
  Just t -> t
  Nothing -> throwError $ "identifier " ++ x ++ " not found"