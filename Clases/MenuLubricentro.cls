"Filed out from Dolphin Smalltalk 7"!

Object subclass: #MenuLubricentro
	instanceVariableNames: 'lubricentro'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
MenuLubricentro guid: (GUID fromString: '{578290E4-514A-4C45-BCD8-2A6D25387522}')!
MenuLubricentro comment: ''!
!MenuLubricentro categoriesForClass!Kernel-Objects! !
!MenuLubricentro methodsFor!

articulosPorTipo

| tiposArticulos |

Transcript clear.

tiposArticulos := lubricentro getArticulos collect: [:art | art getTipo].

Transcript show: 'Tipos de artículos:'; cr.

tiposArticulos do: [:tipo |
    Transcript show: tipo; cr.
].

MessageBox warning: 'Presione Aceptar para continuar.'.
!

consultarPorStock
    | seguirConsultando stockLimite opcionIngresada  articulosFiltrados stockIngresado |

seguirConsultando := true.

[seguirConsultando] whileTrue: [

    Transcript clear.
    Transcript show: 'Ingrese el valor de stock para filtrar'.
    stockIngresado := Prompter prompt: 'Stock: '.
    ((stockIngresado isNil) or: [stockIngresado isEmpty]) ifTrue: [  "Esto obliga al usuario a ingresar un valor "
        MessageBox warning: 'Debe ingresar un valor.'.
        ^self
    ].
   Transcript clear.
    stockLimite := stockIngresado asNumber.

"Un mini menu"
    Transcript show: '1 - Artículos con stock menor o igual al ingresado'; cr.
    Transcript show: '2 - Artículos con stock mayor al ingresado'; cr.


	[
	    opcionIngresada := Prompter prompt: 'Ingrese una opción de filtro'.

	    ((opcionIngresada = '1') or: [opcionIngresada = '2'])
		ifTrue: [true] "Si la opcion es valida sale del while"
		ifFalse: [
		    MessageBox warning: 'Opción inválida. Debe ingresar 1 o 2.'.   "Si la opcion es falsa vuelve continua en el bucle y le pide de nuevo la opcion"
		    false
		].
	] whileFalse.

    opcionIngresada = '1' ifTrue: [
        articulosFiltrados := lubricentro getArticulos select: [:art | art getStock <= stockLimite]. "Devuelve los que cumple la condicion"
    ].
    opcionIngresada = '2' ifTrue: [
        articulosFiltrados := lubricentro getArticulos reject: [:art | art getStock <= stockLimite]. "Devuelve los que no cumple la condicion"
    ].

    Transcript clear.
    Transcript show: 'Artículos filtrados:'; cr.
    articulosFiltrados isEmpty
        ifTrue: [Transcript show: 'No se encontraron artículos con ese criterio.'; cr.]
        ifFalse: [
            articulosFiltrados do: [:art |
                Transcript show: art printString; cr.
            ].
        ].

    MessageBox warning: 'Ingrese Aceptar para continuar'.


    (MessageBox confirm: '¿Desea realizar otra consulta?')
        ifTrue: [seguirConsultando := true]
        ifFalse: [seguirConsultando := false].
].!

contarVentasDeUnEmpleado
| empleadoID empleado ventasPorEmpleado seguirConsultando |

seguirConsultando := true.

