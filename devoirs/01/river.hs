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
  show EmptyBoat = "Boat: Farmer"

instance Show State where
  show (State side boat left right) = showLeft ++ showRiver ++ showRight
    where
      showRiver = case side of
        LeftBank -> show boat ++ "\n" ++ river ++ "\n"
        RightBank -> "\n" ++ river ++ "\n" ++ show boat
      showLeft = "Left: " ++ show left ++ "\n"
      showRight = "\n" ++ "Right: " ++ show right

main :: IO ()
main =
  do
    help
    let initialMove@(ValidMove state) = initGame
    print state
    gameLoop initialMove

help :: IO ()
help = do
  putStrLn ":p print the current state"
  putStrLn ":l <passenger> load the boat with the specified passenger (e.g. :l wolf or :l w)"
  putStrLn ":u unload the boat"
  putStrLn ":m move the boat to the other side"
  putStrLn ":r reset the game"
  putStrLn ":q quit the game"
  putStrLn ":h print this help"

quit :: IO ()
quit = exitSuccess

initGame :: Move
initGame = ValidMove $ State LeftBank EmptyBoat [Wolf, Goat, Cabbage] []

gameLoop :: Move -> IO ()
gameLoop (InvalidMove oldState msg) = putStrLn msg >> gameLoop (ValidMove oldState)
gameLoop move@(ValidMove state)
  | hasWon state = putStrLn "You won!" >> askReplay
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
              Nothing -> InvalidMove state "Invalid passenger"
          _ -> Left $ InvalidMove state "Missing argument <passenger>"
        'u' -> Left $ unloadPassenger state
        'm' -> Left $ moveBoat state
        'r' -> Left initGame
        'q' -> Right quit
        'h' -> Right help
        _ -> Left $ InvalidMove state unknownCommand
    parseCmd _ = Left $ InvalidMove state unknownCommand
    unknownCommand = "Unknown command"

askReplay :: IO ()
askReplay = do
  putStrLn "Do you want to play again? (y/n)"
  answer <- getLine
  case answer of
    "y" -> main
    "n" -> quit
    _ -> putStrLn "Invalid answer" >> askReplay

validateMove :: State -> State -> Move
validateMove oldState nextState@(State side _ left right)
  | hasWolf && hasGoat = InvalidMove oldState "The wolf cannot be left alone with the goat"
  | hasGoat && hasCabbage = InvalidMove oldState "The goat cannot be left alone with the cabbage"
  | otherwise = ValidMove nextState
  where
    bank = case side of
      LeftBank -> right
      RightBank -> left
    hasWolf = Wolf `elem` bank
    hasGoat = Goat `elem` bank
    hasCabbage = Cabbage `elem` bank

moveBoat :: State -> Move
moveBoat state@(State side boat left right) = validateMove state nextState
  where
    oppositeSide = case side of
      LeftBank -> RightBank
      RightBank -> LeftBank
    nextState = State oppositeSide boat left right

loadPassenger :: State -> Character -> Move
loadPassenger state@(State side boat left right) passenger =
  case boat of
    Boat _ -> InvalidMove state "The boat is already occupied"
    EmptyBoat
      | isValid -> ValidMove $ State side (Boat passenger) newLeft newRight
      | otherwise -> InvalidMove state "This passenger is on the other side"
      where
        (isValid, newLeft, newRight) = case side of
          LeftBank -> (passenger `elem` left, delete passenger left, right)
          RightBank -> (passenger `elem` right, left, delete passenger right)

unloadPassenger :: State -> Move
unloadPassenger state@(State side boat left right) =
  case boat of
    EmptyBoat -> InvalidMove state "The boat is empty"
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