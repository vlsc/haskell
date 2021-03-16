
separa :: Eq t =>[t] -> ([t],[t])
separa l | l == [] = ([],[])
         | otherwise = (listaImpar l,listaPar l)
         

--listaImpar :: Eq a => [a] -> [a]
listaImpar :: Eq a => [a] -> [a]
listaImpar l | l == [] = []
             | tail l == [] = head l : []
             | otherwise = head l : listaImpar(tail (tail l))

listaPar l | l == [] = []
           | tail l == [] = []
           | otherwise = head (tail l) : listaPar(tail (tail l))
                




