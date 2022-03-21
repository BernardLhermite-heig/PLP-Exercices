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

fromList :: (Foldable t, Ord a) => t a -> Arbre a
fromList = foldr insert Nil

contient :: Ord a => Arbre a -> a -> Bool
contient Nil x = False
contient (Noeud a g d) x
  | x < a = contient g x
  | x > a = contient d x
  | otherwise = True

aplatir :: Arbre t -> [t]
aplatir Nil = []
aplatir (Noeud a g d) = aplatir g ++ a : aplatir d

xs = insert 13 $insert 7 $insert 4 $insert 14 $insert 6 $insert 1 $insert 10 $insert 3 $insert 8 Nil

test = fmap succ xs