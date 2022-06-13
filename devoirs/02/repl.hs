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

data State = StandardState TEnv Env | MessageState TEnv Env String | QuitState

main :: IO ()
main =
  do
    putStrLn help
    repl initEnv

initEnv = StandardState emptyTEnv emptyEnv

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
repl (MessageState oldTEnv oldEnv msg) = catch (putStrLn msg) handler >> repl (StandardState oldTEnv oldEnv)
  where
    handler :: SomeException -> IO ()
    handler = print
repl state@(StandardState tEnv env) =
  do
    putStr "> "
    hFlush stdout
    line <- getLine
    case line of
      (':' : cmd : rest) -> repl $ parseCmd cmd rest tEnv env state
      [] -> repl state
      _ -> do
        t <- evalLine line tEnv env
        repl t

evalLine line tEnv env =
  catch
    ( do
        stmt <- evaluate $ parseLine line
        sem@(t, tEnv') <- evaluate $ typeof stmt tEnv
        let tEnv'' = if t == TAny then tEnv' else tEnv'
        case tEnv'' `seq` eval stmt env of
          Left env' -> return $ StandardState tEnv'' env'
          Right value -> return $ MessageState tEnv env (show value)
    )
    handler
  where
    handler :: SomeException -> IO State
    handler e = return $ MessageState tEnv env (show e)

parseCmd cmd rest tEnv env state =
  case cmd of
    '{' -> error "{" --Right $ print state
    '}' -> error "}"
    'r' -> state
    't' -> case rest of
      (' ' : arg) -> MessageState tEnv env (show $ fst $ typeof (parseLine arg) tEnv)
      _ -> MessageState tEnv env "Missing argument <expr>"
    'e' -> MessageState tEnv env (show tEnv ++ show env)
    'h' -> MessageState tEnv env help
    'q' -> QuitState
    _ -> MessageState tEnv env "Unknown command"

parseLine line = parser $ lexer line
