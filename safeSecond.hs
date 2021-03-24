import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)

safeSecond :: [a] -> Maybe a
safeSecond a | length (a) >=2 = Just (prox(a))
             | otherwise = Nothing
prox (a:as) = head as
