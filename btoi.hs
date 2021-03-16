import Data.Char(digitToInt)
mul2 l | l == 1 = 1
       | otherwise = 2 * (mul2 (l-1))

stoi :: Char -> Int
stoi c = digitToInt c

btoi :: String -> Int
btoi s | s == [] || length s == 0 = 0
       | otherwise = stoi((head s))*mul2(length s) + btoi (tail s)

main = do
    s <- getLine
    let result = btoi s
    print result