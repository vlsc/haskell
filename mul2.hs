menor :: [Int] -> [Int] -> Int
menor l1 l2 | length l1 < length l2 = length l1
            | otherwise = length l2

mult :: Int -> [Int] -> [Int] -> [Int]
mult n l1 l2 | n == 0 = []
             | otherwise = (head l1 * head l2) : mult (n-1) (tail l1) (tail l2)

add0 :: Int -> [Int]
add0 n | n == 0 = []
       | otherwise = 0 : add0 (n-1) 

mul2 l1 l2 | length l1 == length l2 = mult (menor l1 l2) l1 l2
           | length l1 > length l2 = mult (menor l1 l2) l1 l2 ++ add0 (length l1 - length l2)
           | otherwise = mult (menor l1 l2) l1 l2 ++ add0 (length l2 - length l1)
