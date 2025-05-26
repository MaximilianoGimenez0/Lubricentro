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
	^id!

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

initialize: unTipo stock: unStock min_Stock: unMinStock max_stock:unMaxStock precio:unPrecio vencimiento:unVencimiento elaboracion:unElaboracion
	id:= Articulo nextId. "Asigna el siguiente ID autoincremental"
	tipo:= unTipo.
	stock:= unStock.
	min_stock := unMinStock.
	max_stock := unMaxStock.
	precio := unPrecio.
	vencimiento:= unVencimiento.
	elaboracion:= unElaboracion.!

printString
    ^ 'ID: ', id printString, 
      ' | Tipo: ', tipo, 
      ' | Stock: ', stock printString, 
      ' | Stock Minimo: ', min_stock printString, 
      ' | Stock Maximo: ', max_stock printString, 
      ' | Precio: ', precio printString, 
      ' | Vencimiento: ', vencimiento printString,  "Convertir Date a String"
      ' | Fecha de Elaboracion: ', elaboracion printString.  
!

setElaboracion: unElaboracion
	elaboracion := unElaboracion.!

setMaxStock: unMaximo
	max_stock := unMaximo!

setMinStock: unMinimo
	min_stock := unMinimo!

setPrecio: unPrecio
	precio := unPrecio
	!

setStock: unStock
	stock := unStock!

setTipo: unTipo
	tipo := unTipo!

setVencimiento: unVencimiento
	vencimiento := unVencimiento.! !
!Articulo categoriesFor: #getElaboracion!public! !
!Articulo categoriesFor: #getId!public! !
!Articulo categoriesFor: #getMaxStock!public! !
!Articulo categoriesFor: #getMinStock!public! !
!Articulo categoriesFor: #getPrecio!public! !
!Articulo categoriesFor: #getStock!public! !
!Articulo categoriesFor: #getTipo!public! !
!Articulo categoriesFor: #getVencimiento!public! !
!Articulo categoriesFor: #initialize!public! !
!Articulo categoriesFor: #initialize:stock:min_Stock:max_stock:precio:vencimiento:elaboracion:!public! !
!Articulo categoriesFor: #printString!public! !
!Articulo categoriesFor: #setElaboracion:!public! !
!Articulo categoriesFor: #setMaxStock:!public! !
!Articulo categoriesFor: #setMinStock:!public! !
!Articulo categoriesFor: #setPrecio:!public! !
!Articulo categoriesFor: #setStock:!public! !
!Articulo categoriesFor: #setTipo:!public! !
!Articulo categoriesFor: #setVencimiento:!public! !

!Articulo class methodsFor!

crearConTipo: unTipo stock: unStock min_Stock: unMinimo max_stock:unMaximo precio:unPrecio vencimiento:unVencimiento elaboracion:unElaboracion
	^ self new  
		initialize: unTipo stock: unStock min_Stock: unMinimo max_stock:unMaximo precio:unPrecio vencimiento:unVencimiento elaboracion:unElaboracion;  
		yourself.  
!

initialize
	UltimoID := 0.
	!

nextId
    UltimoID isNil ifTrue: [ UltimoID := 0 ].  
    UltimoID := UltimoID + 1.
    ^UltimoID.! !
!Articulo class categoriesFor: #crearConTipo:stock:min_Stock:max_stock:precio:vencimiento:elaboracion:!public! !
!Articulo class categoriesFor: #initialize!public! !
!Articulo class categoriesFor: #nextId!public! !

