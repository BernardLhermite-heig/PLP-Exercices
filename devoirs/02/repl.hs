import Control.Exception (SomeException, catch, evaluate)
import Eval
import GHC.Base (seq)
import Language
import Lexer
import Parser
import Semantics
import System.Directory (doesFileExist)
import System.Exit (exitSuccess)
import System.IO (hFlush, stdout)

data State
  = StandardState TEnv Env
  | MessageState TEnv Env String
  | QuitState
  | EditionState TEnv Env
  | FromFileState TEnv Env String

main :: IO ()
main =
  do
    putStrLn help
    repl initEnv

initEnv = StandardState emptyTEnv emptyEnv

splitChar = ';'

help =
  ":{ activer l'édition multi-ligne (:} pour la désactiver)"
    ++ "\n:r réinitialiser l'état de l'interpréteur"
    ++ "\n:t <expr> afficher le type d'une expression"
    ++ "\n:e afficher l'environnement"
    ++ "\n:f <fichier> charger un fichier, chaque instruction doit être séparée par un "
    ++ show splitChar
    ++ "\n:h afficher l'aide"
    ++ "\n:q quitter le programme"

quit :: IO ()
quit = exitSuccess

displayMessage msg = catch (putStrLn msg) handler -- catch nécessaire si msg est une exception
  where
    handler :: SomeException -> IO ()
    handler = print

repl :: State -> IO ()
repl QuitState = quit
repl state@(FromFileState tEnv env file) = do
  fileExists <- doesFileExist file
  if not fileExists
    then repl (MessageState tEnv env ("Le fichier '" ++ file ++ "' n'existe pas"))
    else do
      content <- readFile file
      let content' = splitOn splitChar content
      state <- evalLines content' tEnv env state
      repl state
repl state@(EditionState tEnv env) = do
  content <- readUntil (== ":}")
  let content' = concat content
  state <- evalLine content' tEnv env
  repl state
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
        let lexems = lexer line
        if null lexems
          then return (StandardState tEnv env)
          else do
            stmt <- evaluate $ parser lexems
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
    'r' -> initEnv
    't' -> case rest of
      (' ' : arg) -> MessageState tEnv env (show $ fst $ typeof (parser $ lexer arg) tEnv) -- <- peut contenir une exception (:
      _ -> MessageState tEnv env "Argument manquant <expr>"
    'e' -> MessageState tEnv env (show tEnv ++ "\n" ++ show env)
    'f' -> case rest of
      (' ' : arg) -> FromFileState tEnv env arg
      _ -> MessageState tEnv env "Argument manquant <fichier>"
    'h' -> MessageState tEnv env help
    'q' -> QuitState
    _ -> MessageState tEnv env "Commande inconnue"

evalLines [] tEnv env state = return state
evalLines (l : ls) tEnv env state = do
  state <- evalLine l tEnv env
  case state of
    StandardState tEnv' env' -> evalLines ls tEnv' env' state
    MessageState tEnv' env' msg -> displayMessage msg >> evalLines ls tEnv' env' (StandardState tEnv' env')
    _ -> error "ne devrait pas arriver"

-- Source: https://stackoverflow.com/questions/49955881/haskell-recursive-function-to-read-input-from-user-until-a-condition-and-then-r
collectUntil :: (Monad m) => m a -> (a -> Bool) -> m [a]
collectUntil act f = do
  x <- act
  if f x
    then return []
    else (x :) <$> collectUntil act f

readUntil :: (String -> Bool) -> IO [String]
readUntil = collectUntil getLine

-- Source: https://codereview.stackexchange.com/questions/253400/split-string-by-delimiter-in-haskell
splitOn :: Char -> String -> [String]
splitOn _ "" = []
splitOn delimiter str =
  let (start, rest) = break (== delimiter) str
      (_, remain) = span (== delimiter) rest
   in start : splitOn delimiter remain