"Filed out from Dolphin Smalltalk 7"!

Persona subclass: #Cliente
	instanceVariableNames: 'direccion mail'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Cliente guid: (GUID fromString: '{2181CB0A-5819-40D8-96FF-87FAA9909B4A}')!
Cliente comment: ''!
!Cliente categoriesForClass!Kernel-Objects! !
!Cliente methodsFor!

GetDireccion
	^ direccion.!

GetMail
	^ mail.!

SetDireccion: unDireccion
	direccion := unDireccion.!

SetMail: unMail
	mail := unMail.! !
!Cliente categoriesFor: #GetDireccion!public! !
!Cliente categoriesFor: #GetMail!public! !
!Cliente categoriesFor: #SetDireccion:!public! !
!Cliente categoriesFor: #SetMail:!public! !

