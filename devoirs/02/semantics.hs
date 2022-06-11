--module Semantics (typeof) where
module Semantics where

import Language

type TEnv = [(Identifier, Type)]

emptyTEnv :: TEnv
emptyTEnv = []

getType :: Identifier -> TEnv -> Type
getType x env = case lookup x env of
  Just t -> t
  Nothing -> throwError $ "identifier " ++ x ++ " not found"

typeof :: Stmt -> TEnv -> (Type, TEnv)
typeof (Def def) env = typeofDef def env
typeof (Expr expr) env = (typeofExpr expr env, env)

addToEnv :: Definition -> TEnv -> TEnv
addToEnv (Definition id [] expr) env = (id, typeofExpr expr env) : env -- Variables
addToEnv (Definition id args expr) env = (id, TFunction (typeofExpr expr env') args') : env -- Fonctions
  where
    -- Ajout des éventuels arguments TODO TFunc si argument il y a
    env' = foldl (\env (Arg t id) -> (id, t) : env) env args
    args' = map (\(Arg t id) -> t) args

addAllToEnv :: [Definition] -> TEnv -> TEnv
addAllToEnv defs env = foldr addToEnv env defs

typeofDef :: Definition -> TEnv -> (Type, TEnv)
typeofDef def@(Definition id args expr) env = (typeofExpr expr env', env')
  where
    env' = addToEnv def env

typeofExpr :: Expr -> TEnv -> Type
typeofExpr (EApp id args) env =
  case lookup id env of
    Just (TFunction t args') ->
      if (length args == length args') && all (\(t, a) -> t == typeofExpr a env) (zip args' args)
        then t
        else error "Type error: params of function invalid"
    _ -> error "Type error: call to unknown function"
typeofExpr (EIf x y z) env =
  case (typeofExpr x env, t1, t2) of
    (TBool, t1, t2) | t1 == t2 -> t1
    _ -> throwError $ "both branches must have the same type: t1 = " ++ show t1 ++ ", t2 = " ++ show t2
  where
    t1 = typeofExpr y env
    t2 = typeofExpr z env
typeofExpr (ELet defs expr) env = typeofExpr expr env'
  where
    env' = addAllToEnv defs env
typeofExpr (EVar id) env = getType id env
typeofExpr (EValue value) env = typeofValue value env
typeofExpr (ECaseOf expr cases) env =
  if any (\(c, e) -> (c /= caseType && c /= TAny) || e /= exprType) caseTypes
    then throwError "case types do not match"
    else exprType
  where
    condType = typeofExpr expr env -- Augmenter env de expr si PVar
    caseTypes = map f cases
    caseType = fst $ head caseTypes -- si TAny premier type
    exprType = snd $ head caseTypes
    f (PVar id, expr) = (condType, typeofExpr expr ((id, condType) : env))
    f (pattern, expr) = (typeofPattern pattern env, typeofExpr expr env)
typeofExpr (EUnary (Operator opType op) expr) env =
  let t = typeofExpr expr env
   in case opType of
        Arithmetic | op == "-" ->
          case t of
            TInteger -> t
            _ -> throwError "unary minus on non-integer"
        Logical | op == "!" ->
          case t of
            TBool -> t
            _ -> throwError "unary not on non-bool"
        _ -> throwError $ "undefined operator" ++ op
typeofExpr (EBinary (Operator opType op) lhs rhs) env =
  let t1 = typeofExpr lhs env
      t2 = typeofExpr rhs env
   in case opType of
        Arithmetic | op `elem` ["+", "-", "*", "/"] ->
          case (t1, t2) of
            (TInteger, TInteger) -> TInteger
            _ -> throwError $ "arithmetic operator on non-integer" ++ op
        Logical | op `elem` ["&&", "||"] ->
          case (t1, t2) of
            (TBool, TBool) -> TBool
            _ -> throwError $ "logical operator on non-bool" ++ op
        Comparison | op `elem` ["==", "!="] ->
          case (t1, t2) of
            (t1, t2) -> TBool
        Relational | op `elem` ["<", ">", "<=", ">="] ->
          case (t1, t2) of
            (TInteger, TInteger) -> TBool
            _ -> throwError $ "relational operator on non-integer" ++ op
        _ -> throwError $ "undefined operator" ++ op

typeofValue :: Value -> TEnv -> Type
typeofValue (VInteger _) env = TInteger
typeofValue (VBool _) env = TBool
typeofValue (VTuple l r) env = TTuple (typeofExpr l env) (typeofExpr r env)
typeofValue _ env = error "not implemented"

typeofPattern :: Pattern -> TEnv -> Type
typeofPattern (PVar id) env = getType id env
typeofPattern (PValue value) env = typeofValue value env
typeofPattern (PTuple l r) env = TTuple (typeofPattern l env) (typeofPattern r env)
typeofPattern PAny env = TAny

throwError msg = error ("type error: " ++ msg ++ " ")