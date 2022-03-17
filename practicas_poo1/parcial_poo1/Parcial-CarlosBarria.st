!classDefinition: #ArmaTest category: 'Parcial-CyberCuis2020'!
TestCase subclass: #ArmaTest
	instanceVariableNames: 'arma'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 09:00:14'!
setUp

	arma _ Arma conPuntosDeDaño: 5 "puntos de daño"  yPuntosDeMunicion: 5 "puntos de municion".
	
	^ arma
! !

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 08:58:51'!
test01_unArmaRecienFabricadaNoTienePuntosDeMunicion

	| unArma |
	unArma _ Arma new.
	Assert that: unArma cantidadDeMunicion isEqualTo: 0.! !

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 09:09:04'!
test02_unArmaFabricadaConCiertoPuntosDeMunicion

	| unArma |
	unArma _ Arma conPuntosDeDaño: 5 "puntos de daño" yPuntosDeMunicion: 5 "puntos de municion" .
	Assert that: unArma cantidadDeMunicion isEqualTo: 5 "puntos de municion".! !

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 02:43:39'!
test03_unArmaFabricadaSinPuntosDeDaño

	| unArma |
	unArma _ Arma new.
	Assert that: unArma puntosDeDaño isEqualTo: 0 "puntos de daño".! !

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 09:06:05'!
test04_unArmaFabricadaConCiertosPuntosDeDaño

	| unArma |
	unArma _ Arma conPuntosDeDaño: 10 "puntos de daño"  yPuntosDeMunicion: 5 "puntos de municion".
	Assert that: unArma puntosDeDaño isEqualTo: 10 "puntos de daño".! !

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 02:43:39'!
test05_unArmaTieneElCargadorVacio
	
	|unArma|
	
	unArma _ Arma new.
	
	Assert isTrue: (unArma cargadorEstaVacio)
	
! !

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 01:36:17'!
test06_unArmaNoTieneElCargadorVacio
	
	
	Assert isTrue: ( arma cargadorNoEstaVacio)
! !

!ArmaTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 09:29:38'!
test06_unArmaTieneUnLimiteDeCargaDeMunicion
	
	|unArma|
	
	unArma _ Arma conPuntosDeDaño: 5 "puntos de daño" yPuntosDeMunicion: 60 "puntos de municion".
	 
	 
	Assert that: ( unArma cantidadDeMunicion ) isEqualTo: unArma limiteDeCarga.
! !


!classDefinition: #HackersTest category: 'Parcial-CyberCuis2020'!
TestCase subclass: #HackersTest
	instanceVariableNames: 'cykopath factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!HackersTest methodsFor: 'initialization' stamp: 'CB 11/8/2020 23:34:49'!
test01_unNuevoHacker_conApodo_conEdad_conPuntosDeSalud_SinFama

	| unHacker |
	unHacker _ factory unHackerDeApodoBytech.
	Assert that: unHacker nivelDeFama isEqualTo: 0.
	! !


!HackersTest methodsFor: 'action' stamp: 'CB 11/8/2020 22:45:08'!
test10_unHackerAtacaConAtaqueCiberneticoAUnPersonajeDerrotadoFueraDeCombate

	| unHacker unPersonajeDerrotado puntosDeSaludInicialDelEnemigoDerrotado|
	
	unHacker _ factory unHackerDeApodoBytech .
	unPersonajeDerrotado _ factory unPersonajeDerrotado.
	puntosDeSaludInicialDelEnemigoDerrotado _ unPersonajeDerrotado puntosDeSalud.
	
	unHacker atacaA: unPersonajeDerrotado.
	
	
	Assert that: unPersonajeDerrotado puntosDeSalud isEqualTo: (puntosDeSaludInicialDelEnemigoDerrotado - unHacker poderOfensivo). ! !

!HackersTest methodsFor: 'action' stamp: 'CB 11/8/2020 22:48:31'!
test11_unHackerAtacaConSuAtaqueCiberneticoAUnPersonajeEnCombate

	| unOponente unHacker puntosDeSaludInicialDelOponente |
	
	unHacker _ factory unHackerDeApodoBytech .
	unOponente _ Mercenario conApodo: 'anvil' conEdadDe: 24 * year  conPuntosDeSalud: 40 "puntos de salud".
	puntosDeSaludInicialDelOponente _ unOponente puntosDeSalud .
	unHacker atacaA: unOponente .
	
	Assert that: unOponente puntosDeSalud isEqualTo: ( puntosDeSaludInicialDelOponente - unHacker poderOfensivo). ! !


!HackersTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:33:00'!
setUp
	
	
	factory := Factory new.! !


!HackersTest methodsFor: 'testing' stamp: 'CB 11/8/2020 23:35:19'!
test02_unHackerNoTieneImplantesCiberneticos
	
	|unHacker|
	
	unHacker _ factory unHackerDeApodoNilboy .
	Assert isTrue: ( unHacker noTieneImplantesCiberneticos ). ! !

!HackersTest methodsFor: 'testing' stamp: 'CB 11/8/2020 22:34:08'!
test03_unHackerTieneImplanteCibernetico
	
	| unImplante unHacker |
	
	unHacker _ factory unHackerDeApodoBytech .
	unImplante _ factory unImplanteDeBrazoCiberneticoConPoderDeComputoDe3Puntos .
	unHacker instalarImplante: unImplante.
	
	Assert isTrue: (unHacker tieneImplantesCiberneticos ). ! !

!HackersTest methodsFor: 'testing' stamp: 'CB 11/8/2020 23:36:26'!
test13_unHackerTieneMayorPoderDefensivoQueElPoderOfensivoDeSuOponente

	
	| unHacker unOponente|
	
	unHacker _ factory unHackerDeApodoCykopathConVariosImplantesInstalados .
	unOponente _ factory unHackerDeApodoBytechConVariosImplantesInstalados .
	
	
	
	Assert isTrue: (unHacker poderDefensivoSuperaPoderOfensivoDe: unOponente )! !


!HackersTest methodsFor: 'accessing' stamp: 'CB 11/8/2020 22:35:04'!
test04_unHackerNoTieneInstaladoNingúnImplanteCibernetico
	
	|unHacker|
	
	unHacker _ factory unHackerDeApodoBytech .
	Assert that: unHacker cantidadDeImplantes isEqualTo: 0 "implantes".! !

