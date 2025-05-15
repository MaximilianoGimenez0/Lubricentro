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
initialize: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad
	id := Venta nextId.  "Asigna el siguiente ID autoincremental"
	empleado_id := unEmpleado .
	cliente_id := unCliente .
	articulo_id := unArticulo .
	monto := unMonto.
	cantidad := unCantidad.

2)
initialize
    UltimoID := 0. "ID de inicio"

3)
nextId
    UltimoID isNil ifTrue: [ UltimoID := 0 ].  "Verificar y asegurarse de que UltimoID no sea Nil"
    UltimoID := UltimoID + 1.  "Incrementa el ID"
    ^UltimoID.

4)
CrearConEmpleado: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad
	^ self new
		initialize: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad;
		yourself.
	




