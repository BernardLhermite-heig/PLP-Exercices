module Semantics (typeof) where

import Language hiding (Env)

type Env = [(Identifier, Type)]

getType :: Identifier -> Env -> Type
getType x env = case lookup x env of
  Just t -> t
  Nothing -> error $ x ++ " not found"

typeof :: Stmt -> Env -> Type
typeof (Def def) env = typeofDef def env
typeof (Expr expr) env = typeofExpr expr env

augmentWithDef :: Definition -> Env -> Env
augmentWithDef (Definition id args _) env = foldl (\env (Arg t id) -> (id, t) : env) env args

augmentWithDefs :: [Definition] -> Env -> Env
augmentWithDefs [] e = e
augmentWithDefs (x : xs) e = augmentWithDefs xs ((getName x, typeofDef x e) : e)
  where
    getName :: Definition -> String
    getName (Definition s _ _) = s

typeofDef :: Definition -> Env -> Type
typeofDef def@(Definition id args expr) env = typeofExpr expr env'
  where
    env' = augmentWithDef def env

typeofExpr :: Expr -> Env -> Type
typeofExpr (EApp id exprs) env = error "not implemented"
typeofExpr (EIf cond t f) env = error "not implemented"
typeofExpr (ELet defs expr) env = typeofExpr expr env'
  where
    env' = augmentWithDefs defs env
typeofExpr (EVar id) env = getType id env
typeofExpr (EValue value) env = typeofValue value env
typeofExpr (ECaseOf expr cases) env =
  let condType = typeofExpr expr env
      caseTypes = map (\(pattern, expr) -> (typeofPattern pattern env, typeofExpr expr env)) cases
      caseType = fst $ head caseTypes -- si TAny premier type
      exprType = snd $ head caseTypes
   in if any (\(c, e) -> c /= caseType || e /= exprType) caseTypes
        then throwError "case types do not match"
        else exprType
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
        Arithmetic | op == "+" || op == "-" || op == "*" || op == "/" ->
          case (t1, t2) of
            (TInteger, TInteger) -> TInteger
            _ -> throwError $ "arithmetic on non-integer" ++ op
        Logical | op == "&&" || op == "||" ->
          case (t1, t2) of
            (TBool, TBool) -> TBool
            _ -> throwError $ "logical on non-bool" ++ op
        Comparison | op == "==" || op == "!=" ->
          case (t1, t2) of
            (t1, t2) -> TBool
        Relational | op == "<" || op == ">" || op == "<=" || op == ">=" ->
          case (t1, t2) of
            (TInteger, TInteger) -> TBool
            _ -> throwError $ "relational on non-integer" ++ op
        _ -> throwError $ "undefined operator" ++ op

typeofValue :: Value -> Env -> Type
typeofValue (VInteger _) env = TInteger
typeofValue (VBool _) env = TBool
typeofValue (VTuple l r) env = TTuple (Arg (typeofExpr l env) "") (Arg (typeofExpr r env) "")
typeofValue _ env = error "not implemented"

typeofPattern :: Pattern -> Env -> Type
typeofPattern (PVar id) env = getType id env
typeofPattern (PValue value) env = typeofValue value env
typeofPattern PAny env = TAny

throwError msg = error ("type error: " ++ msg ++ " ")