!HackersTest methodsFor: 'accessing' stamp: 'CB 11/8/2020 22:36:06'!
test05_unHackerTieneInstaladoCiertaCantidadDeImplantesCiberneticos
	
	
	| unImplante otroImplante unHacker|
	unHacker _ factory unHackerDeApodoBytech.
	otroImplante _ factory unImplanteDePieCiberneticoConPoderDeComputoDe5Puntos .
	unImplante _ factory unImplanteDePieCiberneticoConPoderDeComputoDe5Puntos .
	unHacker instalarImplante: unImplante .
	unHacker instalarImplante: otroImplante.
	
	Assert that: unHacker cantidadDeImplantes isEqualTo: 2 "implantes". ! !

!HackersTest methodsFor: 'accessing' stamp: 'CB 11/8/2020 22:36:32'!
test06_elPoderOfensivoDeHackerSinImplantesEsDe0Puntos
	
	|unHacker|
	
	unHacker _ factory unHackerDeApodoBytech.
	Assert that: (unHacker poderOfensivo) isEqualTo: 0 "puntos de daño".! !

!HackersTest methodsFor: 'accessing' stamp: 'CB 11/8/2020 22:41:22'!
test07_elPoderOfensivoDeHackerConImplantesEstaDeterminadoPorLaCantidadDeImplantesQueTieneInstaladoMasElPoderDeComputoAcumuladoDeCadaImplante

	|unHackerConImplantes|
	
	unHackerConImplantes _ factory unHackerConVariosImplantes .
	
	Assert that: ( unHackerConImplantes poderOfensivo) isEqualTo: 21 "puntos de daño".! !

!HackersTest methodsFor: 'accessing' stamp: 'CB 11/8/2020 22:42:08'!
test08_elPoderDefensivoDeHackerSinImplantesEsDe0Puntos
	
	|unHacker|
	
	unHacker _ factory unHackerDeApodoBytech .
	Assert that: unHacker poderDefensivo isEqualTo: 0 "puntos de defensa".! !

!HackersTest methodsFor: 'accessing' stamp: 'CB 11/8/2020 22:42:54'!
test09_elPoderDefensivoDeHackerConImplantesEstaDeterminadoPorLaCantidadDeImplantesQueTieneInstaladoMasElPromedioDePoderDeComputoTotalAcumuladoDeCadaImplante

	|unHackerConImplantes|
	
	unHackerConImplantes _ factory unHackerConVariosImplantes .
	
	Assert that: unHackerConImplantes poderDefensivo isEqualTo: 9 "puntos de defensa".

! !


!classDefinition: #ImplanteTest category: 'Parcial-CyberCuis2020'!
TestCase subclass: #ImplanteTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!ImplanteTest methodsFor: 'initialization' stamp: 'CB 11/7/2020 16:58:40'!
test01_unImplanteRecienFabricadoNoTienePoderDeComputo

	| unImplante |
	unImplante _ ImplanteCibernetico new.
	Assert that: unImplante puntosDePoderDeComputo isEqualTo: 0 "puntos de computo"! !

!ImplanteTest methodsFor: 'initialization' stamp: 'CB 11/7/2020 16:58:40'!
test02_unImplanteFabricadoConCiertosPuntosDePoderDeComputo

	| unImplante |
	unImplante _ ImplanteCibernetico conPoderDeComputoDe: 15 "puntos de poder de computo".
	Assert that: unImplante puntosDePoderDeComputo isEqualTo: 15 "puntos de poder de computo"! !


!classDefinition: #MercenariosTest category: 'Parcial-CyberCuis2020'!
TestCase subclass: #MercenariosTest
	instanceVariableNames: 'mercenario factory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!MercenariosTest methodsFor: 'testing' stamp: 'CB 11/8/2020 23:02:30'!
test02_unMercenarioNoTieneEquipadaUnArma

	| unArma unMercenario |
	unMercenario _ factory unMercenarioDeApodoAnvil .
	unArma _ Arma new.
	
	Assert isFalse: (unMercenario tieneArmaEquipada: unArma).
	! !

!MercenariosTest methodsFor: 'testing' stamp: 'CB 11/8/2020 23:02:58'!
test03_unMercenarioTieneEquipadaUnArma

	| unMercenario unArma |
	
	unArma _ Arma new.
	unMercenario _ factory unMercenarioDeApodoAimax.
	unMercenario equiparseCon: unArma.
	
	Assert isTrue: (unMercenario tieneArmaEquipada: unArma).
	! !

!MercenariosTest methodsFor: 'testing' stamp: 'CB 11/8/2020 23:03:31'!
test04_unMercenarioNoTieneImplanteCibernetico
	
	| unMercenario |
	unMercenario _ factory unMercenarioDeApodoAimax .
	Assert isTrue: (unMercenario noTieneImplantesCiberneticos). ! !

!MercenariosTest methodsFor: 'testing' stamp: 'CB 11/8/2020 23:04:19'!
test05_unMercenarioTieneImplanteCibernetico
	
	| unImplante unMercenario |
	unMercenario _ factory unMercenarioDeApodoAimax.
	unImplante _ factory unImplanteDeBrazoCiberneticoConPoderDeComputoDe3Puntos.
	unMercenario instalarImplante: unImplante.
	
	Assert isTrue: (unMercenario tieneImplantesCiberneticos). ! !

!MercenariosTest methodsFor: 'testing' stamp: 'CB 11/8/2020 23:04:47'!
test06_unMercenarioNoTieneInstaladoNingúnImplanteCibernetico

	| unMercenario |
	unMercenario _ factory unMercenarioDeApodoAimax .

	Assert that: unMercenario cantidadDeImplantes isEqualTo: 0 "implantes". ! !


!MercenariosTest methodsFor: 'accessing' stamp: 'CB 11/8/2020 23:07:55'!
test07_unMercenarioTieneInstaladoCiertaCantidadDeImplantesCiberneticos
	
	
	|unMercenario|
	
	unMercenario _ factory unMercenarioConDosImplantesInstalados .
	Assert that: unMercenario cantidadDeImplantes isEqualTo: 2 "implantes". ! !


!MercenariosTest methodsFor: 'action' stamp: 'CB 11/8/2020 23:13:23'!
test12_unMercenarioAtacaConSusPuñosAUnPersonajeDerrotadoFueraDeCombate

	| unPersonajeDerrotado unMercenario |
	
	unMercenario _ factory unMercenarioDeApodoAnvil .
	unPersonajeDerrotado _ factory unPersonajeDerrotado.
	unMercenario atacaA: unPersonajeDerrotado.
	
	Assert that: unPersonajeDerrotado puntosDeSalud isEqualTo: (unMercenario poderOfensivo). ! !

