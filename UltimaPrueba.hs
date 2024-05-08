{-Generar Stock -}
generarStock :: [[Char]] -> [([Char],Integer)]
generarStock [] = []
generarStock (x:xs) = (x,1+cantidadAparece x xs) : generarStock (quitar x (x:xs))

cantidadAparece :: [Char] -> [[Char]] -> Integer
cantidadAparece x [] = 0
cantidadAparece x (a:xs) | x == a = 1 + cantidadAparece x xs
    |otherwise = cantidadAparece x xs

quitar :: [Char] -> [[Char]] -> [[Char]]
quitar xs [] = []
quitar xs (y:ys) | xs == y = quitar xs ys
    |otherwise = y : quitar xs ys

{-stockDeProducto: char x integer, char, devolver integer-}
stockDeProducto :: [([Char],Integer)] -> [Char] -> Integer
stockDeProducto [] _ = 0
stockDeProducto ((a,b):xs) ys | a == ys = b
    |otherwise = stockDeProducto xs ys

{-dineroEnStock : lista de char y enteros ,, lista de char y float  -}

dineroEnStock :: [([Char],Integer)] -> [([Char],Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock ((a,b):xs) ys = precioTotal (a,b) ys + dineroEnStock xs ys

precioTotal :: ([Char],Integer) -> [([Char],Float)] -> Float 
precioTotal (a,b) ((c,d):ys) | a == c = fromInteger b * d
    |otherwise = precioTotal (a,b) ys

{-aplicarOferta : lista char x entero cantidad,, lista char x  float precio, lista de char x float precio con descuento dependiendo-}

aplicarOferta :: [([Char],Integer)] -> [([Char],Float)] -> [([Char],Float)]
aplicarOferta [] _ = []
aplicarOferta ((a,b):xs) precios | b > 10 = (a,precioDe a precios * 0.8) : aplicarOferta xs precios
    |otherwise = (a,precioDe a precios) : aplicarOferta xs precios

precioDe :: [Char] -> [([Char],Float)] -> Float
precioDe x ((a,b):xs) | x == a = b
    | otherwise = precioDe x xs 
