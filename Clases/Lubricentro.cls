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

realizarVentaCliente: cliente_id empleado: empleado_id articulo: articulo_id cantidad: cantidad
    | venta monto articulo |
    
    articulo := listaArticulos detect: [:a | a getId = articulo_id] ifNone: [^self error: 'Artículo no encontrado'].
    monto := articulo getPrecio * cantidad.
    
    venta := Venta new.
    venta setEmpleadoId: empleado_id.
    venta setClienteId: cliente_id.
    venta setArticuloId: articulo_id.
    venta setCantidad: cantidad.
    venta setMonto: monto.
    
    listaVentas add: venta.!

setArticulos: unaLista
	listaArticulos := unaLista.
!

setClientes: unaLista
	listaClientes := unaLista.
!

setDecripcion: unaDescripcion
	descripcion := unaDescripcion.
!

setEmpleados: unaLista
	listaEmpleados := unaLista.
!

setId: unId
	id := unId.!

setNombre: unNombre
	nombre := unNombre.!

setOrdenesCompra: unaLista
	listaOrdenesCompra := unaLista.
!

setProveedores: unaLista
	listaProveedores := unaLista.!

setVentas: unaLista
	listaVentas := unaLista.
! !
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
!Lubricentro categoriesFor: #realizarVentaCliente:empleado:articulo:cantidad:!public! !
!Lubricentro categoriesFor: #setArticulos:!public! !
!Lubricentro categoriesFor: #setClientes:!public! !
!Lubricentro categoriesFor: #setDecripcion:!public! !
!Lubricentro categoriesFor: #setEmpleados:!public! !
!Lubricentro categoriesFor: #setId:!public! !
!Lubricentro categoriesFor: #setNombre:!public! !
!Lubricentro categoriesFor: #setOrdenesCompra:!public! !
!Lubricentro categoriesFor: #setProveedores:!public! !
!Lubricentro categoriesFor: #setVentas:!public! !

!Lubricentro class methodsFor!

CrearBasicoConNombre: unNombre descripcion: unaDescripcion
	^self new
		InitializeConNombre: unNombre
		descripcion: unaDescripcion
		listaVentas: OrderedCollection new
		listaArticulos: OrderedCollection new
		listaOrdenesCompra: OrderedCollection new
		listaProveedores: OrderedCollection new
		listaEmpleados: OrderedCollection new
		listaClientes: OrderedCollection new!

CrearConNombre: unNombre descripcion: unaDescrip listaVentas: unaListVent listaArticulos: unaListArt listaOrdenesCompra: unaListaOrdCom listaProveedores: unaListProv listaEmpleados: unaListEmple listaClientes: unaListClien
	^self new
		InitializeConNombre: unNombre
		descripcion: unaDescrip
		listaVentas: unaListVent
		listaArticulos: unaListArt
		listaOrdenesCompra: unaListaOrdCom
		listaProveedores: unaListProv
		listaEmpleados: unaListEmple
		listaClientes: unaListClien!

Initialize
	UltimoID := 0.!

NextId
	UltimoID isNil ifTrue: [ UltimoID := 0 ].
	UltimoID := UltimoID + 1.
	^UltimoID.!

RealizarOrdenCompraEmpleado: empleado_id articulo: articulo_id cantidad: cantidad proveedor: proveedor_id
    | orden |
    
    orden := OrdenDeCompra new.
    orden setEmpleadoId: empleado_id.
    orden setArticuloId: articulo_id.
    orden setCantidad: cantidad.
    orden setProveedorId: proveedor_id.
    
    "llistaOrdenCompra add: orden."! !
!Lubricentro class categoriesFor: #CrearBasicoConNombre:descripcion:!public! !
!Lubricentro class categoriesFor: #CrearConNombre:descripcion:listaVentas:listaArticulos:listaOrdenesCompra:listaProveedores:listaEmpleados:listaClientes:!public! !
!Lubricentro class categoriesFor: #Initialize!public! !
!Lubricentro class categoriesFor: #NextId!public! !
!Lubricentro class categoriesFor: #RealizarOrdenCompraEmpleado:articulo:cantidad:proveedor:!public! !

