maior :: Int -> Int -> Int
maior a b | a > b = a
          | otherwise = b

menor a b | a < b = a
          | otherwise = b
md:: Int -> Int -> Int
md a b  |(maior a b) == 0 || (menor a b) == 0 = 1
        | mod (maior a b) (menor a b) == 0 = (menor a b)
        | otherwise = md j k 
        where j = (menor a b)
              k = (mod (maior a b) (menor a b))
