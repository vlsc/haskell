-- FINISHED
data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)
              
  

verif1 n0 (Node n t1 t2) | n0 > n = verif1 n0 t1 && verif1 n0 t2
                         | otherwise = False
verif1 n0 (Nilt) = True

verif2 n0 (Node n t1 t2) | n0 < n = verif2 n0 t1 && verif2 n0 t2
                         | otherwise = False
verif2 n0 (Nilt) = True


isBST :: Ord t => Tree t -> Bool
isBST (Nilt) = True
isBST (Node n t1 t2) | verif1 n t1 && verif2 n t2 = isBST t1 && isBST t2
                     | otherwise = False


