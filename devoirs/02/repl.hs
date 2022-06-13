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
repl (InvalidState oldTEnv oldEnv msg) = catch (putStrLn msg) handler >> repl (ValidState oldTEnv oldEnv)
repl state@(ValidState tEnv env) =
  do
    putStr "> "
    hFlush stdout
    line <- getLine
    case line of
      (':' : cmd : rest) -> repl $ parseCmd cmd rest tEnv env state
      [] -> repl state
      _ -> do
        t <- parseStmt' line tEnv env
        repl t

parseStmt' line tEnv env =
  catch
    ( do
        stmt <- evaluate $ parser $ lexer line
        sem@(t, tEnv') <- evaluate $ typeof stmt tEnv
        let tEnv'' = if t == TAny then tEnv' else tEnv'
        putStrLn "test"
        case tEnv'' `seq` eval stmt env of
          Left env' -> return $ ValidState tEnv'' env'
          Right value -> return $ InvalidState tEnv env (show value)
    )
    handler
  where
    handler :: SomeException -> IO State
    handler e = return $ InvalidState tEnv env (show e)

parseCmd cmd rest tEnv env state =
  case cmd of
    '{' -> error "{" --Right $ print state
    '}' -> error "}"
    'r' -> state
    't' -> case rest of
      (' ' : arg) -> InvalidState tEnv env (show $ typeof (parseStmt arg) tEnv)
      _ -> InvalidState tEnv env "Missing argument <expr>"
    'e' -> InvalidState tEnv env (show tEnv ++ show env)
    'h' -> InvalidState tEnv env help
    'q' -> QuitState
    _ -> InvalidState tEnv env "Unknown command"

parseStmt stmt = parser $ lexer stmt

handler :: SomeException -> IO ()
handler = print