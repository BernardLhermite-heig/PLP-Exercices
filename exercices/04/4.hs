module Arbre where

data Arbre a
  = Nil
  | Noeud a (Arbre a) (Arbre a)
  deriving (Show)

instance Functor Arbre where
  fmap _ Nil = Nil
  fmap f (Noeud a g d) = Noeud (f a) (fmap f g) (fmap f d)

insert :: Ord a => a -> Arbre a -> Arbre a
insert x Nil = Noeud x Nil Nil
insert x (Noeud a g d)
  | x < a = Noeud a (insert x g) d
  | x > a = Noeud a g (insert x d)
  | otherwise = Noeud a g d

xs = insert 1 $ insert 2 $ insert 3 $ insert 4 Nil

contient :: Ord a => Arbre a -> a -> Bool
contient Nil x = False
contient (Noeud a g d) x
  | x < a = contient g x
  | x > a = contient d x
  | otherwise = True

aplatir :: Arbre t -> [t]
aplatir Nil = []
aplatir (Noeud a g d) = aplatir g ++ a : aplatir d

test = fmap succ xs