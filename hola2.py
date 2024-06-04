from queue import Queue as Cola
from queue import LifoQueue as Pila
import random  

def generar_num_al_azar(cantidad:int,desde:int,hasta:int) -> Cola:
    c = Cola()
    for i in range (0,cantidad):
        c.put(random.randint(desde,hasta))
    return c

def armar_secuencia_de_bingo() -> Cola:
    secuencia:list[int] = []
    cola = Cola()
    for i in range (0,100):
        secuencia.append(i)
    random.shuffle(secuencia)
    for i in secuencia:
        cola.put(i)
    return cola

def pertenece (a:int,b:list[int]) -> bool:
    for i in b:
        if a == i:
            return True
    return False

print(armar_secuencia_de_bingo().queue)

def jugar_carton_de_bingo(carton:list[int],bolillero:Cola[int]) -> int:
    contador = 0
    contador2 = 0
    aux = Cola()
    while not bolillero.empty():
        a = bolillero.get()
        aux.put(a)
        if pertenece(a,carton)==True:
            contador += 1
        contador2 += 1
        if contador == len(carton):
            while not bolillero.empty():
                a= bolillero.get()
                aux.put(a)
            while not aux.empty():
                bolillero.put(aux.get())
            return contador2

g = Cola()
g.put(17)
g.put(10)
g.put(1)
g.put(2)
g.put(3)
g.put(4)
g.put(5)
g.put(6)
g.put(7)
c = [1,6,4]
print(g.queue)
print(jugar_carton_de_bingo(c,g))

print(g.queue)

##Ejercicio 19

def agrupar_por_longitud(lista:list[str]) -> dict:
    diccionario:dict = {}
    for i in lista:
        clave = len (i) 
        if clave in diccionario: 
            diccionario[clave] += 1
        else:
            diccionario[clave] = 1
    return diccionario

#print(agrupar_por_longitud(["hola","mundo"]))

def leer_archivo_y_agrupar(nombre):
    lista = []
    palabra:str = ""
    archivo = open(nombre,"r")
    contenido = archivo.readlines()
    print(contenido)
    for linea in contenido:
        palabra = ""
        for i in linea:
            if i != " ":
                palabra = palabra + i
            if i == " ":
                lista.append(palabra)
                palabra = ""
        lista.append(palabra)
        palabra = ""
    listado = agrupar_por_longitud(lista)
    archivo.close()
    return listado

print(leer_archivo_y_agrupar("/home/Estudiante/nuevoarchivo.txt"))
