-- FINISHED

data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

direction :: (Int,Int) -> [Command] -> Int -> (Int,Int) 
direction (x,y) [] n = (x,y)
direction (x,y) a n | n >=360 || n<=(-360) = direction (x,y) a 0
                    | head a == TurnLeft = direction (x,y) (tail a) (n + 90)
                    | head a == TurnRight = direction (x,y) (tail a) (n - 90)
                    | otherwise = direction (position (x,y) (head a) n) (tail a) n

position :: (Int, Int) -> Command -> Int -> (Int, Int)
position (x,y) (Forward c) n | n == 0 = (x,y+c)
                        | n == 90 || n == (-270) = (x-c,y)
                        | n == -90 || n == 270 = (x+c,y)
                        | n == 180 || n == (-180) = (x,y-c)
position (x,y) (Backward c) n | n == 0 = (x,y-c)
                         | n == 90 || n == (-270) = (x+c,y)
                         | n == -90 || n == 270 = (x-c,y)
                         | n == 180 || n == (-180) = (x,y+c)


destination :: (Int,Int) -> [Command] -> (Int,Int)
destination (x,y) a = direction (x,y) a 0