!MercenariosTest methodsFor: 'action' stamp: 'CB 11/8/2020 23:27:40'!
test13_unMercenarioAtacaConSusPuñosAUnPersonajeEnCombate

	| unOponente  puntosDeSaludInicialDelOponente unMercenario |
	unMercenario _ factory unHackerDeApodoXiominox.
	unOponente _ factory unMercenarioDeApodoAnvil .
	puntosDeSaludInicialDelOponente _ unOponente puntosDeSalud .
	
	unMercenario atacaA: unOponente.
	
	Assert that: unOponente puntosDeSalud isEqualTo: (puntosDeSaludInicialDelOponente - unMercenario poderOfensivo). ! !

!MercenariosTest methodsFor: 'action' stamp: 'CB 11/8/2020 23:28:22'!
test14_unMercenarioEquipadoConUnArmaRecargaPuntosDeMunicion

	| unArma unMercenario |
	unMercenario _ factory unMercenarioDeApodoAimax .
	
	unArma _ Arma conPuntosDeDaño: 2 yPuntosDeMunicion: 2 "puntos de municion" .
	
	unMercenario recargar: unArma con: 4 "puntos de municion".
	
	Assert that: unArma cantidadDeMunicion isEqualTo: 6 "puntos de municion".! !

!MercenariosTest methodsFor: 'action' stamp: 'CB 11/8/2020 23:37:06'!
test15_unMercenarioEquipadoConUnArmaRecargadaDisparaASuOponente

	| unArma unOponente|
	unOponente _ Hacker conApodo: 'xiominox' conEdadDe: 28 * year conPuntosDeSalud: 3 "puntos de salud".
	unArma _ Arma conPuntosDeDaño: 2 yPuntosDeMunicion: 2 "puntos de municion" .
	mercenario equiparseCon: unArma.
	mercenario recargar: unArma con: 4 "puntos de municion".
	mercenario disparaA: unOponente con: unArma.
	
	Assert that: unArma cantidadDeMunicion isEqualTo: 5 "puntos de municion".
	Assert that: unOponente puntosDeSalud isEqualTo: 1 "puntos de salud".! !

!MercenariosTest methodsFor: 'action' stamp: 'CB 11/8/2020 23:38:34'!
test16_unMercenarioEquipadoConUnArmaSinMunicionesDisparaASuOponente

	| unArma unOponente|
	unOponente _ Hacker conApodo: 'xiominox' conEdadDe: 28 * year conPuntosDeSalud: 3 "puntos de salud".
	unArma _ Arma conPuntosDeDaño: 2 yPuntosDeMunicion: 0 "puntos de municion" .
	
	mercenario disparaA: unOponente con: unArma.
	
	Assert that: unOponente puntosDeSalud isEqualTo: 3 "puntos de salud".
	Assert that: unArma cantidadDeMunicion isEqualTo: 0 "puntos de municion".
	
	
	"me faltó testear este caso contra un oponente que sea mercenario"
	! !

!MercenariosTest methodsFor: 'action' stamp: 'CB 11/8/2020 06:50:57'!
test17_unMercenarioRecibeDañoDeSuOponente

	| unOponente implanteDeOjo|
	implanteDeOjo _ ImplanteCibernetico conPoderDeComputoDe: 20 "puntos de poder de computo".
	unOponente _ Hacker conApodo: 'xiominox' conEdadDe: 28 * year conPuntosDeSalud: 3 "puntos de salud".
	unOponente instalarImplante: implanteDeOjo .
	
	mercenario recibeDañoDe: unOponente.
	
	Assert that: mercenario puntosDeSalud isEqualTo: 0.! !


!MercenariosTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 23:31:35'!
setUp
	
	factory := Factory new.
	
	mercenario _ Mercenario conApodo: 'carl' conEdadDe: 30*year  conPuntosDeSalud: 5 "puntos de salud".
	
	^ mercenario ! !

!MercenariosTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 23:08:50'!
test08_elPoderOfensivoDeUnMercenarioQueNoEquipaUnArmaEstaDeterminadoPorElDañoDeSuPuñetazo
	|unMercenario|
	
	unMercenario _ factory unMercenarioDeApodoAnvil .
	Assert that: (unMercenario poderOfensivo) isEqualTo: unMercenario armaDeAtaque puntosDeDaño .
	! !

!MercenariosTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 23:39:33'!
test09_elPoderOfensivoDeUnMercenarioEquipadoConArmaEstaDeterminadoPorElDañoDeSuArmaEquipada

	| unArmaDeAtaque unMercenario |
	
	unArmaDeAtaque _ factory unArmaMediana .
	unMercenario _ factory unMercenarioDeApodoAimax .
	unMercenario equiparseCon: unArmaDeAtaque.
	
	Assert that: (unMercenario poderOfensivo) isEqualTo: unArmaDeAtaque puntosDeDaño .
	! !

!MercenariosTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 23:10:22'!
test10_elPoderDefensivoDeMercenarioSinImplantesEsDe0Puntos
	
	|unMercenario|
	
	unMercenario _ factory unMercenarioDeApodoAimax .
	Assert that: unMercenario poderDefensivo isEqualTo: 0 "puntos de defensa".! !

!MercenariosTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 23:11:49'!
test11_elPoderDefensivoDeMercenarioConImplantesEstaDeterminadoPorLaCantidadDeImplantesQueTieneInstalado

	|unMercenario|
	
	unMercenario _ factory unMercenarioConDosImplantesInstalados .
	
	Assert that: unMercenario poderDefensivo isEqualTo: unMercenario cantidadDeImplantes.! !


!MercenariosTest methodsFor: 'initialization' stamp: 'CB 11/8/2020 23:01:41'!
test01_unMercenario_conApodo_conEdad_conPuntosDeSalud_SinFama

	|unMercenario|
	
	unMercenario _ factory unMercenarioDeApodoAimax.
	Assert that: unMercenario nivelDeFama isEqualTo: 0.! !


!classDefinition: #NightCityTest category: 'Parcial-CyberCuis2020'!
TestCase subclass: #NightCityTest
	instanceVariableNames: 'unaCiudad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/7/2020 17:56:51'!
