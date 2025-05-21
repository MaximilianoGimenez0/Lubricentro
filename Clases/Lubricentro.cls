"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Lubricentro
	instanceVariableNames: 'id nombre descripcion listaVentas listaArticulos listaOrdenesCompra listaProveedores listaEmpleados listaClientes'
	classVariableNames: 'UltimoID'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Lubricentro guid: (GUID fromString: '{9DCB3691-9B84-49F1-AEAE-201C37EBEE22}')!
Lubricentro comment: ''!
!Lubricentro categoriesForClass!Kernel-Objects! !
!Lubricentro methodsFor!

agregarArticulo: unArticulo
    self getArticulos add: unArticulo.!

agregarCliente: unCliente
    self getClientes add: unCliente.!

agregarEmpleado: unEmpleado
    self getEmpleados add: unEmpleado.!

agregarProveedor: unProveedor
    self getProveedores add: unProveedor.!

getArticulos
    ^ listaArticulos!

getClientes
    ^ listaClientes!

getDescripcion
    ^ descripcion!

getEmpleados
    ^ listaEmpleados!

getId
    ^ id!

getNombre
    ^ nombre!

getOrdenesDeCompra
    ^ listaOrdenesCompra!

getProveedores
    ^ listaProveedores!

getVentas
    ^ listaVentas!

initialize
	super initialize.
	"Opcional: inicializar listas vacías por defecto"
	listaVentas := OrderedCollection new.
	listaArticulos := OrderedCollection new.
	listaOrdenesCompra := OrderedCollection new.
	listaProveedores := OrderedCollection new.
	listaEmpleados := OrderedCollection new.
	listaClientes := OrderedCollection new.
!

initializeConNombre: unNombre descripcion: unaDescrip listaVentas: unaListVent listaArticulos: unaListArt listaOrdenesCompra: unaListaOrdCom listaProveedores: unaListProv listaEmpleados: unaListEmple listaClientes: unaListClien
	id := Lubricentro nextId.
	nombre := unNombre.
	descripcion := unaDescrip.
	listaVentas := unaListVent.
	listaArticulos := unaListArt.
	listaOrdenesCompra := unaListaOrdCom.
	listaProveedores := unaListProv.
	listaEmpleados := unaListEmple.
	listaClientes := unaListClien.!

realizarOrdenCompraEmpleado: empleado_id articulo: articulo_id cantidad: cantidad proveedor: proveedor_id precio: unPrecio fecha: unFecha
    | orden |
    
	orden := OrdenDeCompra CrearConEmpleado: empleado_id proveedor_id: proveedor_id articulo_id: articulo_id cantidad: cantidad precio: unPrecio fecha: unFecha.

	listaOrdenesCompra add: orden.!

realizarVentaCliente: cliente_id empleado: empleado_id articulo: articulo_id cantidad: cantidad
    | venta monto articulo |
    
    articulo := listaArticulos detect: [:a | a getId = articulo_id] ifNone: [^self error: 'Artículo no encontrado'].
    
    monto := articulo getPrecio * cantidad.
    
    venta := Venta 
        CrearConEmpleado: empleado_id
        cliente_id: cliente_id
        articulo_id: articulo_id
        monto: monto
        cantidad: cantidad.
    
    listaVentas add: venta.
    
    ^ venta
!

setArticulos: unaLista
	listaArticulos := unaLista.
!

setClientes: unaLista
	listaClientes := unaLista.
!

setDecripcion: unaDescripcion
	descripcion := unaDescripcion.
!

SetDecripcion: unaDescripcion
	descripcion := unaDescripcion.
!

setEmpleados: unaLista
	listaEmpleados := unaLista.
!

setId: unId
	id := unId.!

setNombre: unNombre
	nombre := unNombre.!

SetNombre: unNombre
	nombre := unNombre.!

setOrdenesCompra: unaLista
	listaOrdenesCompra := unaLista.
!

setProveedores: unaLista
	listaProveedores := unaLista.!

