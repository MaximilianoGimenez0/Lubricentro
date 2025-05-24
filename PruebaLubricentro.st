"Realizamos una pequeña prueba para corroborar que todo funcione correctamente"
|empleado1 proveedor1 articulo1 cliente1 lubricentro|

empleado1 := Empleado crearEmpleado: 'Daniela'
				    apellido: 'Gonzalez'
				    dni: '43123456'
				    telefono: '26444550'
				    fecha_ingreso: Date today
				    sueldo: 75000
				    cargo: 'Vendedora'.
empleado1. 		"INSPECT "


"Creamos un proveedor"
proveedor1:= Proveedor crearConNombre: 'Distribuidora del sur S.A.'
				    numero: '011-4444-5555'
				    direccion: 'Av. Calchaquí 6301, Florencio Varela, Provincia de Buenos Aires'
				    cuit: '20-12345678-9'.
proveedor1. 		"INSPECT"


"Creamos artículos"
articulo1 := Articulo crearConTipo: 'Aceite 10W40'
				stock: 25
				min_Stock: 20
				max_stock: 50
				precio: 50999
				vencimiento: (Date fromString: '12/05/2026')
				elaboracion: (Date fromString: '12/05/2024').
articulo1.

articulo2 := Articulo crearConTipo: 'Refrigerante concentrado'
				stock: 30
				min_Stock: 20
				max_stock: 100
				precio: 7563
				vencimiento: (Date fromString: '12/05/2027')
				elaboracion: (Date fromString: '18/04/2024').
articulo2.

articulo3 := Articulo crearConTipo: 'Guantes de nitrilo'
				stock: 80
				min_Stock: 10
				max_stock: 200
				precio: 3950
				vencimiento: (Date fromString: '12/05/2026')
				elaboracion: (Date fromString: '20/01/2024').
articulo3.

articulo4 := Articulo crearConTipo: 'Aceite Sintetico'
				stock: 30
				min_Stock: 10
				max_stock: 100
				precio: 34806
				vencimiento: (Date fromString: '12/05/2027')
				elaboracion: (Date fromString: '19/08/2024').
articulo4.

articulo5 := Articulo crearConTipo: 'Filtro de aire Biconico'
				stock: 65
				min_Stock: 20
				max_stock: 150
				precio: 14850
				vencimiento: (Date fromString: '12/07/2026')
				elaboracion: (Date fromString: '30/03/2024').

articulo5.			"INSPECT"


"Creamos un cliente"
cliente1 := Cliente crearCliente: 'Martin'
			    apellido: 'Gutierrez'
			    dni: '27558415'
			    telefono: '26487501'
			    email: 'martin.gutierrez@mail.com'
			    direccion: 'Quilmes, Provincia de Buenos Aires'.
cliente1. 			"INSPECT"


"Creamos el lubricentro"
lubricentro:= Lubricentro CrearBasicoConNombre: 'YML LubriCentro ' descripcion: 'Tienda especializada en la venta de lubricantes, aceites, filtros y artículos varios para todo tipo de vehículos'.

"Agregamos el cliente, empleado, proveedor y artículo al lubricentro"
lubricentro getClientes add: cliente1.
lubricentro getEmpleados add: empleado1.
lubricentro getProveedores add: proveedor1.
lubricentro getArticulos add: articulo1.
lubricentro getArticulos add: articulo2.
lubricentro getArticulos add: articulo3.
lubricentro getArticulos add: articulo4.
lubricentro getArticulos add: articulo5.


lubricentro.		"INSPECT"


"Realizamos una prueba en la cual hacemos una Orden de compra al proveedor del articulo1"
lubricentro realizarOrdenCompraEmpleado: empleado1 getId
						   articulo: articulo1 getId
						 cantidad: 10
					       proveedor: proveedor1 getId
						     precio: 1500
						      fecha: Date today.

lubricentro.  "INSPECT --> LISTA DE ORDENES DE COMPRA"


"Ahora probamos hacer una venta al cliente del articulo1"
lubricentro realizarVentaCliente: cliente1 getId
				empleado: empleado1 getId
				   articulo: articulo1 getId
				 cantidad: 2.

lubricentro.  "INSPECT --> LISTA DE VENTAS"


"Prueba de collect, select, reject y detect"

|tiposArticulos stockMenor30 stockNoMenor30 detectarAceite|

tiposArticulos := lubricentro getArticulos collect: [:articulo | articulo getTipo].
tiposArticulos inspect.

stockMenor30 :=lubricentro getArticulos select: [:articulo | articulo getStock < 30].
stockMenor30 inspect.

stockNoMenor30 :=lubricentro getArticulos reject: [:articulo | articulo getStock < 30].
stockNoMenor30 inspect. 

detectarAceite := lubricentro getArticulos detect: [:articulo | articulo getTipo = 'Aceite 10W40'].
detectarAceite inspect.
