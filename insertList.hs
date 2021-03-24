data Tree t = Nilt |
               Node t (Tree t) (Tree t)
               deriving (Read, Show)
                     
insere :: Ord t => Tree t -> t -> Tree t
insere (Nilt) l = Node l (Nilt) (Nilt)
insere (Node n t1 t2) l | l > n = Node n t1 (insere t2 l)
                            | otherwise = Node n (insere t1 l) t2

conta (t, []) = (t, [])
conta (t, l) = conta (insere t (head l), tail l) 

insertList :: Ord t => Tree t -> [t] -> Tree t
insertList t l = fst(conta (t,l))
