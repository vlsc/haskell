-- FINISHEEEEEEEEEED

data Cmd = Cursor Int |
           Backspace Int |
           Delete Int |
           Insert String
           deriving (Read)
 

separaStringE s 0 = []
separaStringE s n = (head s):separaStringE (tail s) (n-1)

--junta :: [String] -> Int -> [String]
junta s 0 = ([], s)
junta s n = (separaStringE s n, separaStringD s n)

separaStringD [] 0 = []
separaStringD s 0 = (head s):separaStringD (tail s) 0
separaStringD s n = separaStringD (tail s) (n-1)


--apaga x caracteres atas do cursor, não incluindo o apontado por ele
back s 0 = []
back s n = (head s):back (tail s) (n-1)



del [] 0 = []
del s 0 = (head s):del (tail s) 0
del s n = del (tail s) (n-1)


insert s (Insert f) curPos = fst(junta s curPos)++f++snd(junta s curPos)


comandos :: String -> [Cmd] -> Int -> String
comandos s [] curPos = s
comandos s a curPos | fst(checa (head a)) == 1 = comandos s (tail a) (curPos+snd(checa (head a)))
                    | fst(checa (head a)) == 2 = comandos ((back(fst(junta s curPos)) (curPos - snd(checa (head a))))++snd(junta s curPos)) (tail a) (curPos - snd(checa (head a)))
                    | fst(checa (head a)) == 3 = comandos ((fst(junta s (curPos)))++(del(snd(junta s (curPos))) (snd(checa (head a))))) (tail a) (curPos) 
                    | fst(checa (head a)) == 4 = comandos (insert s (head a) curPos) (tail a) curPos    


checa (Cursor n) = (1, n)
checa (Backspace n) = (2, n)
checa (Delete n) = (3, n)
checa (Insert f) = (4,0)

editText s a = comandos s a 0



