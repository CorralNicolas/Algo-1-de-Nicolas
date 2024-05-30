#Pila: es secuencia de elementos, podes agragar arriba de todo, y si saco algo, arriba de todo. 
from queue import LifoQueue as Pila 


##pila.put(1)
##pila.put("Maria")
##elemento = pila.get() #saca lo primero que encuentra, osea , "maria" que fue el ultimo en llegar
##pila.empty() #bool que pregunta si esta vacia?
#get de algo vacio, explota

import random
random.randint(1,2)


def generar_nros_al_azar(cantidad:int,desde:int,hasta:int) -> Pila[int]:
    pila = Pila()
    for i in range (cantidad):
        pila.put(random.randint(desde,hasta))
    return pila

pila = generar_nros_al_azar(4,8,22)

def buscarmaximo(pilamax:Pila[int]) -> int:
    c = pilamax.get()
    d = Pila()
    d.put(c)
    while pilamax.empty() == False:
        b = pilamax.get()
        d.put(b)
        if b > c:
            c = b
    while d.empty() == False:
        pilamax.put(d.get())
    return c

print(pila.queue)
print(pila.queue)
print(buscarmaximo(pila))
print(pila.queue)


def contarlineas(nombre:str) -> int:
    archivo = open(nombre,"r")
    contenido = archivo.readlines()
    archivo.close()
    return len(contenido)

print(contarlineas("nuevoarchivo.txt"))

def clonar_sin_comentarios(nombre:str) -> list[str]:
    archivo = open(nombre,"r")
    contenido = archivo.readlines()
    archivoclonado = []
    for i in contenido:
        if i[0] == "#":
            archivoclonado.append(i)
    open("archivoclonado.txt","x")
    open("archivoclonado","w")
    archivoclonado.write(archivoclonado)
    archivoclonado.close
