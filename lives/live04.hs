{-
: algebraic data type
-}

--sum     = Type | Type ... | Type
--product = Type * Type ... * Type

{-
: sum
-}

data Null = Null

data Boolean = Truthy | Falsy

data Shape
  = Circle Double
  | Square Double
  | Rectangle Double Double

{-
: application
-}

application =
  let r = Rectangle
      r' = Rectangle 1.5
   in ()

{-
: deriving
-}

data Bit = Zero | One
  deriving (Show, Eq)

{-
: pattern matching
-}

data Op = Or | And
  deriving (Eq, Show)

truth :: Op -> Bit -> Bit -> Bit
truth Or Zero Zero = Zero
truth Or _ _ = One
truth And One One = One
truth And _ _ = Zero

area :: Shape -> Double
area (Circle r) = pi * r * r
area (Square a) = a * a
area (Rectangle a b) = a * b

{-
: product
-}

data House = Lannister | Stark | Targaryen
  deriving (Show)

data Character = Character
  { name :: String,
    house :: House
  }
  deriving (Show)

-- Character nom Stark
-- Character { house = Stark, name = "boomer" }

application' =
  let _ = Character "John" Stark
      arya = Character {house = Stark, name = "Arya"}
      _ = house arya
      Character {house = h} = arya -- h retourne stark
      -- Character h _ = arya -- pareille
   in ()

houseOf :: Character -> House
houseOf Character {house = h} = h

{-
: newtype
-}

data T = T Int

newtype U = U Int

{-
: parameteric type
-}

eitherUsage =
  let _ = Left "foo"
      _ = Right True
   in ()

data MyEither a b
  = MyLeft a
  | MyRight b
  deriving (Show, Eq)

myEither f g (MyLeft x) = f x
myEither f g (MyRight x) = g x

-- pad "foo" MyLeft "   " -> "   foo"
-- pad "foo" MyRight 5     -> "     foo"
pad :: String -> MyEither String Int -> String
pad s (MyLeft str) = str ++ s
pad s (MyRight n) = replicate n ' ' ++ s

{-
: type
-}

type MyChar = Char

type MyString = [MyChar]

indexOf :: MyChar -> MyString -> Int
indexOf c cs = indexOf' c cs 0
  where
    indexOf' _ [] _ = -1
    indexOf' y (x : xs) idx
      | x == y = idx
      | otherwise = indexOf' x xs (idx + 1)

{-
: maybe
-}

data MyMaybe a
  = MyNothing
  | MyJust a
  deriving (Eq, Show)

find' _ [] = MyNothing
find' f (x : xs)
  | f x = MyJust x
  | otherwise = find' f xs

{-
: recursive type
-}

data MyList a
  = Nil
  | Cons a (MyList a)
  deriving (Eq, Show)

myHead Nil = Nil
myHead (Cons h _) = h

myTail (Cons _ hs) = hs

myLength :: MyList a -> Int
myLength Nil = 0
myLength (Cons _ hs) = 1 + myLength hs

{-
: type class instance
-}

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

instance Show Day where
  show Mon = "Monday"
  show Tue = "tg"
  show Wed = "tg2"
  show Thu = "tg3"
  show _ = "tg4"

instance Enum Day where
  succ Mon = Tue
  succ Tue = Wed
  succ _ = Mon

data Tuple a b = Tuple a b

instance (Show a, Show b) => Show (Tuple a b) where
  show (Tuple a b) = "(" ++ show a ++ ", " ++ show b ++ ")"

{-
: type class definition
-}

class MyEq a where
  (===) :: a -> a -> Bool
  (/==) :: a -> a -> Bool

instance MyEq Boolean where
  (===) Truthy Truthy = True
  (===) Falsy Falsy = True
  (===) _ _ = False
  (/==) x y = not (x === y)

class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Boolean where
  yesno Falsy = False
  yesno _ = True

{-
: functor
-}

class MyFunctor f where
  myFmap :: (a -> b) -> f a -> f b

fmapUsage =
  let _ = map succ [1 .. 10]
      _ = fmap succ [1 .. 10]
   in ()

instance MyFunctor MyMaybe where
  myFmap f MyNothing = MyNothing
  myFmap f (MyJust x) = MyJust $ f x