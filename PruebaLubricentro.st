"Realizamos una pequeña prueba para corroborar que todo funcione correctamente"

"Creamos un empleado"
empleado1 := Empleado crearEmpleado: 'Daniela'
				    apellido: 'Gonzalez'
				    dni: '43123456'
				    telefono: '26444550'
				    fecha_ingreso: Date today
				    sueldo: 75000
				    cargo: 'Vendedora'.
"empleado1 inspect.  "


"Creamos un proveedor"
proveedor1:= Proveedor crearConNombre: 'Distribuidora del sur S.A.'
				    numero: '011-4444-5555'
				    direccion: 'Av. Calchaquí 6301, Florencio Varela, Provincia de Buenos Aires'
				    cuit: '20-12345678-9'.
"proveedor1 inspect.  "


"Creamos un artículo"
articulo1 := Articulo crearConTipo: 'Aceite 10W40'
				stock: 15
				min_Stock: 20
				max_stock: 50
				precio: 50999
				vencimiento: (Date fromString: '12/05/2025')
				elaboracion: (Date fromString: '12/05/2024').
"articulo1 inspect."


"Creamos un cliente"
cliente1 := Cliente crearCliente: 'Martin'
			    apellido: 'Gutierrez'
			    dni: '27558415'
			    telefono: '26487501'
			    email: 'martin.gutierrez@mail.com'
			    direccion: 'Quilmes, Provincia de Buenos Aires'.
"cliente1 inspect."  "Para corroborar que los datos se esten agregando correctamente"

"Creamos el lubricentro"
lubricentro:= Lubricentro crearBasicoConNombre: 'YML LubriCentro ' descripcion: 'Tienda especializada en la venta de lubricantes, aceites, filtros y artículos varios para todo tipo de vehículos'.


"Agregamos el cliente, empleado, proveedor y artículo al lubricentro"
lubricentro getClientes add: cliente1.
lubricentro getEmpleados add: empleado1.
lubricentro getProveedores add: proveedor1.
lubricentro getArticulos add: articulo1.
"lubricentro inspect.  "


"lubricentro getClientes inspect.
lubricentro getEmpleados inspect.    Para ver que funciona
lubricentro getProveedores inspect.
lubricentro getArticulos inspect."


"Realizamos una prueba en la cual hacemos una Orden de compra al proveedor del articulo1"
lubricentro realizarOrdenCompraEmpleado: empleado1 getId
						   articulo: articulo1 getId
						 cantidad: 10
					       proveedor: proveedor1 getId
						     precio: 1500
						      fecha: Date today.

lubricentro getOrdenesDeCompra last inspect. "Verificamos que se haya realizado la orden correctamente"


"Ahora probamos hacer una venta al cliente del articulo que tenemos"
lubricentro realizarVentaCliente: cliente1 getId
				empleado: empleado1 getId
				   articulo: articulo1 getId
				 cantidad: 2.

lubricentro getVentas last inspect.  "probamos que la venta se haya hecho"
