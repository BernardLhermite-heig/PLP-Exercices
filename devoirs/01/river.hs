{-
: Auteur: Stéphane Marengo
: Date: 27.04.2022
-}

import Control.Monad
import Data.Char
import Data.List
import System.Environment
import System.Exit (exitSuccess)
import System.IO

data Character = Farmer | Wolf | Goat | Cabbage
  deriving (Show, Eq)

data Side = LeftBank | RightBank

data Boat = Boat Character | EmptyBoat

data State = State Side Boat [Character] [Character]

data Move = ValidMove State | InvalidMove String

river :: String
river = replicate 40 '~'

unknownCommand :: String
unknownCommand = "Commande inconnue"

instance Show Boat where
  show (Boat passenger) = "Barque: " ++ show Farmer ++ ", " ++ show passenger
  show EmptyBoat = "Barque: " ++ show Farmer

instance Show State where
  show (State side boat left right) = showLeft ++ showRiver ++ showRight
    where
      showRiver = case side of
        LeftBank -> show boat ++ "\n" ++ river ++ "\n"
        RightBank -> "\n" ++ river ++ "\n" ++ show boat
      showLeft = "Gauche: " ++ show left ++ "\n"
      showRight = "\n" ++ "Droite: " ++ show right

main :: IO ()
main =
  do
    help
    let initialState = initGame
    print initialState
    gameLoop initialState

help :: IO ()
help = do
  putStrLn ":p afficher l'état du jeu"
  putStrLn ":l <passenger> charger la barque avec un passager"
  putStrLn ":u décharger la barque"
  putStrLn ":m déplacer la barque"
  putStrLn ":r réinitialiser le jeu"
  putStrLn ":q quitter le jeu"
  putStrLn ":h afficher l'aide"

quit :: IO a
quit = exitSuccess

initGame :: State
initGame = State LeftBank EmptyBoat [Wolf, Goat, Cabbage] []

gameLoop :: State -> IO ()
gameLoop state
  | hasWon state = do
    putStrLn "Vous avez gagné!"
    askReplay
  | otherwise = do
    putStr "> "
    hFlush stdout
    cmd <- getLine
    nextState <- parseCmd cmd
    gameLoop nextState
  where
    parseCmd (':' : cmd : rest) =
      case cmd of
        'p' -> print state >> return state
        'l' -> case rest of
          (' ' : arg) ->
            case parseArg arg of
              Just passenger ->
                case loadPassenger state passenger of
                  ValidMove nextMove -> return nextMove
                  InvalidMove msg -> putStrLn msg >> return state
              Nothing -> putStrLn "Passager inconnu" >> return state
          _ -> putStrLn "Passager manquant" >> return state
        'u' -> case unloadPassenger state of
          ValidMove nextMove -> return nextMove
          InvalidMove msg -> putStrLn msg >> return state
        'm' -> case moveBoat state of
          ValidMove nextMove -> return nextMove
          InvalidMove msg -> putStrLn msg >> return state
        'r' -> return initGame
        'q' -> quit
        'h' -> help >> return state
        _ -> putStrLn unknownCommand >> return state
    parseCmd _ = putStrLn unknownCommand >> return state
    askReplay = do
      putStrLn "Voulez-vous rejouer? (y/n)"
      answer <- getLine
      case answer of
        "y" -> main
        "n" -> quit
        _ -> do
          putStrLn "Réponse invalide"
          askReplay

validateMove :: State -> Move
validateMove state@(State side _ left right)
  | hasWolf && hasGoat = InvalidMove "Le loup ne peut pas être laissé seul avec la chèvre"
  | hasGoat && hasCabbage = InvalidMove "La chèvre ne peut pas être laissée seule avec les choux"
  | otherwise = ValidMove state
  where
    bank = case side of
      LeftBank -> right
      RightBank -> left
    hasWolf = Wolf `elem` bank
    hasGoat = Goat `elem` bank
    hasCabbage = Cabbage `elem` bank

moveBoat :: State -> Move
moveBoat (State side boat left right) = validateMove nextMove
  where
    oppositeSide = case side of
      LeftBank -> RightBank
      RightBank -> LeftBank
    nextMove = State oppositeSide boat left right

loadPassenger :: State -> Character -> Move
loadPassenger (State side boat left right) passenger =
  case boat of
    Boat _ -> InvalidMove "La barque contient déjà un passager"
    EmptyBoat
      | isValid -> ValidMove $ State side (Boat passenger) newLeft newRight
      | otherwise -> InvalidMove "Ce passager se trouve sur l'autre rive"
      where
        (isValid, newLeft, newRight) = case side of
          LeftBank -> (passenger `elem` left, delete passenger left, right)
          RightBank -> (passenger `elem` right, left, delete passenger right)

unloadPassenger :: State -> Move
unloadPassenger (State side boat left right) =
  case boat of
    EmptyBoat -> InvalidMove "La barque est vide"
    Boat passenger -> ValidMove $ State side EmptyBoat newLeft newRight
      where
        (newLeft, newRight) = case side of
          LeftBank -> (passenger : left, right)
          RightBank -> (left, passenger : right)

parseArg :: String -> Maybe Character
parseArg arg =
  case arg of
    "wolf" -> Just Wolf
    "goat" -> Just Goat
    "cabbage" -> Just Cabbage
    _ -> Nothing

hasWon :: State -> Bool
hasWon (State RightBank EmptyBoat left right) = length right == 3
hasWon _ = False