setUp

	unaCiudad _ NightCity new.
	
	^ unaCiudad! !

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/7/2020 21:51:21'!
test01_ciudadNightCityRecienInauguradaNoTieneHabitantesRegistrados

	Assert that: unaCiudad cantidadDeHabitantesRegistrados isEqualTo: 0 "habitantes".! !

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/7/2020 21:44:18'!
test02_ciudadNightCityTieneHabitantesRegistrados

	| unHabitante otroHabitante |
	
	unHabitante _ Hacker new. 
	otroHabitante _ Mercenario new.
	unaCiudad registrarA: unHabitante.
	unaCiudad registrarA: otroHabitante.

	Assert that: unaCiudad cantidadDeHabitantesRegistrados isEqualTo: 2 "habitantes".! !

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:14:53'!
test03_ciudadNightCityNoRegistra2VecesAlMismoPersonaje

	|unPersonaje|
	unPersonaje _ Mercenario new.
	unaCiudad registrarA: unPersonaje.
	unaCiudad registrarA: unPersonaje.
		
	Assert that: unaCiudad cantidadDeHabitantesRegistrados isEqualTo: 1 "habitantes".! !

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/7/2020 21:45:35'!
test05_ciudadNightCityNoTieneHabitantesConImplantesCuandoEstaDeshabitada

	Assert isTrue: (unaCiudad ningunHabitanteConImplantes).! !

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/7/2020 21:39:59'!
test06_ciudadNightCityTieneAlgunoDeSusHabitantesConImplantes

	| otroPersonaje unPersonaje ojoCibernetico |
	
	ojoCibernetico _ ImplanteCibernetico new.
	unPersonaje _ Hacker new.
	otroPersonaje _ Mercenario new.
	unPersonaje instalarImplante: ojoCibernetico .
	
	unaCiudad registrarA: unPersonaje.
	unaCiudad registrarA: otroPersonaje.

	Assert isTrue: (unaCiudad tieneAlgunHabitanteConImplantes).! !

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 02:48:26'!
test07_ciudadNightCityEsUnaCiudadPura

	| unPersonaje otroPersonaje |
	
	unPersonaje _ Hacker new.
	otroPersonaje _ Mercenario new.
	
	unaCiudad registrarA: unPersonaje.
	unaCiudad registrarA: otroPersonaje.

	Assert isTrue: (unaCiudad esCiudadPura).! !

!NightCityTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 02:48:38'!
test08_ciudadNightCityEsUnaCiudadImpura

	| unPersonaje otroPersonaje ojoCibernetico|
	ojoCibernetico _ ImplanteCibernetico new.
	unPersonaje _ Hacker new.
	otroPersonaje _ Mercenario new.
	unPersonaje instalarImplante: ojoCibernetico .
	
	unaCiudad registrarA: unPersonaje.
	unaCiudad registrarA: otroPersonaje.

	Assert isTrue: (unaCiudad esCiudadImpura).! !


!classDefinition: #PuñetazoTest category: 'Parcial-CyberCuis2020'!
TestCase subclass: #PuñetazoTest
	instanceVariableNames: 'puntosDeDaño mercenario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!PuñetazoTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 10:04:49'!
setUp


	mercenario _ 
	Mercenario conApodo: 'aimax' conEdadDe: 35 * year  conPuntosDeSalud: 15 "puntos de salud".
	^ mercenario! !

!PuñetazoTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 10:04:37'!
test01_unPuñetazoNoTienePuntosDeDaño

	| unAtaqueDePuño |
	
	unAtaqueDePuño _ Puñetazo new.
	
	Assert that: unAtaqueDePuño puntosDeDaño isEqualTo: 0 "puntos de daño".
! !

!PuñetazoTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 10:04:59'!
test02_unPuñetazoTieneCiertosPuntosDeDaño

	| unAtaqueDePuño |
	
	unAtaqueDePuño _ Puñetazo conPuntosDeDaño: 5 "puntos de daño".
	
	Assert that: unAtaqueDePuño puntosDeDaño isEqualTo: 5 "puntos de daño".! !

!PuñetazoTest methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 10:07:48'!
test03_unPuñetazoTieneTantosPuntosDeDañoComoPuntosDeSaludTieneUnMercenario

	| armaDeAtaque |
	
	
	armaDeAtaque _ Puñetazo conPuntosDeDaño: mercenario puntosDeSalud.
	mercenario equiparseCon: armaDeAtaque.
	
	Assert that: (mercenario armaDeAtaque ) puntosDeDaño isEqualTo: mercenario puntosDeSalud.! !


!classDefinition: #Arma category: 'Parcial-CyberCuis2020'!
Object subclass: #Arma
	instanceVariableNames: 'puntosDeMunicion puntosDeDaño'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!Arma methodsFor: 'accessing' stamp: 'CB 11/8/2020 08:58:51'!
cantidadDeMunicion
	
	^ puntosDeMunicion! !

!Arma methodsFor: 'accessing' stamp: 'CB 11/8/2020 02:43:22'!
estadoDeCargaDelArma
	
	^ ProovedorDeEstadosDeCargaDeArma new estadoDeCargaPara: self.! !

!Arma methodsFor: 'accessing' stamp: 'CB 11/8/2020 09:30:14'!
limiteDeCarga
	
	^ 30 "puntos de municion".! !

!Arma methodsFor: 'accessing' stamp: 'CB 11/8/2020 00:53:31'!
municionPerdidaPorDisparo
	
	^ 1 "puntos de municion"! !

!Arma methodsFor: 'accessing' stamp: 'CB 11/5/2020 16:29:17'!
puntosDeDaño
	
	^ puntosDeDaño .! !

!Arma methodsFor: 'accessing' stamp: 'CB 11/8/2020 02:37:08'!
puntosDeDañoPorDisparo
	
	^ (self estadoDeCargaDelArma) perderMunicionPara: self.
	 ! !


!Arma methodsFor: 'initialization' stamp: 'CB 11/8/2020 09:02:20'!
cargaLimitePara: unaCantidadDePuntosDeMunicion

	^ unaCantidadDePuntosDeMunicion min: 50! !

!Arma methodsFor: 'initialization' stamp: 'CB 11/8/2020 09:30:54'!
conPuntosDeDaño: unaCantidadDePuntosDeDaño yPuntosDeMunicion: unaCantidadDePuntosDeMunicion  
	
	puntosDeDaño _ unaCantidadDePuntosDeDaño .
	puntosDeMunicion _ unaCantidadDePuntosDeMunicion min: 30 .! !

!Arma methodsFor: 'initialization' stamp: 'CB 11/5/2020 16:27:15'!
initialize

	puntosDeMunicion _ 0 "municiones".
	puntosDeDaño _ 0 "puntos de daño".! !


!Arma methodsFor: 'action' stamp: 'CB 11/8/2020 02:34:12'!
realizarDisparoCuandoCargadorNoEstaVacio
	
	puntosDeMunicion _ (puntosDeMunicion - (self municionPerdidaPorDisparo)).
	! !

!Arma methodsFor: 'action' stamp: 'CB 11/8/2020 09:24:13'!
realizarDisparoCuandoCargadorVacio

	
	
