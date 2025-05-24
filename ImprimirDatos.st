| tiposArticulos stockMenor30 stockNoMenor30 detectarAceite |

tiposArticulos := Lubricentro getArticulos collect: [:articulo | articulo getTipo ].
Transcript show: 'Tipos de articulos: '; cr.
Transcript show: tiposArticulos printString; cr; cr.

stockMenor30 := Lubricentro getArticulos select: [: articulo | articulo getStock < 30].
Transcript show: 'Articulos con stock menor a 30: '; cr.
Transcript show: stockMenor30 printString; cr; cr.

stockNoMenor30 := Lubricentro getArticulos reject: [:articulo | articulo getStock < 30].
Transcript show: 'Articulos con stock 30 o mas: '; cr.
Transcript show: stockNoMenor30 printString; cr; cr.

detectarAceite := Lubricentro getArticulos detect: [:articulos | articulos getTipo = 'Aceite 10W40' ] ifNone: [nil].
Transcript show: 'Primer articulo tipo "Aceite 10W40": '; cr.
Transcript show: (detectarAceite isNil  ifTrue: ['No encontrado'] ifFalse: [detectarAceite printString]); cr.