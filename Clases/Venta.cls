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

getArticulo
    ^articulo_id .!

getId
    ^id.!

initialize: unEmpleado cliente_id: unCliente articulo_id: unArticulo monto: unMonto cantidad: unCantidad
	id := Venta nextId.  "Asigna el siguiente ID autoincremental"
	empleado_id := unEmpleado .
	cliente_id := unCliente .
	articulo_id := unArticulo .
	monto := unMonto.
	cantidad := unCantidad.

	
! !
!Venta categoriesFor: #getArticulo!public! !
!Venta categoriesFor: #getId!public! !
!Venta categoriesFor: #initialize:cliente_id:articulo_id:monto:cantidad:!public! !

!Venta class methodsFor!

initialize
    UltimoID := 0.  "Comienza desde cero o el número que elijas."!

nextId
    UltimoID isNil ifTrue: [ UltimoID := 0 ].  "Verificar y asegurarse de que UltimoID no sea Nil"
    UltimoID := UltimoID + 1.  "Incrementa el ID"
    ^UltimoID.! !
!Venta class categoriesFor: #initialize!public! !
!Venta class categoriesFor: #nextId!public! !