! !

!Arma methodsFor: 'action' stamp: 'CB 11/8/2020 02:59:43'!
recargadaCon: unaCantidadDePuntosDeMunicion conPuntosDeDaño: unaCantidadDePuntosDeDaño 
 
	puntosDeMunicion _ puntosDeMunicion + unaCantidadDePuntosDeMunicion .! !

!Arma methodsFor: 'action' stamp: 'CB 11/8/2020 00:23:19'!
seCargaCon: unaCantidadDePuntosDeMunicion

	puntosDeMunicion _ puntosDeMunicion + unaCantidadDePuntosDeMunicion.
	! !


!Arma methodsFor: 'testing' stamp: 'CB 11/8/2020 01:34:53'!
cargadorEstaVacio
	
	^ (puntosDeMunicion = 0 "puntos de municion").! !

!Arma methodsFor: 'testing' stamp: 'CB 11/8/2020 01:35:33'!
cargadorNoEstaVacio
	
	^ puntosDeMunicion > 0 "puntos de municion".! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arma class' category: 'Parcial-CyberCuis2020'!
Arma class
	instanceVariableNames: ''!

!Arma class methodsFor: 'instance creation' stamp: 'CB 11/8/2020 09:10:38'!
conPuntosDeDaño: unaCantidadDePuntosDeDaño yPuntosDeMunicion: unaCantidadDePuntosDeMunicion  
	
	^self new conPuntosDeDaño: unaCantidadDePuntosDeDaño yPuntosDeMunicion:   unaCantidadDePuntosDeMunicion ! !

!Arma class methodsFor: 'instance creation' stamp: 'CB 11/8/2020 09:00:10'!
conPuntosDeDaño: unaCantidadDePuntosDeDaño yPuntosDeMunicionX: unaCantidadDePuntosDeMunicion 
	
	^self new conPuntosDeDaño: unaCantidadDePuntosDeDaño yPuntosDeMunicion: unaCantidadDePuntosDeMunicion ! !

!Arma class methodsFor: 'instance creation' stamp: 'CB 11/8/2020 02:59:43'!
recargadaCon: unaCantidadDePuntosDeMunicion conPuntosDeDaño: unaCantidadDePuntosDeDaño 
	
	^self new recargadaCon: unaCantidadDePuntosDeMunicion conPuntosDeDaño: unaCantidadDePuntosDeDaño ! !

!Arma class methodsFor: 'instance creation' stamp: 'CB 11/8/2020 09:06:50'!
recargadaCon: unaCantidadDePuntosDeMunicion conPuntosDeDañoX: unaCantidadDePuntosDeDaño 
	
	^self new conPuntosDeDaño: unaCantidadDePuntosDeDaño yPuntosDeMunicion: unaCantidadDePuntosDeMunicion.! !


!Arma class methodsFor: 'accessing' stamp: 'CB 11/8/2020 09:20:09'!
estadoDeCargaDelArma
	
	! !


!classDefinition: #Factory category: 'Parcial-CyberCuis2020'!
Object subclass: #Factory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:23:02'!
unArmaMediana
	| unArma |

	unArma _ Arma conPuntosDeDaño: 15 "puntos de daño" yPuntosDeMunicion: 10 "puntos de municion".
	
	^ unArma .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:22:31'!
unArmaPequeña
	| unArmaPequeña |

	unArmaPequeña _ Arma conPuntosDeDaño: 2 "puntos de daño" yPuntosDeMunicion: 2 "puntos de municion" .
	
	^ unArmaPequeña .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:23:51'!
unArmaSinBalas
	| unArmaSinBalas |

	unArmaSinBalas _ Arma conPuntosDeDaño: 2 yPuntosDeMunicion: 0 "puntos de municion" .
	
	^ unArmaSinBalas .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:40:36'!
unHackerConVariosImplantes


	| unHackerConImplantes implanteDeOjoCibernetico implanteDeBrazoCibernetico implanteDePiernaCibernetica|
	
	implanteDeOjoCibernetico _ ImplanteCibernetico conPoderDeComputoDe: 5 "puntos".
	implanteDeBrazoCibernetico _ ImplanteCibernetico conPoderDeComputoDe: 8 "puntos".
	implanteDePiernaCibernetica _ ImplanteCibernetico conPoderDeComputoDe: 5 "puntos".
	unHackerConImplantes _ Hacker conApodo: 'cykopath' conEdadDe: 20 * year  conPuntosDeSalud: 5 "puntos de salud".
	unHackerConImplantes instalarImplante: implanteDeOjoCibernetico.
	unHackerConImplantes instalarImplante: implanteDeBrazoCibernetico.
	unHackerConImplantes instalarImplante: implanteDePiernaCibernetica.
	
	^ unHackerConImplantes .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:20:45'!
unHackerDeApodoBytech
	| bytech |

	bytech _ Hacker conApodo: 'bytech' conEdadDe: 23* year  conPuntosDeSalud: 20 "puntos de salud".
	
	^ bytech .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:57:22'!
unHackerDeApodoBytechConVariosImplantesInstalados
	
	
	| bytech implanteCiberneticoManos implanteCiberneticoPectoral implanteCiberneticoPie |
	implanteCiberneticoPectoral _ ImplanteCibernetico conPoderDeComputoDe: 1 "puntos de computo".
	implanteCiberneticoPie _ ImplanteCibernetico conPoderDeComputoDe: 5 "puntos de computo".
	implanteCiberneticoManos _ ImplanteCibernetico conPoderDeComputoDe: 1 "puntos de computo".
	bytech _ Hacker conApodo: 'bytech' conEdadDe: 23* year  conPuntosDeSalud: 20 "puntos de salud".
	bytech instalarImplante: implanteCiberneticoPectoral .
	bytech instalarImplante: implanteCiberneticoPie .
	bytech instalarImplante: implanteCiberneticoManos .
	
	^ bytech ! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:56:01'!
unHackerDeApodoCykopathConVariosImplantesInstalados

	| cykopath implanteDeBrazo implanteDeOjo implanteDePierna |
	
	cykopath _ Hacker conApodo: 'cykopath' conEdadDe: 20 * year  conPuntosDeSalud: 12 "puntos de salud" .
	implanteDeOjo _ ImplanteCibernetico conPoderDeComputoDe: 20 "puntos de computo".
	implanteDePierna _ ImplanteCibernetico conPoderDeComputoDe: 10 "puntos de computo".
	implanteDeBrazo _ ImplanteCibernetico conPoderDeComputoDe: 3 "puntos de computo".
	cykopath instalarImplante: implanteDeOjo .
	cykopath instalarImplante: implanteDePierna .
	cykopath instalarImplante: implanteDeBrazo.
	
	^ cykopath ! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:21:14'!
