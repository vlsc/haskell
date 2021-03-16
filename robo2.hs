-- FINISHED

data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)



faces :: Direction -> [Command] -> Direction
faces d [] = d
faces (North) a | head a == (TurnLeft) = faces West (tail a)
                | head a == (TurnRight) = faces East (tail a)
                | otherwise = faces (aux (head a) North) (tail a)
faces (South) a | head a == (TurnLeft) = faces East (tail a)
                | head a == (TurnRight) = faces West (tail a)
                | otherwise = faces (aux (head a) South) (tail a)
faces (East) a  | head a == (TurnLeft) = faces North (tail a)
                | head a == (TurnRight) = faces South (tail a)
                | otherwise = faces (aux (head a) East) (tail a)
faces (West) a  | head a == (TurnLeft) = faces South (tail a)
                | head a == (TurnRight) = faces North (tail a)
                | otherwise = faces (aux (head a) West) (tail a)


aux :: Command -> Direction -> Direction
aux (Forward n) d = d
aux (Backward n) (North) = South
aux (Backward n) (South) = North
aux (Backward n) (West) = East
aux (Backward n) (East) = West
                
