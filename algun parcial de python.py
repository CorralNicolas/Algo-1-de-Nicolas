###Parcial un toque flashero de diccionario y listas, pero no vi nada de pilas colas ni texto

lista=["UP","LLA","UP","LLA","LLA"]

def acomodar (lista:list[str]) -> list[str]:
    aux1:list[str] = []
    aux2:list[str] = []
    for i in lista:
        if i == "LLA":
            aux1.append(i)
        if i == "UP":
            aux2.append(i)
    return aux2 + aux1

print(lista)
print(acomodar(lista))
print(lista)

numeros = [1,2,5,-5,-2,10,11,12]
def pos_umbral(numeros:list[int],umbral:int) -> int:
    u = 0
    pos = 0
    for i in numeros:
        if i > 0:
           u = u + i
        if u >= umbral:
            return pos
        pos += 1
    return (-1)
print(numeros)
print(pos_umbral(numeros,100))
print(numeros)

def columnas_repetidas(matriz:list[list[int]]) -> bool:
    auxiliar = []
    auxiliar2 = []
    for lista in matriz:
        auxiliar.clear()
        auxiliar2.clear()
        for i in range(0,int(len(lista)/2)):
            auxiliar.append(lista[i])
        for i in range(int(len(lista)/2),len(lista)):
            auxiliar2.append(lista[i])
        if auxiliar != auxiliar2:
            return False
    return True

m = [[1,2,1,2],[-5,6,-5,6],[0,1,0,1]]
print(columnas_repetidas(m))

naciones= ["arg", "aus", "nz", "sud"]
torneos= {2023:["nz", "sud", "arg", "aus"], 2022:["nz", "sud", "aus", "arg"]}

def cuenta_posiciones_por_nacion(naciones:list[str],torneos:dict) -> dict:
    diccionarioaux:dict = {}
    for nacion in naciones:
        diccionarioaux[nacion] = [0]*len(naciones)
    for nacion in diccionarioaux.keys():
        for anio in torneos.keys():
            for i in range(0,len(naciones)):
                if torneos[anio][i] == nacion:
                    diccionarioaux[nacion][i] += 1
    return diccionarioaux

print(cuenta_posiciones_por_nacion(naciones,torneos))
