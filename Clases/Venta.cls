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

GetCantidad
	^ cantidad.!

GetClienteId
	^ cliente_id.!

GetEmpleadoId
	^ empleado_id.!

getId
    ^id.!

GetMonto
	^ monto.!

initialize: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad
	id := Venta nextId.  "Asigna el siguiente ID autoincremental"
	empleado_id := unEmpleado .
	cliente_id := unCliente .
	articulo_id := unArticulo .
	monto := unMonto.
	cantidad := unCantidad.

	
!

SetArticuloId: unArticulo
	articulo_id := unArticulo.!

SetCantidad: unCantidad
	cantidad := unCantidad.!

SetClienteId: unCliente
	cliente_id := unCliente.!

SetEmpleadoId: unEmpleado
	empleado_id := unEmpleado.!

setMonto: unMonto
	monto := unMonto.! !
!Venta categoriesFor: #getArticuloId!public! !
!Venta categoriesFor: #GetCantidad!public! !
!Venta categoriesFor: #GetClienteId!public! !
!Venta categoriesFor: #GetEmpleadoId!public! !
!Venta categoriesFor: #getId!public! !
!Venta categoriesFor: #GetMonto!public! !
!Venta categoriesFor: #initialize:cliente_id:articulo_id:monto:cantidad:!public! !
!Venta categoriesFor: #SetArticuloId:!public! !
!Venta categoriesFor: #SetCantidad:!public! !
!Venta categoriesFor: #SetClienteId:!public! !
!Venta categoriesFor: #SetEmpleadoId:!public! !
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

