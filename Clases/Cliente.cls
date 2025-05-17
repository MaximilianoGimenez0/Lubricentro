"Filed out from Dolphin Smalltalk 7"!

Persona subclass: #Cliente
	instanceVariableNames: 'direccion email'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Cliente guid: (GUID fromString: '{2181CB0A-5819-40D8-96FF-87FAA9909B4A}')!
Cliente comment: ''!
!Cliente categoriesForClass!Kernel-Objects! !
!Cliente methodsFor!

getDireccion
	^direccion!

getEmail
	^email!

initialize: unNombre apellido: unApellido dni: unDni telefono: unTelefono email: unEmail direccion: unaDireccion
	super
		initialize: unNombre
		apellido: unApellido
		dni: unDni
		telefono: unTelefono.
	email := unEmail.
	direccion := unaDireccion.!

setDireccion: unDireccion
	direccion := unDireccion!

setEmail: unEmail
	email := unEmail! !
!Cliente categoriesFor: #getDireccion!public! !
!Cliente categoriesFor: #getEmail!public! !
!Cliente categoriesFor: #initialize:apellido:dni:telefono:email:direccion:!public! !
!Cliente categoriesFor: #setDireccion:!public! !
!Cliente categoriesFor: #setEmail:!public! !

!Cliente class methodsFor!

crearCliente: unNombre apellido: unApellido dni: unDni telefono: unTelefono email: unEmail direccion: unaDireccion
	^ self new
		initialize: unNombre apellido: unApellido dni: unDni telefono: unTelefono email: unEmail direccion: unaDireccion ;
		yourself.! !
!Cliente class categoriesFor: #crearCliente:apellido:dni:telefono:email:direccion:!public! !