[seguirConsultando] whileTrue: [

    Transcript clear.
    Transcript show: 'Empleados Disponibles:'; cr.
    lubricentro getEmpleados do: [:empl |
        Transcript show: 'ID: ', empl getId printString, ' - ', empl getNombre, ' ', empl getApellido; cr.
    ].

    [
        empleadoID := (Prompter prompt: 'Ingrese el ID del Empleado:') asNumber.
        empleado := lubricentro getEmpleados detect: [:e | e getId = empleadoID ] ifNone: [ nil ].
        empleado isNil ifTrue: [
            MessageBox warning: 'ID ingresado inválido. Intente nuevamente.'.
            false
        ] ifFalse: [ true ]
    ] whileFalse.

    ventasPorEmpleado := Dictionary new. 
    lubricentro getVentas do: [:venta |
        | idEmpleado |
        idEmpleado := venta getEmpleadoId.
        ventasPorEmpleado at: idEmpleado ifAbsentPut: [0]. 
        ventasPorEmpleado at: idEmpleado put: ((ventasPorEmpleado at: idEmpleado) + 1).
    ].

    "El empleado se registra con valor 0 si no hizo ventas"
    ventasPorEmpleado at: empleadoID ifAbsentPut: [0].

"Impresion de diccionario"
	     Transcript cr.
             Transcript show: 'El empleado ', empleado getNombre, ' ', empleado getApellido.
             Transcript nextPutAll: ' (ID: ', empleadoID printString, ') realizó: ';
             nextPutAll: (ventasPorEmpleado at: empleadoID) printString;
             nextPutAll: ' ventas.'; cr.

    (MessageBox confirm: '¿Desea consultar otro empleado?')
        ifTrue: [seguirConsultando := true]
        ifFalse: [seguirConsultando := false].
].

!

efectuarOrdenCompra
|seguirConsultando empleadoID proveedorID articuloID cantidad precio empleado articulo proveedor orden nuevoStockValido nuevoStock|

seguirConsultando := true.

[seguirConsultando] whileTrue: [

[ 
    Transcript clear.
    Transcript show: 'Empleados disponibles:'; cr.
    lubricentro getEmpleados do: [:empl|
        Transcript show: 'ID: ', empl getId printString, ' - ', empl getNombre, ' ', empl getApellido; cr.
    ].
    empleadoID := (Prompter prompt: 'Ingrese el ID del Empleado') asNumber.
    empleado := lubricentro getEmpleados detect: [:e | e getId = empleadoID ] ifNone: [ nil ].
    empleado isNil ifTrue: [
        MessageBox warning: 'ID de empleado inválido. Intente nuevamente.'.
        false
    ] ifFalse: [ true ]
] whileFalse.

[
    Transcript clear.
    Transcript show: 'Articulos disponibles:'; cr.
    lubricentro getArticulos do: [:art |
        Transcript show: 'ID: ', art getId printString, ' - ', art getTipo, ' ', art getStock printString; cr.
    ].
    articuloID := (Prompter prompt: 'Ingrese el ID del Articulo:') asNumber.
    articulo := lubricentro getArticulos detect: [:a | a getId = articuloID ] ifNone: [ nil ].
    articulo isNil ifTrue: [
        MessageBox warning: 'ID de articulo inválido. Intente nuevamente.'.
        false
    ] ifFalse: [ true ]
] whileFalse.


[
    Transcript clear.
    Transcript show: 'Proveedores disponibles:'; cr.
    lubricentro getProveedores do: [:prov |
        Transcript show: 'ID: ', prov getId printString, ' - ', prov getNombre; cr.
    ].
    proveedorID := (Prompter prompt: 'Ingrese el ID del Proveedor:') asNumber.
    proveedor := lubricentro getProveedores detect: [:p | p getId = proveedorID ] ifNone: [ nil ].
    proveedor isNil ifTrue: [
        MessageBox warning: 'ID de proveedor inválido. Intente nuevamente.'.
        false
    ] ifFalse: [ true ]
] whileFalse.

"Verificamos que la cantidad que desea comprar sumada al stockn actual no supere el stock maximo permitido por producto"
nuevoStockValido := false.
[
    cantidad := (Prompter prompt: 'Ingrese la cantidad que desea comprar:') asNumber.
    nuevoStock := articulo getStock + cantidad.
    (nuevoStock <= articulo getMaxStock )
        ifTrue: [ nuevoStockValido := true ]
        ifFalse: [
            MessageBox warning: 'La cantidad ingresada excede el stock máximo permitido. Intente con un valor menor.'.
        ].
    nuevoStockValido
] whileFalse.


precio := (Prompter prompt: 'Ingrese el precio unitario:') asNumber.

"Actualizamos el stock del producto "
articulo setStock: nuevoStock.

"Registramos la orden de compra"
orden := lubricentro realizarOrdenCompraEmpleado: empleado getId
                         articulo: articulo getId
                         cantidad: cantidad
                         proveedor: proveedor getId
                         precio: precio
                         fecha: Date today.

"Mostramos la orden en pantalla"
Transcript clear.
Transcript show: 'Orden de compra realizada exitosamente:'; cr.
Transcript show: orden printString; cr.
MessageBox warning: 'Orden registrada correctamente. Presione ENTER para continuar.'.

 "Consultamos si desea hacer otra orden de compra"
    (MessageBox confirm: '¿Desea realizar otra orden de compra?')
        ifTrue: [seguirConsultando := true]
        ifFalse: [seguirConsultando := false].
].!

