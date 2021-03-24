import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)

separa1 [] n = n
separa1 s n | (head s) /= 's' && (head s) /= 'm' && (head s) /= 'd' = separa1 (tail s) (n++[(head s)])
            | otherwise = n

separa2 [] n = n
separa2 s [] | (head s) == 'v' || (head s) == 'l' || (head s) == 'b' || ((head s) == 'm' && head(tail s) /= 'u') = tail s         
            | otherwise = separa2 (tail s) []

op s  | (head s) == 'm' || (head s) == 'd' || (head s) == 's' = [head s]++[head(tail s)]++[head(tail (tail s))]
        | otherwise = op (tail s)
               
opera (x,"sum",y) | x == "" = Just (read y::Int)
                  | y == "" = Just (read x::Int)
                  | otherwise = Just ((read (x)::Int) + (read (y)::Int))
opera (x,"sub",y) | x == "" = Just (0 - (read y::Int))
                  | y == "" = Just (read x::Int)
                  | otherwise = Just ((read (x)::Int) - (read (y)::Int))
opera (x,"mul",y) | x == "" || y == "" = Just 0
                  | otherwise = Just ((read (x)::Int) * (read (y)::Int))
opera (x,"div",y) | (read y::Int)==0 || y == "" = Nothing
                  | x == "" = Just 0
                  | otherwise = Just ((read (x)::Int) `div` (read (y)::Int))

safeCalc :: String -> IO ()
safeCalc a = print(opera(separa1 a [], op a, separa2 a []))