unHackerDeApodoNilboy
	| nilboy |


	nilboy _ Hacker conApodo: 'nilboy' conEdadDe: 18 * year  conPuntosDeSalud: 50 "puntos de salud".
	
	^ nilboy .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 23:33:01'!
unHackerDeApodoXiominox
	| Xiominox |

	Xiominox _ Hacker conApodo: 'xiominox' conEdadDe: 28 * year conPuntosDeSalud: 30 "puntos de salud".
	
	^ Xiominox .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:05:14'!
unImplanteDeBrazoCiberneticoConPoderDeComputoDe3Puntos
	|implanteDeBrazo|

	implanteDeBrazo _ ImplanteCibernetico conPoderDeComputoDe: 3 "puntos de computo".
	
	^ implanteDeBrazo .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:08:05'!
unImplanteDeManoCiberneticoConPoderDeComputoDe1Punto
	| implanteDeMano |

	implanteDeMano _ ImplanteCibernetico conPoderDeComputoDe: 1 "puntos de computo".
	
	^ implanteDeMano .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:03:23'!
unImplanteDeOjoCiberneticoConPoderDeComputoDe20Puntos
	
	|implanteDeOjo|
	
	
	implanteDeOjo _ ImplanteCibernetico conPoderDeComputoDe: 20 "puntos de computo".
		
	^ implanteDeOjo.
	! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:06:31'!
unImplanteDePectoralCiberneticoConPoderDeComputoDe1Puntos
	|implanteDePectoral |

	implanteDePectoral _ ImplanteCibernetico conPoderDeComputoDe: 1 "puntos de computo".
	
	^ implanteDePectoral .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:07:27'!
unImplanteDePieCiberneticoConPoderDeComputoDe5Puntos
	| implanteDePie |

	implanteDePie _ ImplanteCibernetico conPoderDeComputoDe: 5 "puntos de computo".
	
	^ implanteDePie .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:04:24'!
unImplanteDePiernaCiberneticaConPoderDeComputoDe10Puntos
	|implanteDePierna|

	implanteDePierna _ ImplanteCibernetico conPoderDeComputoDe: 10 "puntos de computo".
	
	^ implanteDePierna .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 23:07:15'!
unMercenarioConDosImplantesInstalados
	
	
	
	|unImplante otroImplante dutec|
	
	dutec _ Mercenario conApodo: 'dutec' conEdadDe: 18* year conPuntosDeSalud: 5 "puntos de salud". 
	otroImplante _ ImplanteCibernetico new.
	unImplante _ ImplanteCibernetico new.
	dutec instalarImplante: unImplante.
	dutec instalarImplante: otroImplante.
	
	^ dutec ! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:18:50'!
unMercenarioDeApodoAimax
	|aimax |

	aimax _ Mercenario conApodo: 'aimax' conEdadDe: 35 * year conPuntosDeSalud: 15.
	
	^ aimax .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:50:52'!
unMercenarioDeApodoAnvil
	| anvil |


	anvil _ Mercenario conApodo: 'anvil' conEdadDe: 24 * year  conPuntosDeSalud: 40 "puntos de salud".
	
	^ anvil .! !

!Factory methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 22:14:06'!
unPersonajeDerrotado
	| unPersonajeDerrotado |

	unPersonajeDerrotado _ Mercenario conApodo: 'firedora' conEdadDe: 25 * year  conPuntosDeSalud: 0 "puntos de salud".
	
	^ unPersonajeDerrotado .! !


!classDefinition: #ImplanteCibernetico category: 'Parcial-CyberCuis2020'!
Object subclass: #ImplanteCibernetico
	instanceVariableNames: 'puntosDePoder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!ImplanteCibernetico methodsFor: 'accessing' stamp: 'CB 11/7/2020 16:58:40'!
puntosDePoderDeComputo
	
	^ puntosDePoder.! !


!ImplanteCibernetico methodsFor: 'initialization' stamp: 'CB 11/5/2020 16:45:01'!
conPoderDeComputoDe: unaCantidadDePuntosDePoderDeComputo 
	
	puntosDePoder _ unaCantidadDePuntosDePoderDeComputo .! !

!ImplanteCibernetico methodsFor: 'initialization' stamp: 'CB 11/5/2020 16:42:56'!
initialize
	
	puntosDePoder _ 0 "puntos de poder de computo"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ImplanteCibernetico class' category: 'Parcial-CyberCuis2020'!
ImplanteCibernetico class
	instanceVariableNames: ''!

!ImplanteCibernetico class methodsFor: 'instance creation' stamp: 'CB 11/5/2020 16:44:20'!
conPoderDeComputoDe: unaCantidadDePuntosDePoderDeComputo 
	
	^self new conPoderDeComputoDe: unaCantidadDePuntosDePoderDeComputo ! !


!classDefinition: #NightCity category: 'Parcial-CyberCuis2020'!
Object subclass: #NightCity
	instanceVariableNames: 'habitantes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!NightCity methodsFor: 'initialization' stamp: 'CB 11/8/2020 22:08:15'!
initialize

	habitantes _ Set new.! !


!NightCity methodsFor: 'accessing' stamp: 'CB 11/8/2020 22:08:15'!
cantidadDeHabitantesRegistrados
	
	^ habitantes size.! !


!NightCity methodsFor: 'action' stamp: 'CB 11/8/2020 22:08:15'!
registrarA: unPersonaje 
	
	habitantes add: unPersonaje .! !


!NightCity methodsFor: 'testing' stamp: 'CB 11/7/2020 21:38:56'!
esCiudadImpura
	
	^ self tieneAlgunHabitanteConImplantes! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/7/2020 21:38:40'!
esCiudadPura
	
	^ self noTieneHabitantes or: self ningunHabitanteConImplantes.! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/8/2020 22:08:37'!
habitanteLeyenda

	^ self habitanteMasFamoso! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/8/2020 22:08:37'!
habitanteMasFamoso

	^ habitantes detectMax: [: each | each nivelDeFama]! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/8/2020 22:08:15'!
habitantesConImplantes

	^ habitantes select: [: each | each tieneImplantesCiberneticos]! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/8/2020 22:08:15'!
habitantesDespreciables

	^ habitantes select: [: each | each tieneFamaNegativa]! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/7/2020 21:24:24'!
ningunHabitanteConImplantes
	
	^ self noTieneHabitantes or: self todosLosHabitantesNoTienenImplantesCiberneticos .! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/8/2020 22:08:15'!
