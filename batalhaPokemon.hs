itol n | n == 0 = []
       | otherwise = itol (div n 10) ++ [(mod n 10)]

opera1 :: [Int] -> Int
opera1 l | l == [] = 0
         | otherwise = (head l) * head(tail l) + opera1(tail(tail l))

opera2 :: [Int] -> Int
opera2 l | l == [] = 1
         |otherwise = (head l)*opera2(tail l)

batalha n | div n 1000 == 0 = "Charmander derrotado"
          | sera (opera1 (itol n)) (opera2 (itol n)) = "Charmander vitorioso"
          | otherwise = "Charmander derrotado"

sera :: Int -> Int -> Bool
sera a b | length (itol a) /= 2 = False
         | b == (head (itol a))*head(tail (itol a))*head(tail (itol a)) = True
         | otherwise = False
