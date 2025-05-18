"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Proveedor
	instanceVariableNames: 'id nombre numero direccion cuit'
	classVariableNames: 'UltimoID'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Proveedor guid: (GUID fromString: '{9415444E-AF37-457E-940C-BB3B7BDF75F5}')!
Proveedor comment: ''!
!Proveedor categoriesForClass!Kernel-Objects! !
!Proveedor methodsFor!

getCuit
	^ cuit.!

getDireccion
	^ direccion.!

getId
	^ id.!

getNombre
	^ nombre.!

getNumero
	^ numero.!

"GetId"
	id
	^ id.!

initialize: unNombre numero: unNumero direccion: unDireccion cuit: unCuit
	id := Proveedor nextId.  "Asigna el siguiente ID autoincremental"
	nombre := unNombre.
	numero := unNumero.
	direccion := unDireccion.
	cuit := unCuit.
!

setCuit: unCuit
	cuit := unCuit.!

setDireccion: unDireccion
	direccion := unDireccion.!

setNombre: unNombre
	nombre := unNombre.!

setNumero: unNumero
	numero := unNumero.! !
!Proveedor categoriesFor: #getCuit!public! !
!Proveedor categoriesFor: #getDireccion!public! !
!Proveedor categoriesFor: #getId!public! !
!Proveedor categoriesFor: #getNombre!public! !
!Proveedor categoriesFor: #getNumero!public! !
!Proveedor categoriesFor: #id!public! !
!Proveedor categoriesFor: #initialize:numero:direccion:cuit:!public! !
!Proveedor categoriesFor: #setCuit:!public! !
!Proveedor categoriesFor: #setDireccion:!public! !
!Proveedor categoriesFor: #setNombre:!public! !
!Proveedor categoriesFor: #setNumero:!public! !

!Proveedor class methodsFor!

crearConNombre: unNombre numero: unNumero direccion: unDireccion cuit: unCuit	"Este metodo te deja crear e inicializar el objeto encapsulando el new y el initialize."
	^ self new  "Crea una nueva instancia de la clase Proveedor."
		initialize: unNombre numero: unNumero direccion: unDireccion cuit: unCuit;  "Inicializa la instancia con los valores dados."
		yourself.  "Devuelve el objeto recién creado (self), ya inicializado."
!

initialize
    UltimoID := 0.  "ID de inicio"!

nextId
    UltimoID isNil ifTrue: [ UltimoID := 0 ].  "Verificar y asegurarse de que UltimoID no sea Nil"
    UltimoID := UltimoID + 1.  "Incrementa el ID"
    ^UltimoID.! !
!Proveedor class categoriesFor: #crearConNombre:numero:direccion:cuit:!public! !
!Proveedor class categoriesFor: #initialize!public! !
!Proveedor class categoriesFor: #nextId!public! !

