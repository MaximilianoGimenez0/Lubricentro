"Filed out from Dolphin Smalltalk 7"!

Persona subclass: #Empleado
	instanceVariableNames: 'fecha_ingreso sueldo cargo'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Empleado guid: (GUID fromString: '{BB6F52C6-FCFE-4F0C-A442-6690AA4A1BB6}')!
Empleado comment: ''!
!Empleado categoriesForClass!Kernel-Objects! !
!Empleado methodsFor!

getCargo
	^ cargo.!

getFechaIngreso
	^ fecha_ingreso.!

getSueldo
	^ sueldo.!

initialize: unNombre apellido: unApellido dni: unDni telefono: unTelefono fecha_ingreso: unFechaIngreso sueldo: unSueldo cargo: unCargo
	super
		initialize: unNombre
		apellido: unApellido
		dni: unDni
		telefono: unTelefono.
	fecha_ingreso := unFechaIngreso.
	sueldo := unSueldo.
	cargo := unCargo.!

setCargo: unCargo
	cargo := unCargo.!

setFechaIngreso: unFechaIngreso
	fecha_ingreso := unFechaIngreso.!

setSueldo: unSueldo
	sueldo := unSueldo.! !
!Empleado categoriesFor: #getCargo!public! !
!Empleado categoriesFor: #getFechaIngreso!public! !
!Empleado categoriesFor: #getSueldo!public! !
!Empleado categoriesFor: #initialize:apellido:dni:telefono:fecha_ingreso:sueldo:cargo:!public! !
!Empleado categoriesFor: #setCargo:!public! !
!Empleado categoriesFor: #setFechaIngreso:!public! !
!Empleado categoriesFor: #setSueldo:!public! !

!Empleado class methodsFor!

crearEmpleado: unNombre apellido: unApellido dni: unDni telefono: unTelefono fecha_ingreso: unFechaIngreso sueldo: unSueldo cargo: unCargo
	^ self new
		initialize: unNombre apellido: unApellido dni:unDni telefono:unTelefono fecha_ingreso:unFechaIngreso sueldo:unSueldo cargo:unCargo;
		yourself.! !
!Empleado class categoriesFor: #crearEmpleado:apellido:dni:telefono:fecha_ingreso:sueldo:cargo:!public! !