setVentas: unaLista
	listaVentas := unaLista.
! !
!Lubricentro categoriesFor: #agregarArticulo:!public! !
!Lubricentro categoriesFor: #agregarCliente:!public! !
!Lubricentro categoriesFor: #agregarEmpleado:!public! !
!Lubricentro categoriesFor: #agregarProveedor:!public! !
!Lubricentro categoriesFor: #getArticulos!accessing!public! !
!Lubricentro categoriesFor: #getClientes!accessing!public! !
!Lubricentro categoriesFor: #getDescripcion!accessing!public! !
!Lubricentro categoriesFor: #getEmpleados!accessing!public! !
!Lubricentro categoriesFor: #getId!accessing!public! !
!Lubricentro categoriesFor: #getNombre!accessing!public! !
!Lubricentro categoriesFor: #getOrdenesDeCompra!accessing!public! !
!Lubricentro categoriesFor: #getProveedores!accessing!public! !
!Lubricentro categoriesFor: #getVentas!accessing!public! !
!Lubricentro categoriesFor: #initialize!public! !
!Lubricentro categoriesFor: #initializeConNombre:descripcion:listaVentas:listaArticulos:listaOrdenesCompra:listaProveedores:listaEmpleados:listaClientes:!public! !
!Lubricentro categoriesFor: #realizarOrdenCompraEmpleado:articulo:cantidad:proveedor:precio:fecha:!public! !
!Lubricentro categoriesFor: #realizarVentaCliente:empleado:articulo:cantidad:!public! !
!Lubricentro categoriesFor: #setArticulos:!public! !
!Lubricentro categoriesFor: #setClientes:!public! !
!Lubricentro categoriesFor: #setDecripcion:!public! !
!Lubricentro categoriesFor: #SetDecripcion:!public! !
!Lubricentro categoriesFor: #setEmpleados:!public! !
!Lubricentro categoriesFor: #setId:!public! !
!Lubricentro categoriesFor: #setNombre:!public! !
!Lubricentro categoriesFor: #SetNombre:!public! !
!Lubricentro categoriesFor: #setOrdenesCompra:!public! !
!Lubricentro categoriesFor: #setProveedores:!public! !
!Lubricentro categoriesFor: #setVentas:!public! !

!Lubricentro class methodsFor!

crearBasicoConNombre: unNombre descripcion: unaDescripcion
	^ self new
		initializeConNombre: unNombre
		descripcion: unaDescripcion
		listaVentas: OrderedCollection new
		listaArticulos: OrderedCollection new
		listaOrdenesCompra: OrderedCollection new
		listaProveedores: OrderedCollection new
		listaEmpleados: OrderedCollection new
		listaClientes: OrderedCollection new
!

crearConNombre: unNombre 
    descripcion: unaDescrip 
    listaVentas: unaListVent 
    listaArticulos: unaListArt 
    listaOrdenesCompra: unaListaOrdCom 
    listaProveedores: unaListProv 
    listaEmpleados: unaListEmple 
    listaClientes: unaListClien
	^ self new
		initializeConNombre: unNombre
		descripcion: unaDescrip
		listaVentas: unaListVent
		listaArticulos: unaListArt
		listaOrdenesCompra: unaListaOrdCom
		listaProveedores: unaListProv
		listaEmpleados: unaListEmple
		listaClientes: unaListClien
!

initialize
	UltimoID := 0.!

nextId
	UltimoID isNil ifTrue: [ UltimoID := 0 ].
	UltimoID := UltimoID + 1.
	^UltimoID.! !
!Lubricentro class categoriesFor: #crearBasicoConNombre:descripcion:!public! !
!Lubricentro class categoriesFor: #crearConNombre:descripcion:listaVentas:listaArticulos:listaOrdenesCompra:listaProveedores:listaEmpleados:listaClientes:!public! !
!Lubricentro class categoriesFor: #initialize!public! !
!Lubricentro class categoriesFor: #nextId!public! !

