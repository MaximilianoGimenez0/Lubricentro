"creamos el lubricentro con algunos datos"

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
cliente1. 		    "INSPECT"

"Creamos el lubricentro"
lubricentro:= Lubricentro crearBasicoConNombre: 'YML LubriCentro ' descripcion: 'Tienda especializada en la venta de lubricantes, aceites, filtros y artículos varios para todo tipo de vehículos'.

"Agregamos el cliente, empleado, proveedor y artículo al lubricentro"
lubricentro agregarCliente: cliente1.
lubricentro agregarEmpleado: empleado1.
lubricentro agregarProveedor: proveedor1.
lubricentro agregarArticulo: articulo1.
lubricentro agregarArticulo: articulo2.
lubricentro agregarArticulo: articulo3.
lubricentro agregarArticulo: articulo4.
lubricentro agregarArticulo: articulo5.


lubricentro.		"INSPECT"

"Antes de ejecutar el menú ejecutar todo lo anterior para que no se produzcan fallos, ya que el lubricentro debe estar creado para que el menú funcione"
"Nota: tener en cuenta que para visualizar el menú hay que abrir el show transcript"

MenuLubricentro crearMenuPrincipalLubricentro: lubricentro.  "Creamos el menú"





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
