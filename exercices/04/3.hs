module Liste where

data Liste a
  = Nil
  | Cons a (Liste a)

instance (Show a) => Show (Liste a) where
  show Nil = "[]"
  show (Cons h Nil) = "[" ++ show h ++ "]"
  show (Cons h hs) = "[" ++ show h ++ show' hs
    where
      show' (Cons h hs) = "," ++ show h ++ show' hs
      show' Nil = "]"

insert x Nil = Cons x Nil
insert x (Cons h hs)
  | x < h = Cons x (Cons h hs)
  | otherwise = Cons h (insert x hs)

remove x Nil = Nil
remove x (Cons h hs)
  | x == h = hs
  | otherwise = Cons h (remove x hs)

fromList :: [a] -> Liste a
fromList = foldr Cons Nil

-- where
--   f x Nil = Cons x Nil
--   f x (Cons h hs) = Cons x $ Cons h hs

recherche :: (a -> Bool) -> Liste a -> Liste a
recherche _ Nil = Nil
recherche pred (Cons h hs)
  | pred h = Cons h $ recherche pred hs
  | otherwise = recherche pred hs

-- xs = Cons 1 $ Cons 2 $ Cons 3 $ Cons 4 Nil