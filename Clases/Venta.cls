"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Venta
	instanceVariableNames: 'id empleado_id cliente_id articulo_id monto cantidad'
	classVariableNames: 'UltimoID'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Venta guid: (GUID fromString: '{EFAC0A7E-89DF-4D2C-A67E-C64E003437F0}')!
Venta comment: ''!
!Venta categoriesForClass!Kernel-Objects! !
!Venta methodsFor!

getArticuloId
    ^articulo_id .!

getCantidad
	^ cantidad.!

getClienteId
	^ cliente_id.!

getEmpleadoId
	^ empleado_id.!

getId
    ^id.!

getMonto
	^ monto.!

initialize: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad
	id := Venta nextId.  "Asigna el siguiente ID autoincremental"
	empleado_id := unEmpleado .
	cliente_id := unCliente .
	articulo_id := unArticulo .
	monto := unMonto.
	cantidad := unCantidad.

	
!

printString
	^ 'Orden ID: ', id printString,
	  ' | Empleado ID: ', empleado_id printString,
	  ' | Cliente ID: ', cliente_id printString,
	  ' | Artículo ID: ', articulo_id printString,
	  ' | Monto: ', monto printString,
	  ' | Cantidad: ', cantidad printString,
	  ' | Fecha: ', Date today printString.!

setArticuloId: unArticulo
	articulo_id := unArticulo.!

setCantidad: unCantidad
	cantidad := unCantidad.!

setClienteId: unCliente
	cliente_id := unCliente.!

setEmpleadoId: unEmpleado
	empleado_id := unEmpleado.!

setMonto: unMonto
	monto := unMonto.! !
!Venta categoriesFor: #getArticuloId!public! !
!Venta categoriesFor: #getCantidad!public! !
!Venta categoriesFor: #getClienteId!public! !
!Venta categoriesFor: #getEmpleadoId!public! !
!Venta categoriesFor: #getId!public! !
!Venta categoriesFor: #getMonto!public! !
!Venta categoriesFor: #initialize:cliente_id:articulo_id:monto:cantidad:!public! !
!Venta categoriesFor: #printString!public! !
!Venta categoriesFor: #setArticuloId:!public! !
!Venta categoriesFor: #setCantidad:!public! !
!Venta categoriesFor: #setClienteId:!public! !
!Venta categoriesFor: #setEmpleadoId:!public! !
!Venta categoriesFor: #setMonto:!public! !

!Venta class methodsFor!

CrearConEmpleado: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad
	^ self new
		initialize: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad;
		yourself.
	
!

initialize
    UltimoID := 0. "ID de inicio"!

nextId
    UltimoID isNil ifTrue: [ UltimoID := 0 ].  "Verificar y asegurarse de que UltimoID no sea Nil"
    UltimoID := UltimoID + 1.  "Incrementa el ID"
    ^UltimoID.! !
!Venta class categoriesFor: #CrearConEmpleado:cliente_id:articulo_id:monto:cantidad:!public! !
!Venta class categoriesFor: #initialize!public! !
!Venta class categoriesFor: #nextId!public! !

