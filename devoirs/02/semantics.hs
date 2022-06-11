--module Semantics (typeof) where
module Semantics where

import Language

type TEnv = [(Identifier, Type)]

emptyTEnv :: TEnv
emptyTEnv = []

typeof :: Stmt -> TEnv -> (Type, TEnv)
typeof (Def def) env = typeofDef def env
typeof (Expr expr) env = (typeofExpr expr env, env)

typeofDef :: Definition -> TEnv -> (Type, TEnv)
typeofDef def@(Definition id args expr) env = (getType id env', env')
  where
    env' = addToEnv def env

-- typeofDef :: Definition -> TEnv -> (Type, TEnv)
-- typeofDef (Definition id [] expr) env = (typeofExpr expr env, env)
-- typeofDef (Definition id ((Arg type' name) : args) body) env = typeofDef (Definition id args body) env'
--   where
--     env' = (name, type') : env

addToEnv :: Definition -> TEnv -> TEnv
addToEnv (Definition id [] expr) env = (id, typeofExpr expr env) : env -- Variables
addToEnv (Definition id args expr) env = (id, TFunction (typeofExpr expr env') args') : env -- Fonctions
  where
    env' = foldl (\env (Arg t id) -> (id, t) : env) env args
    args' = map (\(Arg t id) -> t) args

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
    if (length args == length args') && all (\(t, a) -> t == typeofExpr a env) (zip args' args)
      then t
      else throwError "params of function invalid"
  Just t -> t
  Nothing -> throwError "call to unknown function"

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
typeofValue (VTuple l r) env = TTuple (typeofExpr l env) (typeofExpr r env)
typeofValue _ env = error "not implemented" -- TODO ?

typeofPattern :: Pattern -> TEnv -> Type
typeofPattern (PVar id) env = getType id env
typeofPattern (PValue value) env = typeofValue value env
typeofPattern (PTuple l r) env = TTuple (typeofPattern l env) (typeofPattern r env)
typeofPattern PAny env = TAny

throwError msg = error ("type error: " ++ msg ++ " ")

getType :: Identifier -> TEnv -> Type
getType x env = case lookup x env of
  Just t -> t
  Nothing -> throwError $ "identifier " ++ x ++ " not found"

-- Tests
-- :t this x is yep
-- :t behold x with Integer y which does 3
-- :t behold x with Integer y which does y times 3
-- :t behold x with Integer y and Integer z which does y times z
-- :t behold x with Integer y and Integer z which does y same as z

-- :t (1 and his friend yep)
-- :t (1 and his friend (yep and his friend 4))

-- :t put that this x is 2 and this y is 3 into x times y times 2

-- :t put that behold x with Integer z which does z plus 2 and this y is 3 into summon x with 3 times y times 2
-- doit throw v
-- :t put that behold x with Integer z which does z plus 2 and this y is 3 into summon x times y times 2

-- :t put that behold x which does 2 plus 2 and this y is 3 into summon z with 3
-- :t put that behold x which does 2 plus 2 and this y is 3 into summon x
-- :t put that behold x with Integer z which does z plus 2 and this y is 3 into summon x with 3
-- :t put that behold x with Integer z which does z plus 2 and this y is 3 into summon x with yep

-- :t what is 3 times 3 ? perhaps 6 which does yep perhaps 2 which does pasyep perhaps x which does pasyep
-- :t what is 3 times 3 ? perhaps 6 which does yep perhaps 2 which does pasyep perhaps x which does pasyep perhaps who cares which does yep
-- :t what is 3 times 3 ? perhaps who cares which does yep perhaps 6 which does yep perhaps 2 which does pasyep perhaps x which does pasyep