noTieneHabitantes

	^ habitantes notEmpty! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/7/2020 21:41:59'!
tieneAlgunHabitanteConImplantes
	
	^ (self habitantesConImplantes) notEmpty .! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/8/2020 22:08:15'!
todosLosHabitantesNoTienenImplantesCiberneticos

	^ [habitantes allSatisfy: [: each | each noTieneImplantesCiberneticos]]! !

!NightCity methodsFor: 'testing' stamp: 'CB 11/8/2020 22:08:15'!
todosSusHabitantesNoTienenImplantesCiberneticos

	^ [habitantes allSatisfy: [: each | each noTieneImplantesCiberneticos]]! !


!classDefinition: #Personaje category: 'Parcial-CyberCuis2020'!
Object subclass: #Personaje
	instanceVariableNames: 'apodo edad puntosDeSalud nivelDeFama implantes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!Personaje methodsFor: 'initialization' stamp: 'CB 11/8/2020 23:44:19'!
conApodo: unApodo conEdadDe: unaEdad conPuntosDeSalud: unaCantidadDePuntosDeSalud  
	
	apodo _ unApodo .
	edad _ unaEdad.
	puntosDeSalud _ unaCantidadDePuntosDeSalud.
	
	
	! !


!Personaje methodsFor: 'accessing' stamp: 'CB 11/7/2020 16:10:40'!
apodo
	
	^ apodo! !

!Personaje methodsFor: 'accessing' stamp: 'CB 11/5/2020 22:21:18'!
cantidadDeImplantes

	^ implantes size! !

!Personaje methodsFor: 'accessing' stamp: 'CB 11/5/2020 19:28:44'!
edad
	
	^edad! !

!Personaje methodsFor: 'accessing' stamp: 'CB 11/5/2020 19:27:05'!
nivelDeFama
	
	^nivelDeFama! !

!Personaje methodsFor: 'accessing' stamp: 'CB 11/7/2020 19:40:55'!
poderDefensivo

	self subclassResponsibility .! !

!Personaje methodsFor: 'accessing' stamp: 'CB 11/7/2020 19:41:06'!
poderOfensivo
	
	self subclassResponsibility .! !

!Personaje methodsFor: 'accessing' stamp: 'CB 11/8/2020 07:01:18'!
puntosDeSalud
	
	^ puntosDeSalud ! !

!Personaje methodsFor: 'accessing' stamp: 'CB 11/8/2020 19:21:28'!
puntosDeSaludPermitidosPara: unPersonaje 

	^  puntosDeSalud _ (puntosDeSalud - (self puntosDeSalud min: unPersonaje poderOfensivo)).! !


!Personaje methodsFor: 'testing' stamp: 'CB 11/7/2020 19:46:24'!
esHabitanteImpuro
	
	^ (self tieneImplantesCiberneticos) "implantes".
! !

!Personaje methodsFor: 'testing' stamp: 'CB 11/7/2020 19:46:32'!
esHabitantePuro
	
	^ (self noTieneImplantesCiberneticos ).! !

!Personaje methodsFor: 'testing' stamp: 'CB 11/7/2020 19:46:32'!
noTieneImplantesCiberneticos

	^ self cantidadDeImplantes = 0 "implantes"! !

!Personaje methodsFor: 'testing' stamp: 'CB 11/8/2020 23:00:12'!
poderDefensivoSuperaPoderOfensivoDe: unPersonaje 

	^ (self poderDefensivo > unPersonaje poderOfensivo).! !

!Personaje methodsFor: 'testing' stamp: 'CB 11/8/2020 07:41:56'!
tieneImplantesCiberneticos

	^ (self cantidadDeImplantes > 0)! !


!Personaje methodsFor: 'action' stamp: 'CB 11/8/2020 21:18:01'!
atacaA: unPersonaje

	
	unPersonaje puntosDeSaludPermitidosPara: self.! !

!Personaje methodsFor: 'action' stamp: 'CB 11/5/2020 22:38:15'!
instalarImplante: unImplante 

	implantes add: unImplante.
	! !

!Personaje methodsFor: 'action' stamp: 'CB 11/8/2020 09:49:16'!
noRecibeDañoDe: unPersonaje

	^ self poderDefensivo > unPersonaje poderOfensivo .	
	! !

!Personaje methodsFor: 'action' stamp: 'CB 11/8/2020 22:09:49'!
recibeDañoDe: unPersonaje
	
	
	puntosDeSalud _ (puntosDeSalud - ( self puntosDeSalud min: unPersonaje poderOfensivo))
	
	! !


!Personaje methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 21:51:37'!
tieneFamaNegativa

	^ nivelDeFama < 0 " puntos de fama"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Personaje class' category: 'Parcial-CyberCuis2020'!
Personaje class
	instanceVariableNames: ''!

!Personaje class methodsFor: 'instance creation' stamp: 'CB 11/7/2020 15:54:25'!
conApodo: unApodo conEdadDe: unaEdad conPuntosDeSalud: unaCantidadDePuntosDeSalud 
	
	^self new conApodo: unApodo conEdadDe: unaEdad conPuntosDeSalud: unaCantidadDePuntosDeSalud! !


!classDefinition: #Hacker category: 'Parcial-CyberCuis2020'!
Personaje subclass: #Hacker
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!Hacker methodsFor: 'initialization' stamp: 'CB 11/7/2020 15:52:58'!
initialize

	
	nivelDeFama _ 0.
	implantes _ Set new.
	! !


!Hacker methodsFor: 'accessing' stamp: 'CB 11/7/2020 17:12:52'!
poderDefensivo
	
	^ (self cantidadDeImplantes + self promedioDePoderDeComputoTotal)! !

!Hacker methodsFor: 'accessing' stamp: 'CB 11/7/2020 16:43:17'!
poderOfensivo
	
	^ (self puntosDeDañoDeAtaque)! !

!Hacker methodsFor: 'accessing' stamp: 'CB 11/7/2020 17:18:13'!
promedioDePoderDeComputoTotal
	
	^ implantes average: [: cadaImplante | cadaImplante puntosDePoderDeComputo] ifEmpty: [0 "puntos de poder de computo"].! !

!Hacker methodsFor: 'accessing' stamp: 'CB 11/8/2020 03:39:12'!
puntosDeAtaqueCibernetico

	^ self cantidadDeImplantes + self puntosDePoderDeComputoAcumulado! !

!Hacker methodsFor: 'accessing' stamp: 'CB 11/8/2020 03:39:12'!
puntosDeDañoDeAtaque

	^ self puntosDeAtaqueCibernetico.! !

