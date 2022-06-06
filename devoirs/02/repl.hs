import Control.Exception (Exception, SomeException, catch)
import Eval
import Language
import Lexer
import Parser
import Semantics
import System.Exit (exitSuccess)
import System.IO

data Move = ValidMove Env | InvalidMove Env String

main :: IO ()
main =
  do
    help
    repl initEnv

initEnv = ValidMove emptyEnv

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

repl :: Move -> IO ()
repl (InvalidMove oldEnv msg) = putStrLn msg >> repl (ValidMove oldEnv)
repl (ValidMove env) =
  do
    -- putStr "> "
    -- line <- getLine
    -- let tokens = lexer line
    -- putStrLn $ show tokens
    -- let stmt = parser tokens
    -- putStrLn $ show stmt
    -- case eval stmt env of
    --   Left env' -> repl env'
    --   Right val -> print val >> repl env

    putStr "> "
    hFlush stdout
    cmd <- getLine
    case parseCmd cmd of
      Left move -> repl move
      Right msg -> msg >> repl (ValidMove env)
  where
    parseCmd (':' : cmd : rest) =
      case cmd of
        '{' -> error "{" --Right $ print state
        '}' -> error "}"
        'r' -> Left initEnv
        't' -> case rest of
          (' ' : arg) -> Right $ tryTypeOf arg
          _ -> Left $ InvalidMove env "Missing argument <expr>"
        'e' -> Right $ print env
        'h' -> Right help
        'q' -> Right quit
        _ -> Left $ InvalidMove env unknownCommand
    parseCmd _ = Left $ InvalidMove env unknownCommand
    unknownCommand = "Unknown command"

parseStmt stmt = parser $ lexer stmt

tryTypeOf str = catch (print (typeof (parseStmt str) [])) handler
  where
    handler :: SomeException -> IO ()
    handler e = putStrLn $ "Error: " ++ show e