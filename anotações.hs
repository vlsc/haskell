-- [5] == 5:[]
-- todo operador eh uma função
-- a cauda da lista é uma lista do mesmo tipo do primeiro elemento
-- [2,3,4,5] == 2:3:4:5:[]
-- [2..7] = [2,3,4,5,6,7]
-- ['a'..'d'] = [a,b,c,d] (vai pela tabela ascii)
-- (só funciona crescentemente)
--[1.1..3.1] = [1.1, 2.1, 3.1]
--[1.1,1.2..2] = vai incrementando de 0.1 em 0.1

-- funções:
-- head -> retorna o primeiro elemento
-- tail -> devolve a lista cauda (todos os elementos menos a head)
-- length [] = 0
-- length (a:as) = 1 + length as
-- (++)
-- (x:xs) ++ y = x : (xs ++ y) (vai construindo recursivamente)
-- sumList :: [Int] -> Int
-- sumList as
-- | as == [] = 0
-- | otherwise = (head as) + sumList (tail as)

-- Casamento de padrões
-- todos os padroes tem q ter o msm tipo (esquerda)
-- os casos devem ser exaustivos (olhar todos os casos)
-- nao deve haver ambiguidade, se houver, haskell resolve por ordem

-- expressão case
-- permite casamento de padroes com valores arbitrários, noa apenas argumentos
-- ex: firstdigit st = case (digits st) of
--                  []     -> '\0'
--                  (a:as) -> a


--composição de funções:
-- (.) f g x = f(g(x))
-- operador de composição: .
--função anônima:
-- sqr2 = \x -> x*x (por exemplo)
-- concat2 = \l1 l2 -> l1 ++ l2 (variável que guarda uma função que recebe 2 parâmetros e concatena eles)
-- fill s = splitLines (splitWords s)
-- fill = splitLines . splitWords
-- twice f = f . f
-- ex: (succ . succ) 12 = succ (succ 12)
-- iter 0 f = id
-- iter n f = (iter (n-1) f).f
-- addNum n = h
--  where
    -- h m = n + m
--usando notação lambda:
-- \m -> 3+m
--addNum n = (\m -> n+m)

-- Aplicação parcial de funçoes:
-- aplicar a função a apenas parte dos parametros e aplicar o resultado (q é uma função) ao resto dos parametros
-- exemplo:
-- multiply :: Int -> Int -> Int
-- multiply a b = a*b
-- doubleList :: [Int] -> [Int]
-- doubleList = map (multiply 2)
-- (multiply 2) :: Int -> Int
-- map (multiply 2) :: [Int] -> [Int]

--data define tipos algebricos
-- data Temp = Quente | Frio
-- data/type

-- type Nome = String
-- type Idade = Int
-- data Pessoas = Pessoa Nome Idade
-- Pessoa "José" 22
--showPerson :: Pessoas -> String
--showPerson (Pessoa n a) = n ++ " -- " ++ show a
--Pessoa :: Nome -> Idade -> Pessoas
--todo construtor é como uma função (exceto por começar com letra maiuscula)
--casamento de padroes funciona com construtores
--maior confiabilidade do q com uso de tuplas, pois é fortemente tipado
--além de nao poder definir tipos recursivos com tuplas
--data Shape = Circle Float | Rectangle Float Float
--isRound :: Shape -> Bool
--isRound (Circle _) = True
--isRound (Rectangle _ _) = False
--Circle e Rectangle são VALORES DO TIPO SHAPE
--area :: Shape -> Float
--area (Circle _) = pi*r*r
--area (Rectangle _ _) = a*b

--Tipos de dados recursivos:
--data Expr = Lit Int | Add Expr Expr | Sub Expr Expr
--eval :: Expr -> Int
--eval (Lit n) = n
--eval (Add e1 e2) = (eval e1) + (eval e2)
--eval (Sub e1 e2) = (eval e1) - (eval e2)

--Tipos Polimórficos
--data Pairs t = Pair t t
--Pair 6 8 :: Pairs Int
--Pair True True :: Pairs Bool
--data List t = Nil | Const t (List t)
--data Tree t = NilT | Node t (Tree t) (Tree t) 
--                     filho da esquerda e da direita
--                     deriving (Eq, Show)
-- Tree é instancia de Eq e Show


--(Lazyness) avaliação preguiçosa: se dá apenas quando seu valor é necessário
--chamadas de cauda
--ex:
fat n = tailFat n 1
tailFat 0 x = x
tailFat n x = tailFat (n-1) (n*x)
--o que acontece:
{-
fat 4
tailFat 4 1
tailFat 3 1*4
tailFat 2 1*4*3
tailFat 1 1*4*3*2
tailFat 0 1*4*3*2 = 24
-}
--voce joga o resultado diretamente na sua recursao, sem precisar guarda-lo na pilha
--logo, não precisa manter os stackframes na pilha 
--isso evita estouros de pilha e gasto de memória

--Input/Output em Haskell
-- :t = IO t (IO é da classe Monad)
--ex: imprimir uma string:
--writebatata :: IO ()
--writebatata = putStrLn "batata"
--Hello world:
--main :: IO ()
--main = putStrLn "Hello World!"
--putStr nao bota \n, putStrLn bota

-- Monad é o conjunto dos tipos q permitem sequenciar operações
--getLine :: IO String
--putStr :: String -> IO ()
--getChar :: IO Char

--Sequenciando ações de IO:
--Operação do:
{-putStrLn :: String -> IO ()
putStrLn str = do putStr str
                  putStr "\n"
-}
--Operação if-then:
{-
putNtimes :: Int -> String -> IO ()
putNtimes n str
    = if n <=1
        then putStr str
        else do putStr str
                putNtimes (n-1) str
-}
--Lendo informações do teclado:
{-
getNput :: IO ()
getNput = do line <- getLine
             putStr line 
-}
-- <- passa como parametro o valor do teclado
-- (>>=) é o operador 'then' (no sentido de 'e')
-- ele sequencia duas operações feitas numa monad
-- exemplo: getLine >>= putStr :: IO ()
-- >> é parecido, mas ignora o resultado
-- exemplo: putStr "eu gosto " >> putStr "de batata"
-- Exemplo massa:
main :: IO ()
main = putStr "Digite seu nome:" >>
       getLine >>=
       \st -> 
           putStr "Ao contrario e':" >>
           putStrLn (reverse st)

--return pega um valor e empacota na monad
--O tipo Maybe
-- data Maybe t = Just t | Nothing
--(ou eh nada ou eh algo, ex: divisao por 0 = Nothing)
-- applyMaybe