efectuarVenta
| seguirConsultando clienteID empleadoID articuloID cantidad cliente empleado articulo stock venta|

seguirConsultando := true.

[seguirConsultando] whileTrue: [

    [
        Transcript clear.
        Transcript show: 'Clientes disponibles:'; cr.
        lubricentro getClientes do: [:cli |
            Transcript show: 'ID: ', cli getId printString, ' - ', cli getNombre, ' ', cli getApellido; cr.
        ].
        clienteID := (Prompter prompt: 'Ingrese el ID del Cliente:') asNumber.
        cliente := lubricentro getClientes detect: [:c | c getId = clienteID ] ifNone: [ nil ].
        cliente isNil ifTrue: [
            MessageBox warning: 'ID de cliente inválido. Intente nuevamente.'.
            false
        ] ifFalse: [ true ]
    ] whileFalse.

    [
        Transcript clear.
        Transcript show: 'Empleados disponibles:'; cr.
        lubricentro getEmpleados do: [:empl |
            Transcript show: 'ID: ', empl getId printString, ' - ', empl getNombre, ' ', empl getApellido; cr.
        ].
        empleadoID := (Prompter prompt: 'Ingrese el ID del Empleado:') asNumber.
        empleado := lubricentro getEmpleados detect: [:e | e getId = empleadoID ] ifNone: [ nil ].
        empleado isNil ifTrue: [
            MessageBox warning: 'ID de empleado inválido. Intente nuevamente.'.
            false
        ] ifFalse: [ true ]
    ] whileFalse.

    [
        Transcript clear.
        Transcript show: 'Artículos disponibles:'; cr.
        lubricentro getArticulos do: [:ar |
            Transcript show: 'ID: ', ar getId printString, ' - ', ar getTipo, ' - Precio: ', ar getPrecio printString, ' - Stock: ', ar getStock printString; cr.
        ].
        articuloID := (Prompter prompt: 'Ingrese el ID del Artículo:') asNumber.
        articulo := lubricentro getArticulos detect: [:a | a getId = articuloID ] ifNone: [ nil ].
        articulo isNil ifTrue: [
            MessageBox warning: 'ID de artículo inválido. Intente nuevamente.'.
            false
        ] ifFalse: [ true ]
    ] whileFalse.

    "Verificamos que la cantidad que desea comprar coincida o sea menor que el stock actual del producto"
	[
		cantidad := (Prompter prompt: 'Ingrese la cantidad a vender:') asNumber.
		stock := articulo getStock.
		    
		(cantidad >= stock)
		ifTrue: [
			MessageBox warning: 'La cantidad ingresada (' , cantidad printString , ') supera el stock disponible (' , stock printString , '). Intente nuevamente.'.
			false  "Si no coincide le pregunta de nuevo para que ingrese otra cantidad"
		]
		ifFalse: [
			    true  "Cantidad válida, sale del bucle"
		]
	] whileFalse.

            "Actualizamos el stock y registramos la venta"
            articulo setStock: (stock - cantidad).
            venta:= lubricentro realizarVentaCliente: clienteID 
                                            empleado: empleadoID 
                                            articulo: articuloID 
                                            cantidad: cantidad.
           Transcript clear.
           Transcript show: 'Venta realizada exitosamente:'; cr.
           Transcript show: venta printString; cr.
	    MessageBox warning:  'Venta realizada exitosamente.'.

 "Consultamos si desea hacer otra venta"
    (MessageBox confirm: '¿Desea realizar otra Venta?')
        ifTrue: [seguirConsultando := true]
        ifFalse: [seguirConsultando := false].
].!

