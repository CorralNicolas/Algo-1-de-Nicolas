from queue import Queue as Cola
lista:Cola[(str,str)] = Cola()
lista.put(("Nico","comun"))
lista.put(("Rabi","comun"))
lista.put(("Rodra","vip"))
lista.put(("Michael","vip"))
lista.put(("Chino","comun"))
print(lista.queue)
def reordenar_cola_priorizando_vips(fila:Cola[(str,str)]) -> Cola:
    res:Cola[(str,str)] = Cola()
    colavip:Cola[(str,str)] = Cola()
    colacomun:Cola[(str,str)] = Cola()
    listaaux:Cola[(str,str)] = Cola()
    while not lista.empty():
        persona = lista.get()
        if persona[1] == "vip":
            colavip.put(persona)
            listaaux.put(persona)
        else:
            colacomun.put(persona)
            listaaux.put(persona)
    while not listaaux.empty():
        lista.put(listaaux.get())
    while not colavip.empty():
        res.put(colavip.get())
    while not colacomun.empty():
        res.put(colacomun.get())
    return res
print(reordenar_cola_priorizando_vips(lista).queue)
print(lista.queue)

def torneo_de_gallinas(estrategias:dict[(str,str)])-> dict[(str,str)]:
    diccionario_aux:dict[str,int] = dict()
    contador:int = 0
    for persona in estrategias.keys():
        for persona2 in estrategias.keys():
            if persona != persona2:
                if estrategias[persona] == "me desvio siempre" and estrategias[persona2] == "me desvio siempre":
                    contador += (-10)
                elif estrategias[persona] == "me desvio siempre" and estrategias[persona2] == "me la banco y no me desvio":
                    contador += (-15)
                elif estrategias[persona] == "me la banco y no me desvio" and estrategias[persona2] == "me desvio siempre":
                    contador += 10
                elif estrategias[persona] == "me la banco y no me desvio" and estrategias[persona2] == "me la banco y no me desvio":
                    contador += (-5)
        diccionario_aux[persona] = contador
        contador = 0
    return diccionario_aux
estrategia = {"nico":"me la banco y no me desvio","chino":"me la banco y no me desvio","rodra":"me desvio siempre","gasty":"me desvio siempre"}
print(torneo_de_gallinas(estrategia))

tablero = [["O","O","X","X","O"],["O","","X","","X"],["X","","X","","O"],["O","","X","","O"],["O","","X","","X"] ]

def quien_gano_el_tateti_facilito(tablero:list[list[str]]) -> int:
    lista_bool:list[str] = []
    contador_X = 0
    contador_O = 0
    for i in range(len(tablero)):
        for j in range(len(tablero)):
            if tablero[j][i] == "X":
                contador_X += 1
            if tablero[j][i] != "X":
                contador_X = 0
            if tablero[j][i] == "O":
                contador_O += 1
            if tablero[j][i] != "O":
                contador_O = 0
            if contador_O >= 3:
                lista_bool.append("O")
            if contador_X >= 3:
                lista_bool.append("X")
        contador_O = 0
        contador_X = 0
    if ("O" in lista_bool) and ("X" not in lista_bool):
        return 2
    if ("O" not in lista_bool) and ("X" in lista_bool):
        return 1
    if ("O" not in lista_bool) and ("X" not in lista_bool):
        return 3
    if ("O" in lista_bool) and ("X" in lista_bool):
        return 4
    
print(quien_gano_el_tateti_facilito(tablero))

def cuantos_sufijos_son_palindromos(texto:str) -> int:
    res:int = 0
    palabra = ""
    listadepalabras:list[str] = list()
    for letra in texto:
        if letra != " ":
            palabra = palabra + letra
        if letra == " ":
            listadepalabras.append(palabra)
            palabra = " "
    if palabra != " ":
        listadepalabras.append(palabra)
    sufijos = []
    for palabraaux in listadepalabras:
        while palabraaux != "":
            sufijos.append(palabraaux)
            a = len(palabraaux)
            aux = ""
            if a != 0:
                for i in range(1,a):
                    aux = aux + palabraaux[i]
                palabraaux = aux
    print(sufijos)
    for sufijo in sufijos:
        palabra_al_reves = ""
        for i in sufijo:
            palabra_al_reves = i + palabra_al_reves
        if palabra_al_reves == sufijo:
            res += 1
    return res

print(cuantos_sufijos_son_palindromos("hola como andas rey apa oco"))
