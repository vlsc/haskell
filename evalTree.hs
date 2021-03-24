
data Ops = SUM | MUL | SUB
           deriving (Read)

data IntTree = Nilt Int |
               Node Ops IntTree IntTree
               deriving (Read)


evalTree :: IntTree -> Int
evalTree (Nilt n) = n
evalTree (Node SUM t1 t2) = evalTree t1 + evalTree t2
evalTree (Node SUB t1 t2) = evalTree t1 - evalTree t2
evalTree (Node MUL t1 t2) = evalTree t1 * evalTree t2
