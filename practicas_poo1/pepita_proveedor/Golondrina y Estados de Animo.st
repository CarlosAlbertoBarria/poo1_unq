!classDefinition: #GolondrinaTest category: 'Golondrina y Estados de Animo'!
TestCase subclass: #GolondrinaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Golondrina y Estados de Animo'!

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:19:17'!
test01_unaGolondrinaNoEstáEuforica

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	
	Assert isFalse: (unaGolondrina estaEuforica).! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:37:10'!
test03_unaGolondrinaEstáEuforica

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	unaGolondrina comer: 500 * gram.
		
	Assert isTrue: ( unaGolondrina estaEuforica )! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:50:58'!
test03_unaGolondrinaNoEstáDebil

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	unaGolondrina comer: 50 * gram.
		
	Assert isFalse: ( unaGolondrina estaDebil)! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:42:33'!
test04_unaGolondrinaEstáDebil

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
		
	Assert isTrue: ( unaGolondrina estaDebil)! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:52:27'!
test05_unaGolondrinaNoEstáNeutra

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	unaGolondrina comer: 4 * gram.
		
	Assert isFalse: ( unaGolondrina estaNeutra)! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:52:48'!
test06_unaGolondrinaEstáNeutra

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	unaGolondrina comer: 150 * gram.
		
	Assert isTrue: ( unaGolondrina estaNeutra)! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:54:19'!
test07_unaGolondrinaRealizaDeseoCuandoEstaEuforica

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	unaGolondrina comer: 500 * gram.
	unaGolondrina realizarDeseo.
	
		
	Assert that: unaGolondrina energia isEqualTo: 535 * joule.! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:10:02'!
test08_unaGolondrinaRealizaDeseoCuandoEstaDebil

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	unaGolondrina realizarDeseo.
	
	Assert that: unaGolondrina energia isEqualTo: 545 * joule.! !

!GolondrinaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:16:40'!
test09_unaGolondrinaRealizaDeseoCuandoEstaNeutra

	| unaGolondrina |
	unaGolondrina _ Golondrina new.
	unaGolondrina comer: 100 * gram.
	unaGolondrina realizarDeseo.
	
	Assert that: unaGolondrina energia isEqualTo: 145 * joule.! !


!classDefinition: #EstadoDeAnimoDebil category: 'Golondrina y Estados de Animo'!
Object subclass: #EstadoDeAnimoDebil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Golondrina y Estados de Animo'!

!EstadoDeAnimoDebil methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:09:03'!
realizarDeseoPara: unaGolondrina 

	unaGolondrina realizarDeseoCuandoDebil.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeAnimoDebil class' category: 'Golondrina y Estados de Animo'!
EstadoDeAnimoDebil class
	instanceVariableNames: ''!

!EstadoDeAnimoDebil class methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:41:32'!
canHandle: unaGolondrina 
	
	^ unaGolondrina estaDebil .! !


!classDefinition: #EstadoDeAnimoEuforica category: 'Golondrina y Estados de Animo'!
Object subclass: #EstadoDeAnimoEuforica
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Golondrina y Estados de Animo'!

!EstadoDeAnimoEuforica methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:08:04'!
realizarDeseoPara: unaGolondrina
	
	unaGolondrina realizarDeseoCuandoEuforica.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeAnimoEuforica class' category: 'Golondrina y Estados de Animo'!
EstadoDeAnimoEuforica class
	instanceVariableNames: ''!

!EstadoDeAnimoEuforica class methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:41:53'!
canHandle: unaGolondrina 

	^ unaGolondrina estaEuforica .
	! !


!classDefinition: #EstadoDeAnimoNeutra category: 'Golondrina y Estados de Animo'!
Object subclass: #EstadoDeAnimoNeutra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Golondrina y Estados de Animo'!

!EstadoDeAnimoNeutra methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:16:15'!
realizarDeseoPara: unaGolondrina 
	
	unaGolondrina realizarCuandoNeutra.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeAnimoNeutra class' category: 'Golondrina y Estados de Animo'!
EstadoDeAnimoNeutra class
	instanceVariableNames: ''!

!EstadoDeAnimoNeutra class methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 23:42:15'!
canHandle: unaGolondrina 
	
	^ unaGolondrina estaNeutra .! !


!classDefinition: #Golondrina category: 'Golondrina y Estados de Animo'!
Object subclass: #Golondrina
	instanceVariableNames: 'energia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Golondrina y Estados de Animo'!

!Golondrina methodsFor: 'testing' stamp: 'CB 11/3/2020 00:47:54'!
estaDebil
	
	^ 50 * joule > energia! !

!Golondrina methodsFor: 'testing' stamp: 'CB 11/3/2020 00:37:34'!
estaEuforica
	
	^ energia > (500 * joule)! !

!Golondrina methodsFor: 'testing' stamp: 'CB 11/3/2020 00:52:04'!
estaNeutra
	
	^ energia between: 50 * joule and: 500 * joule.! !


!Golondrina methodsFor: 'action' stamp: 'CB 11/3/2020 00:48:57'!
comer: unaCantidaDeGramosDeComida

	energia _ energia + ((unaCantidaDeGramosDeComida amount) * joule).
	! !

!Golondrina methodsFor: 'action' stamp: 'CB 11/3/2020 23:49:10'!
estadoDeAnimo

	^ ProveedorDeEstadosDeAnimo new estadoDeAnimoPara: self! !

!Golondrina methodsFor: 'action' stamp: 'CB 11/3/2020 23:16:34'!
realizarCuandoNeutra! !

!Golondrina methodsFor: 'action' stamp: 'CB 11/3/2020 23:49:30'!
realizarDeseo
	
	self estadoDeAnimo realizarDeseoPara: self.
	
	! !

!Golondrina methodsFor: 'action' stamp: 'CB 11/3/2020 00:59:51'!
realizarDeseoCuandoDebil
	
	self comer: 500 * gram.! !

!Golondrina methodsFor: 'action' stamp: 'CB 11/3/2020 00:58:56'!
realizarDeseoCuandoEuforica

	^ self volar: 10 * kilometer! !

!Golondrina methodsFor: 'action' stamp: 'CB 11/3/2020 00:55:27'!
volar: unaCantidadDeKilometros

	energia _ energia - ((unaCantidadDeKilometros amount) * joule).
	! !


!Golondrina methodsFor: 'accesing' stamp: 'CB 11/3/2020 00:24:47'!
cantidadDeEnergiaRecuperadaAlComer: unaCantidadDeGramosDeComida

	^ (unaCantidadDeGramosDeComida amount)! !


!Golondrina methodsFor: 'as yet unclassified' stamp: 'CB 11/3/2020 00:48:19'!
initialize
	
	energia _ 45 * joule.! !


!Golondrina methodsFor: 'accessing' stamp: 'CB 11/3/2020 00:31:40'!
energia
	
	^ energia! !


!classDefinition: #ProveedorDeEstadosDeAnimo category: 'Golondrina y Estados de Animo'!
Object subclass: #ProveedorDeEstadosDeAnimo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Golondrina y Estados de Animo'!

!ProveedorDeEstadosDeAnimo methodsFor: 'accesing' stamp: 'CB 11/3/2020 23:54:32'!
estadoDeAnimoPara: unaGolondrina 

	^ (self estadosDeAnimo detect: [: each | each canHandle: unaGolondrina])new.! !

!ProveedorDeEstadosDeAnimo methodsFor: 'accesing' stamp: 'CB 11/3/2020 23:54:32'!
estadosDeAnimo

	^ {EstadoDeAnimoDebil . EstadoDeAnimoEuforica . EstadoDeAnimoNeutra}! !
