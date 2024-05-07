{- Aprobo mas de N o mas materias materias-}

aproboMasDeNMateriasAux :: [([Char],[Integer])] -> [Char] -> Integer
aproboMasDeNMateriasAux ((xalumno,xnotas):registro) alumno | alumno == xalumno = contarMateriasAprobadas (xnotas) 
    | otherwise = aproboMasDeNMateriasAux registro alumno

contarMateriasAprobadas :: [Integer] -> Integer
contarMateriasAprobadas [] = 0
contarMateriasAprobadas (x:xs) | x >= 4 = 1 + contarMateriasAprobadas xs
    |otherwise = contarMateriasAprobadas xs

aproboMasDeNMaterias :: [([Char],[Integer])] -> [Char] -> Integer -> Bool
aproboMasDeNMaterias registro alumno n | n >= aproboMasDeNMateriasAux registro alumno = False
    |otherwise = True

{-Ejercicio N 2, Devolver lista de los mejores alumnos (promedio mejor o igual que 8, y no tiene aplazos)-}

buenosAlumnos:: [([Char],[Integer])] -> [[Char]]
buenosAlumnos [] = []
buenosAlumnos ((x,y):xs) | ningunAplazo y == True && promedio y >= 8 = [x] ++ buenosAlumnos xs
    | otherwise = buenosAlumnos xs 

ningunAplazo :: [Integer] -> Bool
ningunAplazo [] = True 
ningunAplazo (x:xs) | x >= 4 = ningunAplazo xs
    | otherwise = False

promedio :: [Integer] -> Integer
promedio [] = 0
promedio xs =  div (fromIntegral (suma xs)) (fromIntegral (longitud xs))

suma :: [Integer] -> Integer
suma [] = 0
suma (x:xs) = x + suma xs 

longitud :: [Integer] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs 

{- 3) Mejor Promedio -}
mejorPromedio :: [([Char],[Integer])] -> [Char]
mejorPromedio [] = ""
mejorPromedio [(x,y)] = x
mejorPromedio ((x,y):(a,b):xs) | promedio y >= promedio b = mejorPromedio ((x,y):xs)
    | otherwise = mejorPromedio ((a,b):xs)

{- 4) Se Graduo con honores: 1) Aprobo mas de N materias (siendo n igual a cantidad de materias -1) 2) Pertenece a BuenosAlumnos 
3) Esta como mucho a 1 del mejor promedio de todos-}

seGraduoConHonores :: [([Char],[Integer])] -> Integer -> [Char] -> Bool
seGraduoConHonores xs n alumno | aproboMasDeNMaterias xs alumno (n-1) && pertenece alumno (buenosAlumnos xs) && promedioInt xs alumno - mejorpromedioInt xs < 1 = True
    |otherwise = False

pertenece :: [Char] -> [[Char]] -> Bool
pertenece x [] = False
pertenece x (y:ys) | x == y = True
    |otherwise = pertenece x ys

promedioInt :: [([Char],[Integer])] -> [Char] -> Integer
promedioInt ((x,y):xs) alumno | alumno == x = promedio y
    |otherwise = promedioInt xs alumno

mejorpromedioInt :: [([Char],[Integer])] -> Integer
mejorpromedioInt [(x,y)] = promedio y
mejorpromedioInt ((x,y):(a,b):xs) | promedio y >= promedio b = mejorpromedioInt ((x,y):xs)
    |otherwise = mejorpromedioInt ((a,b):xs)

