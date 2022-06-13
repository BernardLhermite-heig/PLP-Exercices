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

data State = StandardState TEnv Env | MessageState TEnv Env String | QuitState | EditionState TEnv Env

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

displayMessage msg = catch (putStrLn msg) handler -- catch nécessaire si c'est une exception visiblement
  where
    handler :: SomeException -> IO ()
    handler = print

repl :: State -> IO ()
repl QuitState = quit
repl state@(EditionState tEnv env) = do
  content <- readUntil (== ":}")
  state <- evalLines content tEnv env state
  repl state
  where
    evalLines [] tEnv env state = return state
    evalLines (l : ls) tEnv env state = do
      state <- evalLine l tEnv env
      case state of
        StandardState tEnv' env' -> evalLines ls tEnv' env' state
        MessageState tEnv' env' msg -> displayMessage msg >> evalLines ls tEnv' env' (StandardState tEnv' env')
        _ -> error "this should not happen"
repl (MessageState oldTEnv oldEnv msg) = displayMessage msg >> repl (StandardState oldTEnv oldEnv)
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
        let tEnv'' = if t == TAny then tEnv' else tEnv' -- Force l'analyse sémantique complète, merci la lazy-evaluation
        case tEnv'' `seq` eval stmt env of -- seq pour forcer l'évluation de tEnv'' et ^
          Left env' -> return $ StandardState tEnv'' env'
          Right value -> return $ MessageState tEnv env (show value)
    )
    handler
  where
    handler :: SomeException -> IO State
    handler e = return $ MessageState tEnv env (show e)

parseCmd cmd rest tEnv env state =
  case cmd of
    '{' -> EditionState tEnv env
    'r' -> state
    't' -> case rest of
      (' ' : arg) -> MessageState tEnv env (show $ fst $ typeof (parseLine arg) tEnv)
      _ -> MessageState tEnv env "Missing argument <expr>"
    'e' -> MessageState tEnv env (show tEnv ++ "\n" ++ show env)
    'h' -> MessageState tEnv env help
    'q' -> QuitState
    _ -> MessageState tEnv env "Unknown command"

parseLine line = parser $ lexer line

-- Source: https://stackoverflow.com/questions/49955881/haskell-recursive-function-to-read-input-from-user-until-a-condition-and-then-r
collectUntil :: (Monad m) => m a -> (a -> Bool) -> m [a]
collectUntil act f = do
  x <- act
  if f x
    then return []
    else (x :) <$> collectUntil act f

readUntil :: (String -> Bool) -> IO [String]
readUntil = collectUntil getLine