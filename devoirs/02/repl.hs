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

data State = ValidState TEnv Env | InvalidState TEnv Env String

main :: IO ()
main =
  do
    help
    repl initEnv

initEnv = ValidState emptyTEnv emptyEnv

help :: IO ()
help = do
  putStrLn ":{ activer l'édition multi-ligne (:} pour la désactiver)"
  putStrLn ":r réinitialiser l'état de l'interpréteur"
  putStrLn ":t <expr> afficher le type d'une expression"
  putStrLn ":e afficher l'environnement"
  putStrLn ":h afficher l'aide"
  putStrLn ":q quitter le programme"

quit :: IO ()
quit = exitSuccess

repl :: State -> IO ()
repl (InvalidState oldTEnv oldEnv msg) = putStrLn msg >> repl (ValidState oldTEnv oldEnv)
repl state@(ValidState tEnv env) =
  do
    putStr "> "
    hFlush stdout
    line <- getLine
    case line of
      (':' : cmd : rest) ->
        case cmd of
          '{' -> error "{" --Right $ print state
          '}' -> error "}"
          'r' -> repl initEnv
          't' -> case rest of
            (' ' : arg) -> tryTypeOf arg tEnv >> repl state
            _ -> repl $ InvalidState tEnv env "Missing argument <expr>"
          'e' -> print tEnv >> print env >> repl state
          'h' -> help >> repl state
          'q' -> quit
          _ -> repl $ InvalidState tEnv env "Unknown command"
      [] -> repl state
      _ -> do
        catch
          ( do
              stmt <- evaluate $ parseStmt line
              semanticAnal@(_, newTEnv) <- evaluate $ typeof stmt tEnv
              case newTEnv `seq` eval stmt env of
                Left env' -> repl $ ValidState newTEnv env'
                Right val -> print val >> repl state
          )
          handler >> repl state

parseStmt stmt = parser $ lexer stmt

tryTypeOf str tEnv = catch (print $ fst (typeof (parseStmt str) tEnv)) handler

handler :: SomeException -> IO ()
handler = print