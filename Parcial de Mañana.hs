hayQueCodificar :: Char -> [(Char,Char)] -> Bool 
hayQueCodificar _ [] = False
hayQueCodificar c (x:xs) | c == fst x = True
    |otherwise = hayQueCodificar c xs

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c _ [] = 0
cuantasVecesHayQueCodificar c (x:xs) (y:ys) | hayQueCodificar c (y:ys) == False = 0
    |otherwise = cantidadAparece c (x:xs)

cantidadAparece :: Char -> [Char] -> Int
cantidadAparece _ [] = 0
cantidadAparece c (x:xs) | c == x = 1 + cantidadAparece c xs
    |otherwise = cantidadAparece c xs 

loQueMasHayQueCodificarAux :: [Char] -> [Char] -> [(Char,Char)] -> Char
loQueMasHayQueCodificarAux _ _ [] = ' '
loQueMasHayQueCodificarAux zs [x] ys = x
loQueMasHayQueCodificarAux zs (x:y:xs) ys | cuantasVecesHayQueCodificar x zs ys >= cuantasVecesHayQueCodificar y zs ys = loQueMasHayQueCodificarAux zs (x:xs) ys
    |otherwise = loQueMasHayQueCodificarAux zs (y:xs) ys

loQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
loQueMasHayQueCodificar _ [] = ' '
loQueMasHayQueCodificar xs ys = loQueMasHayQueCodificarAux xs xs ys

codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [x] [] = [x]
codificarFrase [] _ = [] 
codificarFrase (x:xs) zs = reemplazarSi x zs : codificarFrase xs zs 

reemplazarSi :: Char -> [(Char,Char)] -> Char
reemplazarSi x [] = x
reemplazarSi x (y:ys) | x == fst y = snd y
    |otherwise = reemplazarSi x ys 