initialize: unLubricentro
    lubricentro := unLubricentro.!

menuPrincipal
| opcion opcionNum salir |
salir := false.

[ salir ] whileFalse: [
    [ 
        Transcript clear.
        Transcript show: '--- MENÚ PRINCIPAL ---'; cr.
        Transcript show: '1) Agregar (Cliente, Empleado, Proveedor, Articulo)'; cr.
        Transcript show: '2) Eliminar (Cliente, Empleado, Proveedor, Articulo)'; cr.
        Transcript show: '3) Listar (Cliente, Empleado, Proveedor, Articulo)'; cr.
        Transcript show: '4) Mostrar por ID (Cliente, Empleado, Proveedor, Articulo)'; cr.
        Transcript show: '5) Realizar Orden de Compra'; cr.
        Transcript show: '6) Realizar Venta'; cr.
        Transcript show: '7) Cantidad de ventas por empleado '; cr.
        Transcript show: '8) Lista de Tipos de Articulo '; cr.
	Transcript show: '9) Consultar por stock '; cr.
        Transcript show: '10) Ordenar Productos por el de mayor stock '; cr.
        Transcript show: '11) Salir'; cr.
        opcion := Prompter prompt: 'Selecciona una opción (1-11):'.

        opcionNum := opcion asNumber ifNil: [0].  "Convierte la opcion recibida en un número, de no ser posible lo setea en 0 "

        (((1 to: 11) includes: opcionNum)
            ifTrue: [
                opcionNum = 1 ifTrue: [ self subMenuAgregar ].
                opcionNum = 2 ifTrue: [ self subMenuEliminar ].
                opcionNum = 3 ifTrue: [ self subMenuListar ].
                opcionNum = 4 ifTrue: [ self subMenuMostrar ].
                opcionNum = 5 ifTrue: [ self efectuarOrdenCompra ].
                opcionNum = 6 ifTrue: [ self efectuarVenta ].
                opcionNum = 7 ifTrue: [ self contarVentasDeUnEmpleado ].
                opcionNum = 8 ifTrue: [ self articulosPorTipo ].
                opcionNum = 9 ifTrue: [ self  consultarPorStock ].
                opcionNum = 10 ifTrue: [ self  ordenarPorSTockMayor ].
                opcionNum = 11 ifTrue: [ Transcript show: 'Programa finalizado'. salir := true ].
            ]
            ifFalse: [
                MessageBox warning: 'Opción inválida. Intente nuevamente.'.
            ]).
    ] on: Error do: [:error |
    MessageBox warning: 
        'Error inesperado: ', error printString, ' - ', (error messageText ifNil: ['Sin mensaje']).
].
    ].


!

ordenarPorSTockMayor
    | articulosOrdenados |

    Transcript clear.
    Transcript show: 'Artículos ordenados por stock (mayor a menor):'; cr.

    articulosOrdenados := (lubricentro getArticulos) asSortedCollection: [:a :b |
        a getStock > b getStock
    ].

    articulosOrdenados do: [:art |
        Transcript show: art printString; cr.
    ].
MessageBox warning: 'Ingrese Aceptar para continuar'.
!

subMenuAgregar
| opcion opcionNum salir nombre apellido dni telefono email direccion sueldo cargo numero cuit tipo stock stockmin stockmax precio vencimiento elaboracion c e p a |

salir := false.

