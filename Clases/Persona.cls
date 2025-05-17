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

GetApellido
	^ apellido.!

GetDNI
	^ dni.!

GetId
	^ id.!

GetNombre
	^ nombre.!

GetTelefono
	^ telefono.!

initialize: unNombre apellido: unApellido dni: unDni telefono: unTelefono
	id := Persona nextId.
	nombre := unNombre.
	apellido := unApellido.
	dni := unDni.
	telefono := unTelefono.!

SetApellido: unApellido
	apellido := unApellido.!

SetDNI: unDni
	dni := unDni.!

SetNombre: unNombre
	nombre := unNombre.!

SetTelefono: unTelefono
	telefono := unTelefono.! !
!Persona categoriesFor: #GetApellido!public! !
!Persona categoriesFor: #GetDNI!public! !
!Persona categoriesFor: #GetId!public! !
!Persona categoriesFor: #GetNombre!public! !
!Persona categoriesFor: #GetTelefono!public! !
!Persona categoriesFor: #initialize:apellido:dni:telefono:!public! !
!Persona categoriesFor: #SetApellido:!public! !
!Persona categoriesFor: #SetDNI:!public! !
!Persona categoriesFor: #SetNombre:!public! !
!Persona categoriesFor: #SetTelefono:!public! !

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

