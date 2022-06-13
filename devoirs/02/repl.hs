import Control.Exception (SomeException (SomeException), catch, evaluate, try)
import Eval
import GHC.Base (seq)
import GHC.Conc (pseq)
import Language
import Lexer
import Parser
import Semantics
import System.Exit (exitSuccess)
import System.IO
import Text.Printf (printf)

data State = ValidState TEnv Env | InvalidState TEnv Env String | QuitState deriving (Show)

main :: IO ()
main =
  do
    putStrLn help
    repl initEnv

initEnv = ValidState emptyTEnv emptyEnv

help =
  ":{ activer l'édition multi-ligne (:} pour la désactiver)"
    ++ "\n:r réinitialiser l'état de l'interpréteur"
    ++ "\n:t <expr> afficher le type d'une expression"
    ++ "\n:e afficher l'environnement"
    ++ "\n:h afficher l'aide"
    ++ "\n:q quitter le programme"

quit :: IO ()
quit = exitSuccess

repl :: State -> IO ()
repl QuitState = quit
repl (InvalidState oldTEnv oldEnv msg) = error "s" -- print msg >> repl (ValidState oldTEnv oldEnv)
repl state@(ValidState tEnv env) =
  do
    putStr "> "
    hFlush stdout
    line <- getLine
    case line of
      (':' : cmd : rest) -> repl $ parseCmd cmd rest tEnv env state
      [] -> repl state
      _ -> do
        tokens <- tryLexer line state
        case tokens of
          Left state -> repl state
          Right tokens -> do
            ast <- tryParser tokens tEnv env
            case ast of
              Left state -> repl state
              Right ast -> do
                semantic <- tryTypeOf ast tEnv env
                case semantic of
                  Left state -> repl state
                  Right semantic@(t, tEnv') -> do
                    final <- tryEval ast tEnv' env
                    case semantic `seq` final of
                      Left state -> repl state
                      Right final -> do
                        case final of
                          Left env' -> repl (ValidState tEnv' env')
                          Right val -> print val >> repl state

tryLexer line state = do
  tokens <- try (evaluate $ lexer line) :: IO (Either SomeException [TokenPosn])
  case tokens of
    Left e -> return $ Left $ InvalidState emptyTEnv emptyEnv (show e)
    Right tokens -> return $ Right tokens

tryParser tokens tEnv env = do
  ast <- try (evaluate $ parser tokens) :: IO (Either SomeException Stmt)
  case ast of
    Left e -> return $ Left $ InvalidState tEnv env (show e)
    Right ast -> return $ Right ast

tryTypeOf stmt tEnv env = do
  semanticAnal <- try (evaluate $ typeof stmt tEnv) :: IO (Either SomeException (Type, TEnv))
  case semanticAnal of
    Left e -> return $ Left $ InvalidState tEnv env (show e)
    Right semanticAnal -> return $ Right semanticAnal

tryEval stmt tEnv env = do
  eval <- try (evaluate $ eval stmt env) :: IO (Either SomeException (Either Env Value))
  case eval of
    Left e -> return $ Left $ InvalidState tEnv env (show e)
    Right eval -> return $ Right eval

evalStmt line tEnv env = do
  stmt <- evaluate $ parseStmt line
  semanticAnal@(_, newTEnv) <- evaluate $ typeof stmt tEnv
  return $ case newTEnv `seq` eval stmt env of
    Left env' -> ValidState newTEnv env'
    Right val -> InvalidState newTEnv env (show val)

parseCmd cmd rest tEnv env state =
  case cmd of
    '{' -> error "{" --Right $ print state
    '}' -> error "}"
    'r' -> state
    't' -> case rest of
      (' ' : arg) -> state
      _ -> InvalidState tEnv env "Missing argument <expr>"
    'e' -> InvalidState tEnv env (show tEnv ++ show env)
    'h' -> InvalidState tEnv env help
    'q' -> QuitState
    _ -> InvalidState tEnv env "Unknown command"

parseStmt stmt = parser $ lexer stmt

handler :: SomeException -> IO ()
handler = print