[ salir ] whileFalse: [
    [ 
        Transcript clear.
        Transcript show: '--- SUBMENÚ AGREGAR ---'; cr.
        Transcript show: '1) Cliente'; cr.
        Transcript show: '2) Empleado'; cr.
        Transcript show: '3) Proveedor'; cr.
        Transcript show: '4) Artículo'; cr.
        Transcript show: '5) Volver al menú principal'; cr.

        opcion := Prompter prompt: 'Selecciona una opción (1-5):'.
        opcionNum := opcion asNumber ifNil: [0].

        Transcript show: ''.
	Transcript show: 'Opción elegida: ', opcionNum printString; cr.

        ((1 to: 5) includes: opcionNum)
            ifTrue: [
                opcionNum = 1 ifTrue: [ 
                    nombre := Prompter prompt: 'Nombre: '.
                    apellido := Prompter prompt: 'Apellido: '.
                    dni := Prompter prompt: 'DNI: '.
                    telefono := Prompter prompt: 'Teléfono: '.
                    email := Prompter prompt: 'Email: '.
                    direccion := Prompter prompt: 'Dirección: '.

                    c := Cliente crearCliente: nombre apellido: apellido dni: dni telefono: telefono email: email direccion: direccion.
                    Transcript clear.
                    Transcript show: 'Cliente creado: ', c printString; cr.
                    lubricentro agregarCliente: c.
                    MessageBox warning: 'Cliente agregado al lubricentro. Presione Aceptar para continuar.'.
                ].

                opcionNum = 2 ifTrue: [ 
                    nombre := Prompter prompt: 'Nombre: '.
                    apellido := Prompter prompt: 'Apellido: '.
                    dni := Prompter prompt: 'DNI: '.
                    telefono := Prompter prompt: 'Teléfono: '.
                    sueldo := (Prompter prompt: 'Sueldo: ') asNumber.
                    cargo := Prompter prompt: 'Cargo: '.

                    (sueldo isNil or: [sueldo = 0]) ifTrue: [
                        MessageBox warning: 'Sueldo inválido. Debe ser un número mayor a 0.'.
                        ^ self. "Esto nos permite detener la ejecución si el sueldo es inválido, mostrando un mensaje y volviendo al método anterior"

                     ].
                    Transcript clear.
                    Transcript show: 'Creando Empleado...'; cr.

                    [ 
                        e := Empleado crearEmpleado: nombre
                            apellido: apellido
                            dni: dni
                            telefono: telefono
                            fecha_ingreso: Date today
                            sueldo: sueldo
                            cargo: cargo.

                        Transcript show: 'Empleado creado: ', e printString; cr.

                        lubricentro agregarEmpleado: e.
                        MessageBox warning: 'Empleado agregado al lubricentro. Presione Aceptar para continuar.'.
                    ] on: Error do: [:ex |
                        MessageBox warning: 'Ocurrió un error al crear el empleado: ', ex messageText.
                    ].
                ].

                opcionNum = 3 ifTrue: [  
                    nombre := Prompter prompt: 'Nombre: '.
                    numero := Prompter prompt: 'DNI: '.
                    direccion := Prompter prompt: 'Dirección: '.
                    cuit := Prompter prompt: 'CUIT: '.

                    p := Proveedor crearConNombre: nombre numero: numero direccion: direccion cuit: cuit. 
                    Transcript clear.
                    Transcript show: 'Proveedor creado: ', p printString; cr.

                    lubricentro agregarProveedor: p.
                    MessageBox warning: 'Proveedor agregado al lubricentro. Presione Aceptar para continuar.'.
                ].

                opcionNum = 4 ifTrue: [
                    tipo := Prompter prompt: 'Tipo:  '.
                    stock := (Prompter prompt: 'Stock: ') asNumber.
                    stockmin := (Prompter prompt: 'Stock mínimo: ') asNumber.
                    stockmax := (Prompter prompt: 'Stock máximo: ') asNumber.
                    precio := (Prompter prompt: 'Precio: ') asNumber.

                    (stock isNil or: [stock < 0]) ifTrue: [
                        MessageBox warning: 'Stock inválido.'.
                        ^ self.
                    ].

                    (precio isNil or: [precio <= 0]) ifTrue: [
                        MessageBox warning: 'Precio inválido.'.
                        ^ self.
                    ].

                    [ 
                        vencimiento := Date fromString: (Prompter prompt: 'Ingrese la fecha de vencimiento (formato dd/mm/aaaa): ').
                        elaboracion := Date fromString: (Prompter prompt: 'Ingrese la fecha de elaboración (formato dd/mm/aaaa): ').
                    ] on: Error do: [:ex |
                        MessageBox warning: 'Fecha inválida. Asegúrese de usar el formato dd/mm/aaaa.'.
                        ^ self.
                    ].
                    Transcript clear.
                    Transcript show: 'Creando Articulo...'; cr.

                    [
                        a := Articulo crearConTipo: tipo
                            stock: stock
                            min_Stock: stockmin
                            max_stock: stockmax
                            precio: precio
                            vencimiento: vencimiento
                            elaboracion: elaboracion.

                        Transcript show: 'Artículo creado: ', a printString; cr.
                        lubricentro agregarArticulo: a.
                        MessageBox warning: 'Artículo agregado al lubricentro. Presione Aceptar para continuar.'.
                    ] on: Error do: [:ex |
                        MessageBox warning: 'Ocurrió un error al crear el artículo: ', ex messageText.
                    ].
                ].

                opcionNum = 5 ifTrue: [ salir := true ].
            ]
            ifFalse: [
                MessageBox warning: 'Opción inválida. Intente nuevamente.'.
            ].
    ] on: Error do: [:error |
        MessageBox warning: 'Error inesperado. ', (error messageText ifNil: ['Intente nuevamente.']).
    ].
].
!

