addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = " " ++ addEspacos(n-1)

paraDireita :: Int -> String -> String
paraDireita n s = addEspacos n ++ s



sumTo n | n == 0 = 0
        | otherwise = n + sumTo(n-1)