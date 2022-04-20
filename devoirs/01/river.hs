import Control.Monad
import Data.Char
import Data.List
import System.Environment
import System.Exit (exitSuccess)

data Character = Farmer | Wolf | Goat | Cabbage
  deriving (Show, Eq)

data Side = LeftBank | RightBank

data Boat = Boat Side Character | EmptyBoat Side

data Game = Game Boat [Character] [Character]

river :: String
river = replicate 30 '='

unknownCommand :: String
unknownCommand = "Commande inconnue"

instance Show Boat where
  show (Boat side passenger) =
    case side of
      LeftBank -> showBoat ++ "\n" ++ river ++ "\n"
      RightBank -> "\n" ++ river ++ "\n" ++ showBoat
    where
      showBoat = "Barque: " ++ show Farmer ++ ", " ++ show passenger
  show (EmptyBoat side) =
    case side of
      LeftBank -> showBoat ++ "\n" ++ river ++ "\n"
      RightBank -> "\n" ++ river ++ "\n" ++ showBoat
    where
      showBoat = "Barque: " ++ show Farmer

instance Show Game where
  show (Game boat left right) =
    "Gauche: "
      ++ show left
      ++ "\n"
      ++ show boat
      ++ "\n"
      ++ "Droite: "
      ++ show right

main :: IO ()
main =
  do
    help
    let game = initGame
    putStrLn "Etat initial du jeu:"
    print game
    gameLoop game

help :: IO ()
help = do
  putStrLn ":p afficher l'état du jeu"
  putStrLn ":l <passenger> charger la barque avec un passager"
  putStrLn ":u décharger la barque"
  putStrLn ":m déplacer la barque"
  putStrLn ":r réinitialiser le jeu"
  putStrLn ":q quitter le jeu"
  putStrLn ":h afficher l'aide"

initGame :: Game
initGame = Game (EmptyBoat LeftBank) [Wolf, Goat, Cabbage] []

reset :: IO ()
reset = gameLoop initGame

quit :: IO ()
quit = exitSuccess

gameLoop :: Game -> IO ()
gameLoop game = do
  cmd <- getLine
  parseCmd cmd
  gameLoop game
  where
    parseCmd (':' : cmd : rest) =
      case cmd of
        'p' -> print game
        'l' -> case rest of
          (' ' : arg) ->
            case parseArg arg of
              Just passenger ->
                case loadPassenger game passenger of
                  Just nextGame -> gameLoop nextGame
                  Nothing -> putStrLn "Impossible de charger ce passager"
              Nothing -> putStrLn "Passager inconnu"
          _ -> putStrLn unknownCommand
        'u' -> case unloadPassenger game of
          Just nextGame -> gameLoop nextGame
          Nothing -> putStrLn "Barque vide"
        'm' -> case moveBoat game of
          Just nextGame -> gameLoop nextGame
          Nothing -> putStrLn "Impossible de déplacer la barque"
        'r' -> reset
        'q' -> quit
        'h' -> help
        _ -> putStrLn unknownCommand
    parseCmd _ = putStrLn unknownCommand

isMoveValid :: Game -> Bool
isMoveValid (Game (EmptyBoat side) left right) =
  not (Wolf `elem` bank && Goat `elem` bank) && not (Goat `elem` bank && Cabbage `elem` bank)
  where
    bank = case side of
      LeftBank -> right
      RightBank -> left
isMoveValid (Game (Boat side _) left right) =
  not (Wolf `elem` bank && Goat `elem` bank) && not (Goat `elem` bank && Cabbage `elem` bank)
  where
    bank = case side of
      LeftBank -> right
      RightBank -> left

moveBoat :: Game -> Maybe Game
moveBoat (Game boat left right)
  | canMove = case boat of
    Boat side passenger -> Just $ Game (Boat (oppositeSide side) passenger) left right
    EmptyBoat side -> Just $ Game (EmptyBoat (oppositeSide side)) left right
  | otherwise = Nothing
  where
    oppositeSide LeftBank = RightBank
    oppositeSide RightBank = LeftBank
    canMove = True

loadPassenger :: Game -> Character -> Maybe Game
loadPassenger (Game boat left right) passenger =
  case boat of
    EmptyBoat side
      | isValid -> Just $ Game (Boat side passenger) newLeftBank newRightBank
      | otherwise -> Nothing
    Boat _ _ -> Nothing
  where
    (EmptyBoat side) = boat
    isValid = case side of
      LeftBank -> passenger `elem` left
      RightBank -> passenger `elem` right
    newLeftBank = case side of
      LeftBank -> delete passenger left
      RightBank -> left
    newRightBank = case side of
      LeftBank -> right
      RightBank -> delete passenger right

unloadPassenger :: Game -> Maybe Game
unloadPassenger (Game boat left right) =
  case boat of
    Boat LeftBank passenger -> Just $ Game (EmptyBoat LeftBank) (passenger : left) right
    Boat RightBank passenger -> Just $ Game (EmptyBoat RightBank) left (passenger : right)
    EmptyBoat _ -> Nothing

parseArg :: String -> Maybe Character
parseArg arg =
  case arg of
    "wolf" -> Just Wolf
    "goat" -> Just Goat
    "cabbage" -> Just Cabbage
    _ -> Nothing