subMenuEliminar
	| opcion opcionNum salir id confirmacion |

	salir := false.

	[ salir ] whileFalse: [
		[
			Transcript clear.
			Transcript show: '--- SUBMENÚ ELIMINAR ---'; cr.
			Transcript show: '1) Cliente'; cr.
			Transcript show: '2) Empleado'; cr.
			Transcript show: '3) Proveedor'; cr.
			Transcript show: '4) Artículo'; cr.
			Transcript show: '5) Volver al menú principal'; cr.

			opcion := Prompter prompt: 'Selecciona una opción (1-5): '.
			opcionNum := opcion asNumber ifNil: [ 0 ].

			((1 to: 5) includes: opcionNum)
				ifTrue: [
					opcionNum = 1 ifTrue: [
						Transcript clear.
						Transcript show: 'Clientes existentes:'; cr.
						lubricentro getClientes do: [:c | Transcript show: c printString; cr]. "Esto es solo para imprimir los empleados existentes así el usuario puede visualizar las opciones que tiene disponible"

						id := (Prompter prompt: 'Ingrese el ID del cliente que desea eliminar: ') asNumber.
						(confirmacion := MessageBox confirm: '¿Está seguro que desea eliminar el cliente con ID ', id printString, '?')
							ifTrue: [
								(lubricentro eliminarClienteConId: id) "Buscamos el Cliente que tenga ese id"
									ifTrue: [ MessageBox warning: 'Cliente eliminado correctamente.' ]
									ifFalse: [ MessageBox warning: 'Cliente no encontrado.' ].
							]
							ifFalse: [
								MessageBox warning: 'Cliente no fue eliminado.'.
							].
					].

					opcionNum = 2 ifTrue: [
						Transcript clear.
						Transcript show: 'Empleados existentes:'; cr.
						lubricentro getEmpleados do: [:e | Transcript show: e printString; cr].

						id := (Prompter prompt: 'Ingrese el ID del empleado que desea eliminar: ') asNumber.
						(confirmacion := MessageBox confirm: '¿Está seguro que desea eliminar el empleado con ID ', id printString, '?')
							ifTrue: [
								(lubricentro eliminarEmpleadoConId: id) 
									ifTrue: [ MessageBox warning: 'Empleado eliminado correctamente.' ]
									ifFalse: [ MessageBox warning: 'Empleado no encontrado.' ].
							]
							ifFalse: [
								MessageBox warning: 'Empleado no fue eliminado.'.
							].
					].

					opcionNum = 3 ifTrue: [
						Transcript clear.
						Transcript show: 'Proveedores existentes:'; cr.
						lubricentro getProveedores do: [:p | Transcript show: p printString; cr].
						id := (Prompter prompt: 'Ingrese el ID del proveedor que desea eliminar: ') asNumber.
						(confirmacion := MessageBox confirm: '¿Está seguro que desea eliminar el proveedor con ID ', id printString, '?')
							ifTrue: [
								(lubricentro eliminarProveedorConId: id)
									ifTrue: [ MessageBox warning: 'Proveedor eliminado correctamente.' ]
									ifFalse: [ MessageBox warning: 'Proveedor no encontrado.' ].
							]
							ifFalse: [
								MessageBox warning: 'Proveedor no fue eliminado.'.
							].
					].

					opcionNum = 4 ifTrue: [
						Transcript clear.
						Transcript show: 'Artículos existentes:'; cr.
						lubricentro getArticulos do: [:a | Transcript show: a printString; cr].

						id := (Prompter prompt: 'Ingrese el ID del artículo que desea eliminar: ') asNumber.
						(confirmacion := MessageBox confirm: '¿Está seguro que desea eliminar el artículo con ID ', id printString, '?')
							ifTrue: [
								(lubricentro eliminarArticuloConId: id)
									ifTrue: [ MessageBox warning: 'Artículo eliminado correctamente.' ]
									ifFalse: [ MessageBox warning: 'Artículo no encontrado.' ].
							]
							ifFalse: [
								MessageBox warning: 'Artículo no fue eliminado.'.
							].
					].

					opcionNum = 5 ifTrue: [ salir := true ].
				]
				ifFalse: [
					MessageBox warning: 'Opción inválida. Intente nuevamente.'.
				].
		] on: Error do: [:error |
			MessageBox warning: 'Error inesperado: ', (error messageText ifNil: ['Intente nuevamente.']).
		].
	].