!Hacker methodsFor: 'accessing' stamp: 'CB 11/7/2020 16:44:28'!
puntosDePoderDeComputoAcumulado
	
	^ self sumaDePuntosDePoderDeComputoDeImplantes.! !

!Hacker methodsFor: 'accessing' stamp: 'CB 11/7/2020 16:58:40'!
sumaDePuntosDePoderDeComputoDeImplantes

	^ implantes sum: [: cadaImplante | cadaImplante puntosDePoderDeComputo] ifEmpty: [0 "puntos de daño"]! !


!Hacker methodsFor: 'action' stamp: 'CB 11/8/2020 21:46:55'!
quitarDañoPorDisparoDe: unArma

	puntosDeSalud _ (puntosDeSalud - ( unArma puntosDeDañoPorDisparo ))! !


!classDefinition: #Mercenario category: 'Parcial-CyberCuis2020'!
Personaje subclass: #Mercenario
	instanceVariableNames: 'armaDeAtaque'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!Mercenario methodsFor: 'initialization' stamp: 'CB 11/8/2020 10:03:29'!
initialize
	
	
	nivelDeFama _ 0.
	armaDeAtaque _ Puñetazo new.
	implantes _ Set new.! !


!Mercenario methodsFor: 'accessing' stamp: 'CB 11/7/2020 16:05:34'!
armaDeAtaque
	
	^ armaDeAtaque! !

!Mercenario methodsFor: 'accessing' stamp: 'CB 11/7/2020 17:51:59'!
poderDefensivo
	
	^ self cantidadDeImplantes.
	! !

!Mercenario methodsFor: 'accessing' stamp: 'CB 11/8/2020 07:43:00'!
poderOfensivo
	
	^ armaDeAtaque puntosDeDaño.! !


!Mercenario methodsFor: 'testing' stamp: 'CB 11/5/2020 20:16:51'!
tieneArmaEquipada: unArma 

	^ armaDeAtaque = unArma.
	! !


!Mercenario methodsFor: 'action' stamp: 'CB 11/8/2020 21:46:55'!
disparaA: unPersonaje con: unArmaa

	 
	unPersonaje quitarDañoPorDisparoDe: unArmaa! !

!Mercenario methodsFor: 'action' stamp: 'CB 11/5/2020 20:16:51'!
equiparseCon: unArma 
	
	armaDeAtaque _ unArma.! !

!Mercenario methodsFor: 'action' stamp: 'CB 11/8/2020 00:22:32'!
recargar: unArma con: unaCantidadDePuntosDeMunicion

	unArma seCargaCon: unaCantidadDePuntosDeMunicion.
	! !


!classDefinition: #ProovedorDeEstadosDeCargaDeArma category: 'Parcial-CyberCuis2020'!
Object subclass: #ProovedorDeEstadosDeCargaDeArma
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!ProovedorDeEstadosDeCargaDeArma methodsFor: 'accessing' stamp: 'CB 11/8/2020 01:21:14'!
estadoDeCargaPara: unArma

	^ (self estadosDeCarga detect: [: cadaEstado | cadaEstado canHandle: unArma]) new.
	! !

!ProovedorDeEstadosDeCargaDeArma methodsFor: 'accessing' stamp: 'CB 11/8/2020 01:27:20'!
estadosDeCarga
	
	^ {EstadoDeCargaVacio . EstadoDeCargaConMunicion} .! !


!classDefinition: #EstadoDeCargaConMunicion category: 'Parcial-CyberCuis2020'!
ProovedorDeEstadosDeCargaDeArma subclass: #EstadoDeCargaConMunicion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!EstadoDeCargaConMunicion methodsFor: 'action' stamp: 'CB 11/8/2020 02:35:06'!
perderMunicionPara: unArma

	 unArma realizarDisparoCuandoCargadorNoEstaVacio.
	
	^ unArma puntosDeDaño.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeCargaConMunicion class' category: 'Parcial-CyberCuis2020'!
EstadoDeCargaConMunicion class
	instanceVariableNames: ''!

!EstadoDeCargaConMunicion class methodsFor: 'as yet unclassified' stamp: 'CB 11/8/2020 01:40:30'!
canHandle: unArma

	^ unArma cargadorNoEstaVacio.! !


!classDefinition: #EstadoDeCargaVacio category: 'Parcial-CyberCuis2020'!
ProovedorDeEstadosDeCargaDeArma subclass: #EstadoDeCargaVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!EstadoDeCargaVacio methodsFor: 'action' stamp: 'CB 11/8/2020 09:24:20'!
perderMunicionPara: unArma

	unArma realizarDisparoCuandoCargadorVacio.
	
	^ 0 "puntos de daño" .  
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeCargaVacio class' category: 'Parcial-CyberCuis2020'!
EstadoDeCargaVacio class
	instanceVariableNames: ''!

!EstadoDeCargaVacio class methodsFor: 'testing' stamp: 'CB 11/8/2020 01:37:48'!
canHandle: unArma

	^ unArma cargadorEstaVacio .
	! !


!classDefinition: #Puñetazo category: 'Parcial-CyberCuis2020'!
Object subclass: #Puñetazo
	instanceVariableNames: 'puntosDeDaño mercenario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Parcial-CyberCuis2020'!

!Puñetazo methodsFor: 'initialization' stamp: 'CB 11/8/2020 10:07:33'!
conPuntosDeDaño: unaCantidadDePuntosDeDaño
	
	puntosDeDaño _ unaCantidadDePuntosDeDaño .! !

!Puñetazo methodsFor: 'initialization' stamp: 'CB 11/8/2020 10:05:51'!
initialize

	puntosDeDaño _ 0. ! !


!Puñetazo methodsFor: 'accessing' stamp: 'CB 11/8/2020 09:56:43'!
puntosDeDaño
	
	^puntosDeDaño! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Puñetazo class' category: 'Parcial-CyberCuis2020'!
Puñetazo class
	instanceVariableNames: 'puntosDeDaño'!

!Puñetazo class methodsFor: 'instance creation' stamp: 'CB 11/8/2020 09:44:45'!
conPuntos: unaCantidadDePuntosDeSalud
	
	^self new conPuntos:  unaCantidadDePuntosDeSalud .! !

!Puñetazo class methodsFor: 'instance creation' stamp: 'CB 11/8/2020 10:07:08'!
conPuntosDeDaño: unaCantidadDePuntosDeDaño 
	
	^self new conPuntosDeDaño: unaCantidadDePuntosDeDaño ! !
