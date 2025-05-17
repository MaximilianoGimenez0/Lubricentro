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

GetCargo
	^ cargo.!

GetFechaIngreso
	^ fecha_ingreso.!

GetSueldo
	^ sueldo.!

SetCargo: unCargo
	cargo := unCargo.!

SetFechaIngreso: unFechaIngreso
	fecha_ingreso := unFechaIngreso.!

SetSueldo: unSueldo
	sueldo := unSueldo.! !
!Empleado categoriesFor: #GetCargo!public! !
!Empleado categoriesFor: #GetFechaIngreso!public! !
!Empleado categoriesFor: #GetSueldo!public! !
!Empleado categoriesFor: #SetCargo:!public! !
!Empleado categoriesFor: #SetFechaIngreso:!public! !
!Empleado categoriesFor: #SetSueldo:!public! !

