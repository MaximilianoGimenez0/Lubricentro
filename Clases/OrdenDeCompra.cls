"Filed out from Dolphin Smalltalk 7"!

Object subclass: #OrdenDeCompra
	instanceVariableNames: 'id empleado_id proveedor_id articulo_id cantidad precio'
	classVariableNames: 'UltimoID'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
OrdenDeCompra guid: (GUID fromString: '{3DB29C28-C00E-4254-B175-7B606070E467}')!
OrdenDeCompra comment: ''!
!OrdenDeCompra categoriesForClass!Kernel-Objects! !
!OrdenDeCompra methodsFor!

GetArticuloId
    ^articulo_id.!

GetCantidad
    ^cantidad.!

GetEmpleadoId
    ^empleado_id.!

GetId
        ^id.!

GetPrecio
    ^precio.!

GetProveedorId
    ^proveedor_id.!

initialize: unEmpleado proveedor_id: unProveedor articulo_id: unArticulo cantidad: unaCantidad precio: unPrecio
	id := OrdenDeCompra nextId.  "Asigna el siguiente ID autoincremental"
	empleado_id := unEmpleado.
	proveedor_id := unProveedor.
	articulo_id := unArticulo.
        cantidad := unaCantidad.
	precio := unPrecio.!

SetArticuloId: unArticulo
	articulo_id := unArticulo.!

SetCantidadId: unaCantidad
	cantidad := unaCantidad.!

SetEmpleadoid: unEmpleado
	empleado_id := unEmpleado.!

SetPrecioId: unPrecio
	precio := unPrecio.!

SetProveedorId: unProveedor
	proveedor_id := unProveedor.! !
!OrdenDeCompra categoriesFor: #GetArticuloId!public! !
!OrdenDeCompra categoriesFor: #GetCantidad!public! !
!OrdenDeCompra categoriesFor: #GetEmpleadoId!public! !
!OrdenDeCompra categoriesFor: #GetId!public! !
!OrdenDeCompra categoriesFor: #GetPrecio!public! !
!OrdenDeCompra categoriesFor: #GetProveedorId!public! !
!OrdenDeCompra categoriesFor: #initialize:proveedor_id:articulo_id:cantidad:precio:!public! !
!OrdenDeCompra categoriesFor: #SetArticuloId:!public! !
!OrdenDeCompra categoriesFor: #SetCantidadId:!public! !
!OrdenDeCompra categoriesFor: #SetEmpleadoid:!public! !
!OrdenDeCompra categoriesFor: #SetPrecioId:!public! !
!OrdenDeCompra categoriesFor: #SetProveedorId:!public! !

!OrdenDeCompra class methodsFor!

CrearConEmpleado: unEmpleado proveedor_id: unProveedor articulo_id: unArticulo cantidad: unaCantidad precio: unPrecio 
	^ self new
		initialize: unEmpleado  proveedor_id: unProveedor articulo_id: unArticulo cantidad: unaCantidad precio: unPrecio;
		yourself.
!

initialize
    UltimoID := 0. "ID de inicio"!

nextId
    UltimoID isNil ifTrue: [ UltimoID := 0 ].  
    UltimoID := UltimoID + 1.
    ^UltimoID.! !
!OrdenDeCompra class categoriesFor: #CrearConEmpleado:proveedor_id:articulo_id:cantidad:precio:!public! !
!OrdenDeCompra class categoriesFor: #initialize!public! !
!OrdenDeCompra class categoriesFor: #nextId!public! !

