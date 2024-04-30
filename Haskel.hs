{-problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
}
1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen 
(sin importar el orden) son iguales.-}

relacionesValidas ::  [(String,String)] -> Bool
relacionesValidas [] = True
relacionesValidas [t] = True
relacionesValidas (x:y:xs) | fst x == snd x = False
    | fst y == snd y = False
    | fst x == fst y && snd x == snd y = False
    | fst x == snd y && snd x == fst y = False
    | otherwise = compararRelaciones x xs && relacionesValidas (y:xs)

compararRelaciones :: (String,String) -> [(String,String)] -> Bool
compararRelaciones x [] = True 
compararRelaciones x (y:xs) | fst x == fst y && snd x == snd y = False
    | fst x == snd y && snd x == fst y = False
    | otherwise = compararRelaciones x xs

{-problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones-}

pertenece :: String -> [String] -> Bool 
pertenece _ [] = False
pertenece x (y:xs) | x == y = True
    | otherwise = pertenece x xs

personas :: [(String,String)] -> [String]
personas [] = []
personas [(x,y)] = [x,y]
personas ((x,y):xs) | pertenece x (personas xs) && pertenece y (personas xs) = personas xs
    | pertenece x (personas xs) = y:personas xs
    | pertenece y (personas xs) = x:personas xs
    | otherwise = x:y:personas xs

{-problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
-}


amigosDe :: String -> [(String,String)] -> [String]
amigosDe x [] = []
amigosDe x ((a,b):xs) | x == a = b : amigosDe x xs
    | x == b = a : amigosDe x xs
    | otherwise = amigosDe x xs 

--ejercicio 4

--problema personaConMasAmigos (relaciones: seqhStringxStringi) : String {
--requiere: { relaciones no vacía }
--requiere: { relacionesValidas(relaciones) }
--asegura: { res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}

cuantasvecesaparece :: String -> [(String,String)] -> Integer
cuantasvecesaparece _ [] = 0
cuantasvecesaparece n ((x,y):xs) | n == x = 1 + cuantasvecesaparece n xs
    | n == y = 1 + cuantasvecesaparece n xs 
    | otherwise = cuantasvecesaparece n xs


solucion :: [(String,String)] -> [(String,Integer)]
solucion [(x,y)] = [(x,1)]
solucion ((x,y):xs) | cuantasvecesaparece x xs > cuantasvecesaparece y xs = (x,cuantasvecesaparece x xs):solucion xs
 | cuantasvecesaparece y xs > cuantasvecesaparece x xs = (y,cuantasvecesaparece y xs):solucion xs
 | otherwise = (y,cuantasvecesaparece y xs):solucion xs

aux1personaConMasAmigos :: [(String,String)] -> [(String,Integer)]
aux1personaConMasAmigos [(x,y)] = solucion [(x,y)]
aux1personaConMasAmigos ((x,y):xs) = solucion ((x,y):xs)

aux2personaConMasAmigos :: [(String,Integer)] -> String
aux2personaConMasAmigos [(x,_)] = x
aux2personaConMasAmigos ((x,a):(y,b):xs) | a > b = aux2personaConMasAmigos ((x,a):xs)
    | b> a = aux2personaConMasAmigos ((y,b):xs)
    | otherwise = aux2personaConMasAmigos ((x,a):xs)

personaConMasAmigos :: [(String,String)] -> String
personaConMasAmigos [(x,_)] = x
personaConMasAmigos xs = aux2personaConMasAmigos(aux1personaConMasAmigos xs)
