# 🐬 Proyecto Dolphin Smalltalk – LUBRICENTRO

## 📁 Estructura del Proyecto

- Todas las clases deben estar ubicadas dentro de la carpeta:
- /Clases
  
## Para desarrollar usen la rama 'develop' y cuando esté lista manden el pull request

## 🔧 Cada clase debe tener la siguiente estructura:

### 1. 🧩 `initialize` (de instancia) --> Setea variables 

### 2. 🧩 `initialize` (clase) --> Inicializa el contador de id

### 3. 🧩 `nextId` (clase) --> devuelve el proximo id e incrementa el contador de id´s

### 4. 🧩 `crear` (clase) --> encapsula la creación del objeto en un solo metodo 

```smalltalk

1)
initialize: unNombre numero: unNumero direccion: unaDireccion cuit: unCuit
	id := self class nextId.
	nombre := unNombre.
	numero := unNumero.
	direccion := unaDireccion.
	cuit := unCuit.

2)
NombreClase class>>initialize
	NextId := 1.

3)
NombreClase class>>nextId
	| idActual |
	idActual := NextId.
	NextId := NextId + 1.
	^ idActual.

4)
NombreClase class>>crearConNombre: unNombre numero: unNumero direccion: unaDireccion cuit: unCuit
	^ self new
		initialize: unNombre numero: unNumero direccion: unaDireccion cuit: unCuit;
		yourself.



