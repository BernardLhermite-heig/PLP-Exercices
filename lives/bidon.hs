module Bidon where

import Data.List -- tout
import Data.List (find {-, ...-}) -- find
import Data.List hiding (find {-, ...-}) -- tout sauf find
import qualified Data.List -- requis Data.List.f 

-- import
type Tuple2 = (Int, Bool)

tuple2 :: Int -> Bool -> Tuple2
tuple2 a b = (a, b)

-- type
-- type class
-- f
