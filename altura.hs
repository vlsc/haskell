-- Altura da Árvore
-- FINISHED


data Tree t = Node t (Tree t) (Tree t)
            | Nilt 
            deriving (Read)


altura :: Tree t -> Int
altura (Nilt) = 0
altura (Node n t1 t2) | (altura t1) > (altura t2) = 1 + (altura t1)
                      | otherwise = 1 + (altura t2)