!

subMenuListar
| opcion opcionNum salir |
salir := false.

[ salir ] whileFalse: [
  Transcript clear.
  Transcript
    show: '--- SUBMENÚ LISTAR ---'; cr;
    show: '1) Cliente'; cr;
    show: '2) Empleado'; cr;
    show: '3) Proveedor'; cr;
    show: '4) Artículo'; cr;
    show: '5) Volver al menú principal'; cr.

  opcion := Prompter prompt: 'Selecciona una opción (1-5):'.
  opcionNum := opcion asNumber ifNil: [0].

  ((1 to: 5) includes: opcionNum)
    ifTrue: [
      opcionNum = 1 ifTrue: [ 

Transcript clear.
        lubricentro getClientes do: [:c | Transcript show: c printString; cr ].  "Mostramos todos los elementos de la lista"
       MessageBox warning: ' Presione Aceptar para continuar.'.

      ].
      opcionNum = 2 ifTrue: [ 
Transcript clear.
        lubricentro getEmpleados do: [:e | Transcript show: e printString; cr ].
       MessageBox warning: ' Presione Aceptar para continuar.'.
      ].
      opcionNum = 3 ifTrue: [ 
Transcript clear.
        lubricentro getProveedores do: [:p | Transcript show: p printString; cr ].
        MessageBox warning: ' Presione Aceptar para continuar.'.
      ].
      opcionNum = 4 ifTrue: [ 
Transcript clear.
        lubricentro getArticulos do: [:a | Transcript show: a printString; cr ].
         MessageBox warning: ' Presione Aceptar para continuar.'.
      ].
      opcionNum = 5 ifTrue: [ salir := true ].
    ]
    ifFalse: [
      MessageBox warning: 'Opción inválida. Intente nuevamente.'.
    ].
].!

