import Control.Monad
import Data.Char
import Data.List
import System.Environment
import System.Exit (exitSuccess)

data Character = Farmer | Wolf | Goat | Cabbage
  deriving (Show, Eq)

data Side = LeftBank | RightBank

data Boat = Boat Character | EmptyBoat

data Game = Game Side Boat [Character] [Character]

river :: String
river = replicate 40 '~'

unknownCommand :: String
unknownCommand = "Commande inconnue"

instance Show Boat where
  show (Boat passenger) = "Barque: " ++ show Farmer ++ ", " ++ show passenger
  show EmptyBoat = "Barque: " ++ show Farmer

instance Show Game where
  show (Game side boat left right) = showLeft ++ showRiver ++ showRight
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
initGame = Game LeftBank EmptyBoat [Wolf, Goat, Cabbage] []

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
isMoveValid (Game side _ left right) =
  not (Wolf `elem` bank && Goat `elem` bank) && not (Goat `elem` bank && Cabbage `elem` bank)
  where
    bank = case side of
      LeftBank -> right
      RightBank -> left

moveBoat :: Game -> Maybe Game
moveBoat (Game side boat left right)
  | isMoveValid nextMove = Just nextMove
  | otherwise = Nothing
  where
    oppositeSide = case side of
      LeftBank -> RightBank
      RightBank -> LeftBank
    nextMove = Game oppositeSide boat left right

loadPassenger :: Game -> Character -> Maybe Game
loadPassenger (Game side boat left right) passenger =
  case boat of
    Boat _ -> Nothing
    EmptyBoat
      | isValid -> Just $ Game side (Boat passenger) newLeft newRight
      | otherwise -> Nothing
      where
        (isValid, newLeft, newRight) = case side of
          LeftBank -> (passenger `elem` left, delete passenger left, right)
          RightBank -> (passenger `elem` right, left, delete passenger right)

unloadPassenger :: Game -> Maybe Game
unloadPassenger (Game side boat left right) =
  case boat of
    EmptyBoat -> Nothing
    Boat passenger -> Just $ Game side EmptyBoat newLeft newRight
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