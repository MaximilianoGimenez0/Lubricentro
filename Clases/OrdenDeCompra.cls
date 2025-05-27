"Filed out from Dolphin Smalltalk 7"!

Object subclass: #OrdenDeCompra
	instanceVariableNames: 'id empleado_id proveedor_id articulo_id cantidad precio fecha'
	classVariableNames: 'UltimoID'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
OrdenDeCompra guid: (GUID fromString: '{3DB29C28-C00E-4254-B175-7B606070E467}')!
OrdenDeCompra comment: ''!
!OrdenDeCompra categoriesForClass!Kernel-Objects! !
!OrdenDeCompra methodsFor!

getArticuloId
    ^articulo_id.!

getCantidad
    ^cantidad.!

getEmpleadoId
    ^empleado_id.!

getFecha
    ^fecha.!

getId
        ^id.!

getPrecio
    ^precio.!

getProveedorId
    ^proveedor_id.!

initialize: unEmpleado proveedor_id: unProveedor articulo_id: unArticulo cantidad: unCantidad precio: unPrecio fecha: unFecha
	id := OrdenDeCompra nextId.  "Asigna el siguiente ID autoincremental"
	empleado_id := unEmpleado.
	proveedor_id := unProveedor.
	articulo_id := unArticulo.
        cantidad := unCantidad.
	precio := unPrecio.
	fecha := unFecha.!

printString
	^ 'Orden ID: ', id printString,
	  ' | Empleado ID: ', empleado_id printString,
	  ' | Artículo ID: ', articulo_id printString,
	  ' | Cantidad: ', cantidad printString,
	  ' | Proveedor ID: ', proveedor_id printString,
	  ' | Precio: ', precio printString,
	  ' | Fecha: ', fecha printString.!

setArticuloId: unArticulo
	articulo_id := unArticulo.!

setCantidadId: unCantidad
	cantidad := unCantidad.!

setEmpleadoid: unEmpleado
	empleado_id := unEmpleado.!

setFecha: unFecha
	fecha := unFecha.!

setPrecio: unPrecio
	precio := unPrecio.!

setProveedorId: unProveedor
	proveedor_id := unProveedor.! !
!OrdenDeCompra categoriesFor: #getArticuloId!public! !
!OrdenDeCompra categoriesFor: #getCantidad!public! !
!OrdenDeCompra categoriesFor: #getEmpleadoId!public! !
!OrdenDeCompra categoriesFor: #getFecha!public! !
!OrdenDeCompra categoriesFor: #getId!public! !
!OrdenDeCompra categoriesFor: #getPrecio!public! !
!OrdenDeCompra categoriesFor: #getProveedorId!public! !
!OrdenDeCompra categoriesFor: #initialize:proveedor_id:articulo_id:cantidad:precio:fecha:!public! !
!OrdenDeCompra categoriesFor: #printString!public! !
!OrdenDeCompra categoriesFor: #setArticuloId:!public! !
!OrdenDeCompra categoriesFor: #setCantidadId:!public! !
!OrdenDeCompra categoriesFor: #setEmpleadoid:!public! !
!OrdenDeCompra categoriesFor: #setFecha:!public! !
!OrdenDeCompra categoriesFor: #setPrecio:!public! !
!OrdenDeCompra categoriesFor: #setProveedorId:!public! !

!OrdenDeCompra class methodsFor!

CrearConEmpleado: unEmpleado proveedor_id: unProveedor articulo_id: unArticulo cantidad: unCantidad precio: unPrecio  fecha: unFecha
	^ self new
		initialize: unEmpleado  proveedor_id: unProveedor articulo_id: unArticulo cantidad: unCantidad precio: unPrecio fecha:unFecha;
		yourself.
!

initialize
    UltimoID := 0. "ID de inicio"!

nextId
    UltimoID isNil ifTrue: [ UltimoID := 0 ].  
    UltimoID := UltimoID + 1.
    ^UltimoID.! !
!OrdenDeCompra class categoriesFor: #CrearConEmpleado:proveedor_id:articulo_id:cantidad:precio:fecha:!public! !
!OrdenDeCompra class categoriesFor: #initialize!public! !
!OrdenDeCompra class categoriesFor: #nextId!public! !

