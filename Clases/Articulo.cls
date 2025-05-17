"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Articulo
	instanceVariableNames: 'id tipo stock min_stock max_stock precio vencimiento elaboracion'
	classVariableNames: 'UltimoID'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Articulo guid: (GUID fromString: '{5FB8E21B-8B78-4F63-B399-D532A7E8E5D5}')!
Articulo comment: ''!
!Articulo categoriesForClass!Kernel-Objects! !
!Articulo methodsFor!

getElaboracion
	^ elaboracion!

getId
	^ id!

getMaxStock
	^ max_stock!

getMinStock
	^ min_stock!

getPrecio
	^ precio!

getStock
	^ stock!

getTipo
	^ tipo
!

getVencimiento
	^ vencimiento!

initialize
	super initialize.
	stock := 0.
	min_stock := 0.
	max_stock := 0.
	precio := 0.
	tipo := ' '.
	vencimiento := nil.
	elaboracion := nil.!

setMaxStock: unMaximo
	max_stock := unMaximo!

setMinStock: unMinimo
	min_stock := unMinimo!

setPrecio: unPrecio
	precio := unPrecio
	! !
!Articulo categoriesFor: #getElaboracion!public! !
!Articulo categoriesFor: #getId!public! !
!Articulo categoriesFor: #getMaxStock!public! !
!Articulo categoriesFor: #getMinStock!public! !
!Articulo categoriesFor: #getPrecio!public! !
!Articulo categoriesFor: #getStock!public! !
!Articulo categoriesFor: #getTipo!public! !
!Articulo categoriesFor: #getVencimiento!public! !
!Articulo categoriesFor: #initialize!public! !
!Articulo categoriesFor: #setMaxStock:!public! !
!Articulo categoriesFor: #setMinStock:!public! !
!Articulo categoriesFor: #setPrecio:!public! !

!Articulo class methodsFor!

Initialize
	UltimoID := 0.
	!

NextId
	UltimoID isNil ifTrue: [ UltimoID := 0 ].
	UltimoID := UltimoID + 1.
	^UltimoID.! !
!Articulo class categoriesFor: #Initialize!public! !
!Articulo class categoriesFor: #NextId!public! !

