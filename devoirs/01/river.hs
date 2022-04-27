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

data Character = Wolf | Goat | Cabbage
  deriving (Show, Eq)

data Side = LeftBank | RightBank

data Boat = Boat Character | EmptyBoat

data State = State Side Boat [Character] [Character]

data Move = ValidMove State | InvalidMove State String

river :: String
river = replicate 40 '~'

instance Show Boat where
  show (Boat passenger) = show EmptyBoat ++ ", " ++ show passenger
  show EmptyBoat = "Barque: Farmer"

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
    let initialMove@(ValidMove state) = initGame
    print state
    gameLoop initialMove

help :: IO ()
help = do
  putStrLn ":p afficher l'état du jeu"
  putStrLn ":l <passenger> charger la barque avec un passager (ex: :l wolf ou :l w)"
  putStrLn ":u décharger la barque"
  putStrLn ":m déplacer la barque"
  putStrLn ":r réinitialiser le jeu"
  putStrLn ":q quitter le jeu"
  putStrLn ":h afficher l'aide"

quit :: IO ()
quit = exitSuccess

initGame :: Move
initGame = ValidMove $ State LeftBank EmptyBoat [Wolf, Goat, Cabbage] []

gameLoop :: Move -> IO ()
gameLoop (InvalidMove oldState msg) = putStrLn msg >> gameLoop (ValidMove oldState)
gameLoop move@(ValidMove state)
  | hasWon state = putStrLn "Vous avez gagné!" >> askReplay
  | otherwise = do
    putStr "> "
    hFlush stdout
    cmd <- getLine
    case parseCmd cmd of
      Left move -> gameLoop move
      Right msg -> msg >> gameLoop (ValidMove state)
  where
    parseCmd (':' : cmd : rest) =
      case cmd of
        'p' -> Right $ print state
        'l' -> case rest of
          (' ' : arg) -> Left $
            case parsePassenger arg of
              Just passenger -> loadPassenger state passenger
              Nothing -> InvalidMove state "Passager inconnu"
          _ -> Left $ InvalidMove state "Passager manquant"
        'u' -> Left $ unloadPassenger state
        'm' -> Left $ moveBoat state
        'r' -> Left initGame
        'q' -> Right quit
        'h' -> Right help
        _ -> Left $ InvalidMove state unknownCommand
    parseCmd _ = Left $ InvalidMove state unknownCommand
    unknownCommand = "Commande inconnue"

askReplay :: IO ()
askReplay = do
  putStrLn "Voulez-vous rejouer? (y/n)"
  answer <- getLine
  case answer of
    "y" -> main
    "n" -> quit
    _ -> putStrLn "Réponse invalide" >> askReplay

validateMove :: State -> Move
validateMove move@(State side _ left right)
  | hasWolf && hasGoat = InvalidMove move "Le loup ne peut pas être laissé seul avec la chèvre"
  | hasGoat && hasCabbage = InvalidMove move "La chèvre ne peut pas être laissée seule avec les choux"
  | otherwise = ValidMove move
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
loadPassenger move@(State side boat left right) passenger =
  case boat of
    Boat _ -> InvalidMove move "La barque contient déjà un passager"
    EmptyBoat
      | isValid -> ValidMove $ State side (Boat passenger) newLeft newRight
      | otherwise -> InvalidMove move "Ce passager se trouve sur l'autre rive"
      where
        (isValid, newLeft, newRight) = case side of
          LeftBank -> (passenger `elem` left, delete passenger left, right)
          RightBank -> (passenger `elem` right, left, delete passenger right)

unloadPassenger :: State -> Move
unloadPassenger move@(State side boat left right) =
  case boat of
    EmptyBoat -> InvalidMove move "La barque est vide"
    Boat passenger -> ValidMove $ State side EmptyBoat newLeft newRight
      where
        (newLeft, newRight) = case side of
          LeftBank -> (passenger : left, right)
          RightBank -> (left, passenger : right)

parsePassenger :: String -> Maybe Character
parsePassenger arg
  | match "wolf" = Just Wolf
  | match "goat" = Just Goat
  | match "cabbage" = Just Cabbage
  | otherwise = Nothing
  where
    str = map toLower arg
    match name@(n : _) = str == name || str == [n]
    match _ = False

hasWon :: State -> Bool
hasWon (State RightBank EmptyBoat left right) = length right == 3
hasWon _ = False