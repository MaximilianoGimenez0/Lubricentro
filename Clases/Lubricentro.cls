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
    self getArticulos add: unArticulo.
Transcript show: 'Articulo agregado correctamente.'; cr!

agregarCliente: unCliente
    self getClientes add: unCliente.
Transcript show: 'Cliente agregado correctamente.'; cr!

agregarEmpleado: unEmpleado
    self getEmpleados add: unEmpleado.
	Transcript show: 'Empleado agregado correctamente.'; cr!

agregarProveedor: unProveedor
    self getProveedores add: unProveedor.
	Transcript show: 'Proveedor agregado correctamente.'; cr.!

eliminarArticuloConId: unId
    | articuloAEliminar |
    articuloAEliminar := self getArticulos detect: [:c | c getId = unId] ifNone: [nil].
    ^ articuloAEliminar isNil
        ifTrue: [
            Transcript show: 'Artículo no encontrado.'; cr.
            false
        ]
        ifFalse: [
            self getArticulos remove: articuloAEliminar.
            Transcript show: 'Artículo eliminado correctamente.'; cr.
            true
        ].!

eliminarClienteConId: unId
    | clienteAEliminar |
    clienteAEliminar := self getClientes detect: [:c | c getId = unId] ifNone: [nil].
   ^clienteAEliminar isNil
        ifTrue: [
		Transcript show: 'Cliente no encontrado.'; cr.
		false]
        ifFalse: [
           self getClientes remove: clienteAEliminar.
            Transcript show: 'Cliente eliminado correctamente.'; cr.
	     true
		].
!

eliminarEmpleadoConId: unId
    | empleadoAEliminar |
    empleadoAEliminar := self getEmpleados detect: [:c | c getId = unId] ifNone: [nil].
    ^empleadoAEliminar isNil
        ifTrue: [Transcript show: 'Empleado no encontrado.'; cr.
		false ]
        ifFalse: [
           self getEmpleados remove: empleadoAEliminar.
            Transcript show: 'Empleado eliminado correctamente.'; cr.
		true
        ].!

eliminarProveedorConId: unId
    | proveedorAEliminar |
    proveedorAEliminar := self getProveedores detect: [:c | c getId = unId] ifNone: [nil].
    ^proveedorAEliminar isNil
        ifTrue: [Transcript show: 'Proveedor no encontrado.'; cr.
			false
]
        ifFalse: [
           self getProveedores remove: proveedorAEliminar.
            Transcript show: 'Proveedor eliminado correctamente.'; cr.
		true
        ].!

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
self initialize.
	id := Lubricentro nextId.
	nombre := unNombre.
	descripcion := unaDescrip.
	listaVentas := unaListVent.
	listaArticulos := unaListArt.
	listaOrdenesCompra := unaListaOrdCom.
	listaProveedores := unaListProv.
	listaEmpleados := unaListEmple.
	listaClientes := unaListClien.!

mostrarArticuloConId: unId
  | articulo |
  articulo := self getArticulos detect: [:a | a getId = unId] ifNone: [nil].
  ^ articulo isNil
    ifTrue: [
      Transcript show: 'Artículo no encontrado.'; cr.
    ]
    ifFalse: [
      Transcript show: 'ID: ', articulo getId printString,
        ' - Tipo: ', articulo getTipo,
        ' - Stock actual: ', articulo getStock printString,
        ' - Stock mínimo: ', articulo getMinStock printString,
        ' - Stock máximo: ', articulo getMaxStock printString,
        ' - Precio: ', articulo getPrecio printString,
        ' - Fecha Vencimiento: ', articulo getVencimiento printString,
        ' - Fecha Elaboración: ', articulo getElaboracion printString; cr.
    ].
!

mostrarClienteConId: unId
  | cliente |
  cliente := self getClientes detect: [:c | c getId = unId] ifNone: [nil].
  ^ cliente isNil
    ifTrue: [
      Transcript show: 'Cliente no encontrado.'; cr.
    ]
    ifFalse: [
      Transcript show: 'ID: ', cliente getId printString; 
        show: ' - Nombre: ', cliente getNombre, ' ', cliente getApellido; cr.
      Transcript show: 'DNI: ', cliente getDNI printString; cr.
      Transcript show: 'Teléfono: ', cliente getTelefono printString; cr.
      Transcript show: 'Email: ', cliente getEmail printString; cr.
      Transcript show: 'Dirección: ', cliente getDireccion printString; cr.
    ].
!

mostrarEmpleadoConId: unId
  | empleado |
  empleado := self getEmpleados detect: [:e | e getId = unId] ifNone: [nil].
  empleado isNil
    ifTrue: [ Transcript show: 'Empleado no encontrado.'; cr ]
    ifFalse: [
      Transcript
        show: ('ID: ', empleado getId printString,
               ' - Nombre: ', empleado getNombre,
               ' - Apellido: ', empleado getApellido,
               ' - DNI: ', empleado getDNI printString,
               ' - Teléfono: ', empleado getTelefono printString,
               ' - Fecha Ingreso: ', empleado getFechaIngreso printString,
               ' - Sueldo: ', empleado getSueldo printString,
               ' - Cargo: ', empleado getCargo); cr.
    ].
!

mostrarProveedorConId: unId
  | proveedor |
  proveedor := self getProveedores detect: [:e | e getId = unId] ifNone: [nil].
  proveedor isNil
    ifTrue: [ Transcript show: 'Proveedor no encontrado.'; cr ]
    ifFalse: [
      Transcript
        show: ('ID: ', proveedor getId printString,
                       ' - Nombre: ', proveedor getNombre,
                       ' - Numero: ', proveedor getNumero printString,
                       ' - Dirección: ', proveedor getDireccion,
                       ' - CUIT: ', proveedor getCuit);cr.
    ].
!

realizarOrdenCompraEmpleado: empleado_id articulo: articulo_id cantidad: cantidad proveedor: proveedor_id precio: unPrecio fecha: unFecha
    | orden |
    
	orden := OrdenDeCompra CrearConEmpleado: empleado_id proveedor_id: proveedor_id articulo_id: articulo_id cantidad: cantidad precio: unPrecio fecha: unFecha.

	listaOrdenesCompra add: orden.
^ orden !

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
!Lubricentro categoriesFor: #eliminarArticuloConId:!public! !
!Lubricentro categoriesFor: #eliminarClienteConId:!public! !
!Lubricentro categoriesFor: #eliminarEmpleadoConId:!public! !
!Lubricentro categoriesFor: #eliminarProveedorConId:!public! !
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
!Lubricentro categoriesFor: #mostrarArticuloConId:!public! !
!Lubricentro categoriesFor: #mostrarClienteConId:!public! !
!Lubricentro categoriesFor: #mostrarEmpleadoConId:!public! !
!Lubricentro categoriesFor: #mostrarProveedorConId:!public! !
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