subMenuMostrar
  | opcion opcionNum salir id |

  salir := false.

  [ salir = false ] whileTrue: [
    [
      Transcript clear.
      Transcript show: '--- SUBMENÚ Mostrar ---'; cr.
      Transcript show: '1) Cliente'; cr.
      Transcript show: '2) Empleado'; cr.
      Transcript show: '3) Proveedor'; cr.
      Transcript show: '4) Artículo'; cr.
      Transcript show: '5) Volver al menú principal'; cr.

      opcion := Prompter prompt: 'Selecciona una opción (1-5): '.
      opcionNum := opcion asNumber ifNil: [0].


      ((1 to: 5) includes: opcionNum)
        ifTrue: [
          opcionNum = 1 ifTrue: [
            Transcript clear.
            Transcript show: 'Clientes disponibles:'; cr.
            lubricentro getClientes do: [:c |
              Transcript show: 'ID: ', c getId printString, ' | ', c getNombre, ' ', c getApellido; cr].
            id := Prompter prompt: 'Ingrese el id del cliente que desea ver: '.  "Nos permite mostrar todos los datos de un elemento en particular"
            id := id asNumber ifNil: [-1].
            Transcript clear.
            lubricentro mostrarClienteConId: id.
            MessageBox warning: 'Presione Aceptar para volver al menú mostrar.'.
          ].

          opcionNum = 2 ifTrue: [
            Transcript clear.
            Transcript show: 'Empleados disponibles:'; cr.
            lubricentro getEmpleados do: [:e |
              Transcript show: 'ID: ', e getId printString, ' | ', e getNombre, ' ', e getApellido; cr].
            id := Prompter prompt: 'Ingrese el id del empleado que desea ver: '.
            id := id asNumber ifNil: [-1].
            Transcript clear.
            lubricentro mostrarEmpleadoConId: id.
            MessageBox warning: 'Presione Aceptar para volver al menú mostrar.'.
          ].

          opcionNum = 3 ifTrue: [
            Transcript clear.
            Transcript show: 'Proveedores disponibles:'; cr.
            lubricentro getProveedores do: [:p |
              Transcript show: 'ID: ', p getId printString, ' | ', p getNombre; cr].
            id := Prompter prompt: 'Ingrese el id del proveedor que desea ver: '.
            id := id asNumber ifNil: [-1].
            Transcript clear.
            lubricentro mostrarProveedorConId: id.
            MessageBox warning: 'Presione Aceptar para volver al menú mostrar.'.
          ].

          opcionNum = 4 ifTrue: [
            Transcript clear.
            Transcript show: 'Artículos disponibles:'; cr.
            lubricentro getArticulos do: [:a |
              Transcript show: 'ID: ', a getId printString, ' | Tipo: ', a getTipo; cr].
            id := Prompter prompt: 'Ingrese el id del artículo que desea ver: '.
            id := id asNumber ifNil: [-1].
            Transcript clear.
            lubricentro mostrarArticuloConId: id.
            MessageBox warning: 'Presione Aceptar para volver al menú mostrar.'.
          ].

          opcionNum = 5 ifTrue: [ salir := true ].
        ]
        ifFalse: [
          MessageBox warning: 'Opción inválida. Intente nuevamente.'.
        ].
    ] on: Error do: [:error |
      MessageBox warning: 'Error inesperado: ', error messageText.
    ].
  ].
! !
!MenuLubricentro categoriesFor: #articulosPorTipo!public! !
!MenuLubricentro categoriesFor: #consultarPorStock!public! !
!MenuLubricentro categoriesFor: #contarVentasDeUnEmpleado!public! !
!MenuLubricentro categoriesFor: #efectuarOrdenCompra!public! !
!MenuLubricentro categoriesFor: #efectuarVenta!public! !
!MenuLubricentro categoriesFor: #initialize:!public! !
!MenuLubricentro categoriesFor: #menuPrincipal!public! !
!MenuLubricentro categoriesFor: #ordenarPorSTockMayor!public! !
!MenuLubricentro categoriesFor: #subMenuAgregar!public! !
!MenuLubricentro categoriesFor: #subMenuEliminar!public! !
!MenuLubricentro categoriesFor: #subMenuListar!public! !
!MenuLubricentro categoriesFor: #subMenuMostrar!public! !

!MenuLubricentro class methodsFor!

crearMenuPrincipalLubricentro: unLubricentro
    | menu |
    menu := self new.
    menu initialize: unLubricentro.
    menu menuPrincipal.
    ^ menu.! !
!MenuLubricentro class categoriesFor: #crearMenuPrincipalLubricentro:!public! !

