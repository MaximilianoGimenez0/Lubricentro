"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Persona
	instanceVariableNames: 'id nombre apellido dni telefono'
	classVariableNames: 'UltimoID'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Persona guid: (GUID fromString: '{DC4B3853-7F67-4575-9D85-68E563529374}')!
Persona comment: ''!
!Persona categoriesForClass!Kernel-Objects! !
!Persona methodsFor!

getApellido
	^ apellido.!

getDNI
	^ dni.!

getId
	^ id.!

getNombre
	^ nombre.!

getTelefono
	^ telefono.!


initialize: unNombre apellido: unApellido dni: unDni telefono: unTelefono
	id := Persona nextId.
	nombre := unNombre.
	apellido := unApellido.
	dni := unDni.
	telefono := unTelefono.!

setApellido: unApellido
apellido := unApellido.!

setDNI: unDni
	dni := unDni.!

setNombre: unNombre
	nombre := unNombre.!

setTelefono: unTelefono
	telefono := unTelefono.! !

!Persona categoriesFor: #getApellido!public! !
!Persona categoriesFor: #getDNI!public! !
!Persona categoriesFor: #getId!public! !
!Persona categoriesFor: #getNombre!public! !
!Persona categoriesFor: #getTelefono!public! !
!Persona categoriesFor: #initialize:apellido:dni:telefono:!public! !
!Persona categoriesFor: #setApellido:!public! !
!Persona categoriesFor: #setDNI:!public! !
!Persona categoriesFor: #setNombre:!public! !
!Persona categoriesFor: #setTelefono:!public! !

!Persona class methodsFor!

crearPersona: unNombre apellido: unApellido dni: unDni telefono: unTelefono
	^ self new
		initialize: unNombre apellido: unApellido dni: unDni telefono: unTelefono ; 
		yourself. !

initialize
	UltimoID := 0.!

nextId
	UltimoID isNil ifTrue: [ UltimoID := 0 ].  "Verificar y asegurarse de que UltimoID no sea Nil"
	UltimoID := UltimoID + 1.  "Incrementa el ID"
	^UltimoID.! !
!Persona class categoriesFor: #crearPersona:apellido:dni:telefono:!public! !
!Persona class categoriesFor: #initialize!public! !
!Persona class categoriesFor: #nextId!public! !

