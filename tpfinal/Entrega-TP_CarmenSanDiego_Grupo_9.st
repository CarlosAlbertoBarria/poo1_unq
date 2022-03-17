!classDefinition: #TestDetectiveClasico category: 'TP_CarmenSanDiego_Grupo_9'!
TestCase subclass: #TestDetectiveClasico
	instanceVariableNames: 'mexico argentina uruguay brasil detectiveClasico paraguay pedro pablo sebastian david pistaConDatoDeFormaDePelo pistaConDatoDeColorDeOjos unTestigoSinPistas colorDeOjos formaDePelo nahuel gaston maximo colorDeTez colorDePelo ubicacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:33:26'!
setUp

	| paisesLimitrofes sospechosos testigos paises pistas|
	paisesLimitrofes _ Set new.
	testigos _ Set new.
	sospechosos _ Set new.
	paises _ Set new.
	pistas _ Set new.
	
	"paises inicializados"
	mexico _ Pais conNombre: 'Mexico' conEsperaDeMigracion: 4 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	argentina _ Pais conNombre: 'Argentina' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	uruguay _ Pais conNombre: 'Uruguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	paraguay _ Pais conNombre: 'Paraguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'no es ruta de escape'.
	brasil _ Pais conNombre: 'Brasil' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	
	paisesLimitrofes addAll: {  brasil . uruguay . paraguay }.
	argentina conPaisesLimitrofes: paisesLimitrofes.
	
	paises addAll: {mexico . argentina . uruguay . paraguay . brasil }.
	
	"sospechosos inicializados"
	
	pedro _ Sospechoso conNombre: 'Pedro' conOjosColor: 'ojos celestes' conFormaDeCabello: 'cabello ondulado' conColorDeCabello: 'cabello castaño' conColorDeTez: 'tez marron'.
	pablo _ Sospechoso conNombre: 'Pablo' conOjosColor: 'ojos azules' conFormaDeCabello: 'cabello largo' conColorDeCabello: 'cabello rubio' conColorDeTez: 'tez blanca'.
	sebastian _ Sospechoso conNombre: 'Sebastian' conOjosColor: 'ojos marrones' conFormaDeCabello: 'cabello lacio' conColorDeCabello: 'cabello negro' conColorDeTez: 'tez negra'.
	david _ Sospechoso conNombre: 'David' conOjosColor: 'ojos marrones' conFormaDeCabello: 'cabello corto' conColorDeCabello: 'cabello negro' conColorDeTez: 'tez blanca'.
	sospechosos addAll: {pedro . pablo . sebastian . david}.
	
	"detective clasico inicializado"
	detectiveClasico _ DetectiveClasico conHorasDeBusqueda: 50 * hour conUbicacion: argentina conListaDeSospechosos: sospechosos conPaisesParaViajar: paises.
	
	
	"pistas inicializado"
	
	colorDeOjos _ Pista conDescripcion: 'ojos marrones' .
	formaDePelo _ Pista conDescripcion: 'pelo marron' .
	ubicacion _ Pista conDescripcion: 'Brasil' .
	colorDeTez _ Pista conDescripcion: 'pelo marron' .
	colorDePelo _ Pista conDescripcion: 'Brasil' .
	
	unTestigoSinPistas _ Testigo con: {} conUbicacion: argentina .
	
	
	
	"una lista de testigos inicializada"
	
	
	
	nahuel _ Testigo con: { colorDePelo . ubicacion . colorDeOjos } conUbicacion: argentina .
	gaston _ Testigo con: {formaDePelo . colorDePelo . ubicacion } conUbicacion: argentina .
	maximo _ Testigo con: { ubicacion . colorDeOjos . colorDeTez } conUbicacion: argentina .
	testigos addAll: {nahuel . gaston . maximo}.
	! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 23:50:52'!
test001_unDetectiveClasicoEstaUbicadoEnUnPais

		
	
	Assert that: detectiveClasico ubicacion isEqualTo: argentina .! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:06:12'!
test002_unDetectiveClasicoTieneUnTiempoParaEncontrarAlDelincuente

	
	Assert that: detectiveClasico tiempoLimiteDeBusqueda isEqualTo: 50 * hour.! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/2/2020 17:27:55'!
test003_cuandoUnDetectiveClasicoViajaAUnPaisSuUbicacionCambia

	
	detectiveClasico viajaA: mexico.
	
	
	Assert that: detectiveClasico ubicacion isEqualTo: mexico.! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:06:35'!
test004_cuandoUnDetectiveClasicoViajaAUnPaisLimitrofe

		
	detectiveClasico viajaA: brasil. 
	
	
	Assert that: detectiveClasico tiempoLimiteDeBusqueda isEqualTo: 43 * hour.! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/2/2020 17:36:36'!
test005_unDetectiveClasicoViajaAUnPaisYSuTiempoLimiteDeBusquedaDisminuye

	detectiveClasico viajaA: mexico. 
	
	Assert that: detectiveClasico tiempoLimiteDeBusqueda isEqualTo: 38 * hour.! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:07:27'!
test006_cuandoUnDetectiveClasicoNoTieneTiempoSuficienteParaViajarAOtroPaisYViaja_pierdeLaPartida
 	
	|unDetective|
	
	unDetective _ DetectiveClasico conHorasDeBusqueda: 9*hour conUbicacion: argentina conListaDeSospechosos: {} conPaisesParaViajar: {}. 
	
	
	unDetective viajaA: mexico.
	
	
	Assert isTrue: unDetective noTieneTiempoDisponible .! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:07:43'!
test007_cuandoUnDetectiveClasicoViajaAUnPaisLoRegistraEnSusPaisesVisitados

	detectiveClasico viajaA: mexico.
	
	Assert isTrue: (detectiveClasico haVisitado: mexico).! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 22:59:29'!
test008_cuandoUnDetectiveClasicoInterrogaAUnTestigoSuTiempoDeBusquedaDisminuye

	
	
	detectiveClasico interrogaA: nahuel . 
	
	Assert that: detectiveClasico tiempoLimiteDeBusqueda isEqualTo: 48 * hour .! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:08:30'!
test009_cuandoUnDetectiveClasicoConsultaCuantosSospechososTiene
	
	
		
	Assert that: detectiveClasico cantidadDeSospechosos isEqualTo: 4.! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:09:02'!
test010_cuandoUnDetectiveClasicoInterrogaAUnTestigoObtieneUnaPista


    detectiveClasico interrogaA: nahuel.

    Assert that: (detectiveClasico cantidadDePistas) isEqualTo: 1 .! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:09:30'!
test011_cuandoUnDetectiveClasivoQuiereInterrogarAUnTestigoSinPistasNoPuedeRealizarInterrogatorio
	
	
	
	Assert should: [detectiveClasico interrogaA: unTestigoSinPistas ]
		 signal:  Error
		withDescription: detectiveClasico noPuedeRealizarInterrogatorioAUnTestigoSinPistas.
		
		Assert isTrue: (unTestigoSinPistas noTienePistas). ! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:09:48'!
test012_cuandoUnDetectiveClasicoNoTieneTiempoSuficienteParaInterrogarAUnTestigoYLoInterroga_pierdeLaPartida
	
	|unDetectiveClasico|
	
	unDetectiveClasico _ DetectiveClasico conHorasDeBusqueda: 1 * hour conUbicacion: argentina conListaDeSospechosos: {} conPaisesParaViajar: {}.
	
	unDetectiveClasico interrogaA: nahuel.		
		
	Assert isTrue: (unDetectiveClasico noTieneTiempoDisponible ). ! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 20:39:31'!
test013_cuandoUnDetectiveConsultaSiPuedeViajarAUnPais
	
	
		
	Assert isTrue: (detectiveClasico paisesParaViajar includes: mexico) .! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 23:03:42'!
test014_cuandoUnDetectiveRecibeDosVecesLaMismaPista_soloUnaSeGuardaEnSuListaDePistas
	
	|testigoUno testigoDos|
	
	testigoUno _ Testigo con: {colorDeOjos } conUbicacion: argentina.
	testigoDos _ Testigo con: {colorDeOjos } conUbicacion: argentina.
	
	detectiveClasico interrogaA: testigoUno .
	detectiveClasico interrogaA: testigoDos .
	
		
	Assert that: detectiveClasico cantidadDePistas isEqualTo: 1.! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'DDC 12/7/2020 00:51:10'!
test015_cuandoUnDetectiveConsultaQuienesSonLosSospechosos
	
	
		
	Assert isTrue: (detectiveClasico sospechosos includes: pablo).
	Assert isTrue: (detectiveClasico sospechosos includes: pedro).
	Assert isTrue: (detectiveClasico sospechosos includes: sebastian ).
	Assert isTrue: (detectiveClasico sospechosos includes: david ).
	! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 21:25:17'!
test016_cuandoUnDetectiveQuiereInterrogarAUnTestigoQueNoEstaEnSuMismoPais_noPuedeRealizarInterrogatorio
	
	|testigoCarlos|
	testigoCarlos _ Testigo con: {colorDeOjos } conUbicacion: mexico .
	
	Assert should: [detectiveClasico interrogaA: testigoCarlos]
		 signal:  Error
		withDescription: detectiveClasico noPuedeRealizarInterrogatorioAUnTestigoQueEstaEnOtroPais.
		
		Assert isTrue: (detectiveClasico noTienePistas ). ! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 21:25:24'!
test017_cuandoUnDetectiveInterrogaTestigoEnUnPaisDondeNoEstuvoElDelincuente
	
	|testigoCarlos|
	testigoCarlos _ Testigo con: {colorDeOjos } conUbicacion: mexico .
	
	Assert should: [detectiveClasico interrogaA: testigoCarlos]
		 signal:  Error
		withDescription: detectiveClasico noPuedeRealizarInterrogatorioAUnTestigoQueEstaEnOtroPais.
		
		Assert isTrue: (detectiveClasico noTienePistas ). ! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 22:57:14'!
test019_cuandoUnDetectiveClasicoIntentaViajarAlPaisDondeSeEncuentra_noRealizaElViaje
 	
	 
	
	Assert 
	should: [detectiveClasico viajaA: argentina]
	signal: Error
	withDescription: detectiveClasico noSePuedeViajarAlPaisDondeSeEstaUbicado.
	
	Assert that: detectiveClasico tiempoLimiteDeBusqueda isEqualTo: 50 * hour.! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 19:09:48'!
test020_unDetectivePuedeEmitirUnaOrdenDeArresto
 		
		
	
	 detectiveClasico sospechososFiltradosPor: {'ojos marrones' . 'cabello corto' . 'cabello negro' . 'tez blanca'}.
	
	detectiveClasico emitirOrdenDeArrestoPara: detectiveClasico sospechosos .
	
		Assert that: (detectiveClasico cantidadDeSospechosos) isEqualTo: 1. 
	
	
	
	
	
	
	! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 18:13:04'!
test021_unDetectiveIntentaEmitirUnaOrdenDeArresto_peroHayMasDeUnSospechosoConEsasCaracteristicas_noSeEmiteLaOrden
 		
		
	
	detectiveClasico sospechososFiltradosPor: {'ojos marrones'}.
	
	Assert should: [detectiveClasico emitirOrdenDeArrestoPara: detectiveClasico sospechosos]
		 signal:  Error
		withDescription: detectiveClasico noPuedeImprimirseOrdenDeArrestoPorqueHayMasDeUnSospechosoConLasCaracteristicasObtenidas.
		
		Assert that: detectiveClasico cantidadDeSospechosos isEqualTo: 2. "la orden no fue emitida"
	
	
	
	
	
	
	! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:10:56'!
test023_cuandoUnDetectiveClasivoNoTieneTiempoDisponible
 		
	| unDetective |
	unDetective _ DetectiveClasico conHorasDeBusqueda: 0*hour conUbicacion: argentina conListaDeSospechosos: {pedro . pablo . sebastian . david} conPaisesParaViajar: 	{brasil . uruguay . paraguay}.
	
	Assert isTrue: unDetective noTieneTiempoDisponible.
		
	
	
	! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 19:08:56'!
test024_unDetectiveIntentaEmitirUnaOrdenDeArresto_peroNoTieneElTiempoNecesario_noSeEmiteLaOrdenYPierdeLaPartida
 		
		|unDetective|
		
	unDetective _ DetectiveClasico conHorasDeBusqueda: (0*hour) conUbicacion: argentina conListaDeSospechosos: {pedro . pablo . sebastian . david} conPaisesParaViajar: 	{brasil . uruguay . paraguay}.
	
	
	
	unDetective sospechososFiltradosPor: {'ojos marrones' . 'cabello negro' . 'cabello corto' . 'tez blanca'}.
	
	Assert should: [unDetective emitirOrdenDeArrestoPara: unDetective sospechosos ]
		 signal:  Error
		withDescription: unDetective noHayMasTiempoSuficienteSePierdeLaPartida.
		
		Assert that: unDetective tiempoLimiteDeBusqueda isEqualTo: (0*hour). "la orden no fue emitida"
	
	
	
	
	
	
	! !

!TestDetectiveClasico methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:12:47'!
test025_cuandoUnDetectiveViajaAUnPaisQueLeConsumeExactamenteLaCantidadDeHorasDisponibles_ViajaIgualYPierdeLaPartida
 	
	|unDetective|
	
	unDetective _ DetectiveClasico conHorasDeBusqueda: 12*hour conUbicacion: argentina conListaDeSospechosos: {pedro . pablo . sebastian . david} conPaisesParaViajar: 	{brasil . uruguay . paraguay}. 
	
	
	unDetective viajaA: mexico.
	
	
	Assert isTrue: unDetective  noTieneTiempoDisponible .! !


!classDefinition: #TestDetectiveInterpol category: 'TP_CarmenSanDiego_Grupo_9'!
TestCase subclass: #TestDetectiveInterpol
	instanceVariableNames: 'mexico argentina uruguay paraguay brasil pedro pablo sebastian david colorDeOjos formaDePelo ubicacion colorDeTez colorDePelo unTestigo nahuel gaston maximo detectiveInterpol'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TestDetectiveInterpol methodsFor: 'as yet unclassified' stamp: 'DDC 12/10/2020 15:26:52'!
setUp

	| listaDePaisesLimitrofes listaDeSospechosos unaListaDeTestigos unaListaDePaises |
	listaDePaisesLimitrofes _ Set new.
	unaListaDeTestigos _ Set new.
	listaDeSospechosos _ Set new.
	unaListaDePaises _ Set new.
	
	"paises inicializados"
	mexico _ Pais conNombre: 'Mexico' conEsperaDeMigracion: 4 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	argentina _ Pais conNombre: 'Argentina' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {unaListaDeTestigos} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	uruguay _ Pais conNombre: 'Uruguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	paraguay _ Pais conNombre: 'Paraguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'no es ruta de escape'.
	brasil _ Pais conNombre: 'Brasil' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	
	listaDePaisesLimitrofes addAll: {  brasil . uruguay . paraguay }.
	argentina conPaisesLimitrofes: listaDePaisesLimitrofes.
	
	unaListaDePaises addAll: {mexico . argentina . uruguay . paraguay . brasil }.
	
	"sospechosos inicializados"
	
	pedro _ Sospechoso conNombre: 'Pedro' conOjosColor: 'ojos marrones' conFormaDeCabello: 'ondulado' conColorDeCabello: 'cabello castaño' conColorDeTez: 'tez negra' .
	pablo _ Sospechoso conNombre: 'Pablo' conOjosColor: 'ojos azules' conFormaDeCabello: 'largo' conColorDeCabello: 'Amarillo' conColorDeTez: 'Blanco' .
	sebastian _ Sospechoso conNombre: 'Sebastian' conOjosColor: 'Verde' conFormaDeCabello: 'Lacio' conColorDeCabello: 'Negro' conColorDeTez: 'Oscura'.
	david _ Sospechoso conNombre: 'David' conOjosColor: 'Marron' conFormaDeCabello: 'Pelado' conColorDeCabello: 'cabello negro' conColorDeTez: 'Blanco'.
	listaDeSospechosos addAll: {pedro . pablo . sebastian . david}.
	
	"detective clasico inicializado"
	detectiveInterpol _ DetectiveInterpol conHorasDeBusqueda: 50 * hour conUbicacion: argentina conListaDeSospechosos: listaDeSospechosos conPaisesParaViajar: unaListaDePaises.
	
	
	"un testigo inicializado"
	
	colorDeOjos _ Pista conDescripcion: 'Ojos Marrones' .
	formaDePelo _ Pista conDescripcion: 'Pelo Marron' .
	ubicacion _ Pista conDescripcion: 'Brasil' .
	colorDeTez _ Pista conDescripcion: 'Pelo Marron' .
	colorDePelo _ Pista conDescripcion: 'Brasil' .
	
	unTestigo _ Testigo con: { } conUbicacion: argentina .
	
	
	
	"una lista de testigos inicializada"
	
	
	
	nahuel _ Testigo con: { colorDePelo . ubicacion . colorDeOjos } conUbicacion: argentina .
	gaston _ Testigo con: {formaDePelo . colorDePelo . ubicacion } conUbicacion: argentina .
	maximo _ Testigo con: { ubicacion . colorDeOjos . colorDeTez } conUbicacion: argentina .
	unaListaDeTestigos addAll: {nahuel . gaston . maximo}.
	! !

!TestDetectiveInterpol methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:04:34'!
test001_cuandoUnDetectiveInterpolViajaAUnPaisNoLimitrofe

	detectiveInterpol viajaA: mexico.
	
	Assert that: detectiveInterpol tiempoLimiteDeBusqueda isEqualTo: 40*hour. ! !

!TestDetectiveInterpol methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:05:15'!
test002_cuandoUnDetectiveInterpolViajaAUnPaisLimitrofe

	detectiveInterpol viajaA: uruguay.
	
	Assert that: detectiveInterpol tiempoLimiteDeBusqueda isEqualTo: 44*hour. ! !


!classDefinition: #TestDetectivePersuasivo category: 'TP_CarmenSanDiego_Grupo_9'!
TestCase subclass: #TestDetectivePersuasivo
	instanceVariableNames: 'mexico argentina uruguay paraguay brasil pedro pablo sebastian david colorDeOjos formaDePelo ubicacion colorDeTez colorDePelo unTestigo nahuel gaston maximo unDetectivePersuasivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TestDetectivePersuasivo methodsFor: 'as yet unclassified' stamp: 'DDC 12/10/2020 15:27:27'!
setUp

	| listaDePaisesLimitrofes listaDeSospechosos unaListaDeTestigos unaListaDePaises |
	
	listaDePaisesLimitrofes _ Set new.
	unaListaDeTestigos _ Set new.
	listaDeSospechosos _ Set new.
	unaListaDePaises _ Set new.
	
	"paises inicializados"
	mexico _ Pais conNombre: 'Mexico' conEsperaDeMigracion: 4 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	argentina _ Pais conNombre: 'Argentina' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {unaListaDeTestigos} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	uruguay _ Pais conNombre: 'Uruguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	paraguay _ Pais conNombre: 'Paraguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'no es ruta de escape'.
	brasil _ Pais conNombre: 'Brasil' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	
	listaDePaisesLimitrofes addAll: {  brasil . uruguay . paraguay }.
	argentina conPaisesLimitrofes: listaDePaisesLimitrofes.
	
	unaListaDePaises addAll: {mexico . argentina . uruguay . paraguay . brasil }.
	
	"sospechosos inicializados"
	
	pedro _ Sospechoso conNombre: 'Pedro' conOjosColor: 'ojos marrones' conFormaDeCabello: 'ondulado' conColorDeCabello: 'cabello castaño' conColorDeTez: 'tez negra'.
	pablo _ Sospechoso conNombre: 'Pablo' conOjosColor: 'ojos azules' conFormaDeCabello: 'largo' conColorDeCabello: 'Amarillo' conColorDeTez: 'Blanco' .
	sebastian _ Sospechoso conNombre: 'Sebastian' conOjosColor: 'Verde' conFormaDeCabello: 'Lacio' conColorDeCabello: 'Negro' conColorDeTez: 'Oscura'.
	david _ Sospechoso conNombre: 'David' conOjosColor: 'Marron' conFormaDeCabello: 'Pelado' conColorDeCabello: 'cabello negro' conColorDeTez: 'Blanco'.
	listaDeSospechosos addAll: {pedro . pablo . sebastian . david}.
	
	"detective clasico inicializado"
	detectiveClasico _ DetectiveClasico conHorasDeBusqueda: 50 * hour conUbicacion: argentina conListaDeSospechosos: listaDeSospechosos conPaisesParaViajar: unaListaDePaises.
	
	"detective persuasivo inicializado"
	unDetectivePersuasivo _ DetectivePersuasivo conHorasDeBusqueda: 50 * hour conUbicacion: argentina conListaDeSospechosos: listaDeSospechosos conPaisesParaViajar: unaListaDePaises.
	
	
	"un testigo inicializado"
	
	colorDeOjos _ Pista conDescripcion: 'Ojos Marrones' .
	formaDePelo _ Pista conDescripcion: 'Pelo Marron' .
	ubicacion _ Pista conDescripcion: 'Brasil' .
	colorDeTez _ Pista conDescripcion: 'Pelo Marron' .
	colorDePelo _ Pista conDescripcion: 'Brasil' .
	
	unTestigo _ Testigo con: { } conUbicacion: argentina .
	
	
	
	"una lista de testigos inicializada"
	
	
	
	nahuel _ Testigo con: { colorDePelo . ubicacion . colorDeOjos } conUbicacion: argentina .
	gaston _ Testigo con: {formaDePelo . colorDePelo . ubicacion } conUbicacion: argentina .
	maximo _ Testigo con: { ubicacion . colorDeOjos . colorDeTez } conUbicacion: argentina .
	unaListaDeTestigos addAll: {nahuel . gaston . maximo}.
	
	
	! !

!TestDetectivePersuasivo methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 23:44:33'!
test001_cuandoUnDetectivePersuasivoInterroga_Obtiene2Pistas


	unDetectivePersuasivo interrogaA: gaston .
	
	Assert that: unDetectivePersuasivo cantidadDePistas isEqualTo: 2.! !

!TestDetectivePersuasivo methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 23:47:22'!
test002_cuandoUnDetectivePersuasivoInterroga_pierdeUnaHoraDelTiempoDeBusqueda


	unDetectivePersuasivo interrogaA: gaston .
	
	Assert that: unDetectivePersuasivo tiempoLimiteDeBusqueda isEqualTo: 49*hour.! !


!classDefinition: #TestModeloDePartida category: 'TP_CarmenSanDiego_Grupo_9'!
TestCase subclass: #TestModeloDePartida
	instanceVariableNames: 'mexico argentina uruguay paraguay brasil pedro pablo sebastian david detectiveClasico colorDeOjos formaDePelo ubicacionDesdeArgentina colorDeTez colorDePelo nahuel gaston maximo unaPartida ronaldo ronaldinho kaka ubicacionDesdeBrasil cardozo panchoVilla romero pacui chicarito chavo pepe suarez cavani'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 23:27:14'!
setUp

	"comentarios sobre la partida en el ultimo test ( numero 14)"

	|paisesLimitrofesArgentina sospechosos testigosArgentinos paises paisesLimitrofesBrasil testigosBrasileros testigosParaguayos paisesLimitrofesParaguay testigosMexicanos testigosUruguayos |
	
	paisesLimitrofesArgentina _ Set new.
	paisesLimitrofesBrasil _ Set new.
	paisesLimitrofesParaguay _ Set new.
	testigosArgentinos _ OrderedCollection new.
	testigosBrasileros _ OrderedCollection new.
	testigosParaguayos _ OrderedCollection new.
	testigosMexicanos _ OrderedCollection new.
	testigosUruguayos _ OrderedCollection new.
	sospechosos _ Set new.
	paises _ Set new.
	
		
	"paises inicializados"
	mexico _ Pais conNombre: 'Mexico' conEsperaDeMigracion: 4 * hour conObjetoDeValor: 'Vasija'  conListaDeTestigos: testigosMexicanos  esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	argentina _ Pais conNombre: 'Argentina' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigosArgentinos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	uruguay _ Pais conNombre: 'Uruguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Copa'  conListaDeTestigos: testigosUruguayos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	paraguay _ Pais conNombre: 'Paraguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Pergamino'  conListaDeTestigos: testigosParaguayos  esRutaDeEscapeDelDelincuente: 'no es ruta de escape'.
	brasil _ Pais conNombre: 'Brasil' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Lampara'  conListaDeTestigos: testigosBrasileros esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	
	paisesLimitrofesArgentina addAll: {  brasil . uruguay . paraguay }.
	argentina conPaisesLimitrofes: paisesLimitrofesArgentina.
	
	paisesLimitrofesBrasil addAll: {  uruguay . argentina }.
	brasil conPaisesLimitrofes: paisesLimitrofesBrasil.
	
	paisesLimitrofesParaguay addAll: {  brasil . argentina }.
	paraguay conPaisesLimitrofes: paisesLimitrofesParaguay .
	
	paises addAll: {mexico . argentina . uruguay . paraguay . brasil }.
	
	"sospechosos inicializados"
	
	pedro _ Sospechoso conNombre: 'Pedro' conOjosColor: 'ojos celestes' conFormaDeCabello: 'cabello ondulado' conColorDeCabello: 'cabello castaño' conColorDeTez: 'tez negra'.
	pablo _ Sospechoso conNombre: 'Pablo' conOjosColor: 'ojos azules' conFormaDeCabello: 'cabello largo' conColorDeCabello: 'cabello rubio' conColorDeTez: 'tez blanca'.
	sebastian _ Sospechoso conNombre: 'Sebastian' conOjosColor: 'ojos verdes' conFormaDeCabello: 'cabello lacio' conColorDeCabello: 'cabello negro' conColorDeTez: 'tez negra'.
	david _ Sospechoso conNombre: 'David' conOjosColor: 'ojos marrones' conFormaDeCabello: 'cabello corto' conColorDeCabello: 'cabello negro' conColorDeTez: 'tez blanca'.
	sospechosos addAll: {pedro . pablo . sebastian . david}.
	
	"detective clasico inicializado"
	detectiveClasico _ DetectiveClasico conHorasDeBusqueda:  70 * hour conUbicacion: argentina conListaDeSospechosos: sospechosos conPaisesParaViajar: paises.
	
	"una partida inicializada"
	unaPartida _ Partida conDetective: detectiveClasico.
	
	"pistas inicializadas"
	
	colorDeOjos _ Pista conDescripcion: 'ojos marrones' .
	formaDePelo _ Pista conDescripcion: 'cabello corto' .
	ubicacionDesdeArgentina _ Pista conDescripcion: 'Brasil' .
	colorDeTez _ Pista conDescripcion: 'tez blanca' .
	colorDePelo _ Pista conDescripcion: 'cabello negro' .
	
	
	"testigos argentinos inicializados"
	nahuel _ Testigo con: { colorDePelo . ubicacionDesdeArgentina . colorDeOjos } conUbicacion: argentina .
	gaston _ Testigo con: {formaDePelo . colorDePelo . ubicacionDesdeArgentina } conUbicacion: argentina .
	maximo _ Testigo con: { ubicacionDesdeArgentina . colorDeOjos . colorDeTez } conUbicacion: argentina .
	testigosArgentinos addAll: {nahuel . gaston . maximo}.
	
	
	ubicacionDesdeBrasil _ Pista conDescripcion: 'Mexico' .
	
	"testigos brasileros inicializados"
	ronaldo _ Testigo con: { colorDePelo . ubicacionDesdeBrasil . colorDeOjos } conUbicacion: brasil .
	ronaldinho _ Testigo con: {formaDePelo . colorDePelo . ubicacionDesdeBrasil } conUbicacion: brasil .
	kaka _ Testigo con: { ubicacionDesdeBrasil . colorDeOjos . colorDeTez } conUbicacion: brasil .
	testigosBrasileros addAll: {ronaldo . ronaldinho . kaka}.

	"testigos paraguayos inicializados"
	cardozo _ Testigo con: { 'aqui no hemos visto a nadie' } conUbicacion: paraguay .
	romero _ Testigo con: { 'aqui no hemos visto a nadie' } conUbicacion: paraguay .
	pacui _ Testigo con: { 'aqui no hemos visto a nadie' } conUbicacion: paraguay .
	testigosParaguayos addAll: {cardozo. romero . pacui}.	
	
	"testigos mexicanos inicializados"
	panchoVilla _ Testigo con: { colorDeOjos . colorDePelo . formaDePelo } conUbicacion: mexico .
	chicarito _ Testigo con: { colorDeOjos . colorDePelo . colorDeTez } conUbicacion: mexico .
	chavo _ Testigo con: { formaDePelo . colorDeTez . formaDePelo } conUbicacion: mexico .
	testigosMexicanos addAll: {panchoVilla . chicarito . chavo }.	
	
	"testigos uruguayos inicializados"
	pepe _ Testigo con: { colorDeOjos . colorDePelo . formaDePelo } conUbicacion: mexico .
	suarez _ Testigo con: { colorDeOjos . colorDePelo . formaDePelo } conUbicacion: mexico .
	cavani _ Testigo con: { colorDeOjos . colorDePelo . formaDePelo } conUbicacion: mexico .
	testigosUruguayos addAll: {pepe . suarez . cavani }.	
	
	
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:13:20'!
test001_partidaConUnDetective


	
	
	Assert that: (unaPartida detective) isEqualTo: detectiveClasico .! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'DDC 12/7/2020 23:34:00'!
test002_elDetectiveSeEncuentraEnElLugarDelRobo


	
	
	Assert that: detectiveClasico ubicacion isEqualTo: argentina .! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'DDC 12/8/2020 01:26:53'!
test003_elDetectiveTiene70HorasParaEncontrarAlDelincuente


	
	Assert that: detectiveClasico tiempoLimiteDeBusqueda isEqualTo: 70*hour .! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'DDC 12/10/2020 17:38:09'!
test004_elDetectiveConsultaLaListaDeSospechososDisponible

	
	
	Assert isTrue: (detectiveClasico tieneComoSospechosoA: pablo).
	Assert isTrue: (detectiveClasico tieneComoSospechosoA: pedro).
	Assert isTrue: (detectiveClasico tieneComoSospechosoA: sebastian ).
	Assert isTrue: (detectiveClasico tieneComoSospechosoA: david ).! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 19:36:16'!
test005_elDetectiveConsultaLaListaDePistas_queHastaElMomentoEstaVacia

	
	
	Assert isTrue: (detectiveClasico pistas isEmpty).
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 19:36:59'!
test006_elDetectiveInterrogaALosTestigosDelPais_yObtiene5Pistas

	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
	
	Assert that: detectiveClasico pistas size isEqualTo: 5.
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 19:37:07'!
test007_elDetectiveConsultaSuListaDePistas_buscandoUnaReferenciaGeografica

	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
		
	Assert isTrue: (detectiveClasico pistas includes: ubicacionDesdeArgentina) .
	Assert that: ubicacionDesdeArgentina descripcion isEqualTo: 'Brasil'.
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'DDC 12/8/2020 00:26:31'!
test008_elDetectiveViajaAlPaisQueSeLeDioComoPista

	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
	detectiveClasico viajaA: brasil .
		
	Assert that: detectiveClasico ubicacion isEqualTo: brasil.
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 20:39:47'!
test009_elDetectiveInterrogaALosTestigosDelPais_yObtieneUnaPistaGeografica

	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
	detectiveClasico viajaA: brasil .
	
	detectiveClasico interrogaA: ronaldo.
	detectiveClasico interrogaA: ronaldinho .
	detectiveClasico interrogaA: kaka .
		
	Assert that: detectiveClasico cantidadDePistas isEqualTo: 6.
	Assert isTrue: (detectiveClasico pistas includes: ubicacionDesdeBrasil) .
	Assert that: ubicacionDesdeBrasil descripcion isEqualTo: 'Mexico'.
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 21:23:00'!
test010_elDetectiveViajaAUnPaisEquivocado_yNoObtienePistasNuevas

	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
	detectiveClasico viajaA: brasil .
	
	detectiveClasico interrogaA: ronaldo.
	detectiveClasico interrogaA: ronaldinho .
	detectiveClasico interrogaA: kaka .
	
	detectiveClasico viajaA: paraguay .
	
	detectiveClasico interrogaA: cardozo.
		
	Assert that: detectiveClasico cantidadDePistas isEqualTo: 6.
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'DDC 12/8/2020 01:03:51'!
test011_elDetectiveViajaAlPaisDeLaReferenciaGeografica_eInterrogaAUnTestigo

	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
	detectiveClasico viajaA: brasil .
	
	detectiveClasico interrogaA: ronaldo.
	detectiveClasico interrogaA: ronaldinho .
	detectiveClasico interrogaA: kaka .
	
	detectiveClasico viajaA: paraguay .
	detectiveClasico interrogaA: cardozo.
		
	detectiveClasico viajaA: mexico .
	detectiveClasico interrogaA: panchoVilla .
		
	Assert that: detectiveClasico cantidadDePistas isEqualTo: 6.
	
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 20:39:24'!
test012_elDetectiveConsultaLasPistasObtenidas

	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
	detectiveClasico viajaA: brasil .
	
	detectiveClasico interrogaA: ronaldo.
	detectiveClasico interrogaA: ronaldinho .
	detectiveClasico interrogaA: kaka .
	
	detectiveClasico viajaA: paraguay .
	detectiveClasico interrogaA: cardozo.
		
	detectiveClasico viajaA: mexico .
	detectiveClasico interrogaA: panchoVilla .
	
			
	Assert isTrue: (detectiveClasico tieneLaPista: colorDeOjos ).
	Assert that: colorDeOjos descripcion isEqualTo: 'ojos marrones'.
	
	Assert isTrue: (detectiveClasico tieneLaPista: colorDeTez ).
	Assert that: colorDeTez descripcion isEqualTo: 'tez blanca'.
	
	Assert isTrue: (detectiveClasico tieneLaPista: colorDePelo ).
	Assert that: colorDePelo descripcion isEqualTo: 'cabello negro'.
	
	Assert isTrue: (detectiveClasico tieneLaPista: formaDePelo ).
	Assert that: formaDePelo descripcion isEqualTo: 'cabello corto'.
	
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'DDC 12/10/2020 17:58:48'!
test013_elDetectiveFiltraEnBaseALasPistasObtenidas

	
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	
	detectiveClasico viajaA: brasil .
	
	detectiveClasico interrogaA: ronaldo.
	detectiveClasico interrogaA: ronaldinho .
	detectiveClasico interrogaA: kaka .
	
	detectiveClasico viajaA: paraguay .
	detectiveClasico interrogaA: cardozo.
		
	detectiveClasico viajaA: mexico .
	detectiveClasico interrogaA: panchoVilla .
	
	
	detectiveClasico sospechososFiltradosPor: {'cabello corto' . 'cabello negro' . 'tez blanca' . 'ojos marrones'} .
	
	Assert that: detectiveClasico cantidadDeSospechosos isEqualTo: 1.
	
	
	! !

!TestModeloDePartida methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 19:00:30'!
test014_elDetectiveEmiteUnaOrdenDeArrestoParaElDelincuente


	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	"obtiene 3 pistas, no guarda repetidas"
	
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	detectiveClasico interrogaA: nahuel.
	"obtiene 3 pistas, no guarda repetidas"
	
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	detectiveClasico interrogaA: gaston.
	"obtiene 3 pistas, no guarda repetidas"
	
	detectiveClasico viajaA: brasil .
	"consume tiempo de pais limitrofe, cambia ubicacion"
	
	detectiveClasico interrogaA: ronaldo.
	detectiveClasico interrogaA: ronaldinho .
	detectiveClasico interrogaA: kaka .
	"obtiene 3 pistas, no guarda repetidas"
	
	detectiveClasico viajaA: paraguay .
	"consume tiempo de pais limitrofe, cambia ubicacion"
	
	detectiveClasico interrogaA: cardozo.
	"le responden que no ha visto a nadie, no se guarda como pista"
		
	detectiveClasico viajaA: mexico .
	"consume tiempo de pais no limitrofe, cambia ubicacion"
	
	detectiveClasico interrogaA: panchoVilla .
	"obtiene una pista, no guarda si es repetida"
		
	detectiveClasico sospechososFiltradosPor: {'ojos marrones' . 'cabello corto'. 'cabello negro'. 'tez blanca'}.
	"filtra en base a las pistas que obtuvo"
	
	detectiveClasico emitirOrdenDeArrestoPara: detectiveClasico sospechosos.
	"emite la orden de arresto en archivo txt, verificando primero que haya solo un delincuente con las caracteristicas que se pasaron"
	
	Assert that: detectiveClasico cantidadDeSospechosos isEqualTo: 1.
	
	
	! !


!classDefinition: #TestPais category: 'TP_CarmenSanDiego_Grupo_9'!
TestCase subclass: #TestPais
	instanceVariableNames: 'argentina brasil uruguay mexico paraguay pedro pablo sebastian david detectiveClasico colorDeOjos formaDePelo ubicacion colorDeTez colorDePelo nahuel gaston maximo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TestPais methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 23:25:22'!
setUp

	| listaDePaisesLimitrofes listaDeSospechosos unaListaDeTestigos unaListaDePaises |
	listaDePaisesLimitrofes _ Set new.
	unaListaDeTestigos _ Set new.
	listaDeSospechosos _ Set new.
	unaListaDePaises _ Set new.
	
	"paises inicializados"
	mexico _ Pais conNombre: 'Mexico' conEsperaDeMigracion: 4 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	argentina _ Pais conNombre: 'Argentina' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: unaListaDeTestigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	uruguay _ Pais conNombre: 'Uruguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	paraguay _ Pais conNombre: 'Paraguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'no es ruta de escape'.
	brasil _ Pais conNombre: 'Brasil' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	
	listaDePaisesLimitrofes addAll: {  brasil . uruguay . paraguay }.
	argentina conPaisesLimitrofes: listaDePaisesLimitrofes.
	
	unaListaDePaises addAll: {mexico . argentina . uruguay . paraguay . brasil }.
	
	"sospechosos inicializados"
	
	pedro _ Sospechoso conNombre: 'Pedro' conOjosColor: 'ojos marrones' conFormaDeCabello: 'ondulado' conColorDeCabello: 'cabello castaño' conColorDeTez: 'tez negra' .
	pablo _ Sospechoso conNombre: 'Pablo' conOjosColor: 'ojos azules' conFormaDeCabello: 'largo' conColorDeCabello: 'Amarillo' conColorDeTez: 'Blanco' .
	sebastian _ Sospechoso conNombre: 'Sebastian' conOjosColor: 'Verde' conFormaDeCabello: 'Lacio' conColorDeCabello: 'Negro' conColorDeTez: 'Oscura'.
	david _ Sospechoso conNombre: 'David' conOjosColor: 'ojos marrones' conFormaDeCabello: 'pelo corto' conColorDeCabello: 'cabello negro' conColorDeTez: 'tez blanca'.
	listaDeSospechosos addAll: {pedro . pablo . sebastian . david}.
	
	"detective clasico inicializado"
	detectiveClasico _ DetectiveClasico conHorasDeBusqueda: 50 * hour conUbicacion: argentina conListaDeSospechosos: listaDeSospechosos conPaisesParaViajar: unaListaDePaises.
	
	
	"pistas inicializado"
	
	colorDeOjos _ Pista conDescripcion: 'Ojos Marrones' .
	formaDePelo _ Pista conDescripcion: 'Pelo Marron' .
	ubicacion _ Pista conDescripcion: 'Brasil' .
	colorDeTez _ Pista conDescripcion: 'Pelo Marron' .
	colorDePelo _ Pista conDescripcion: 'Brasil' .
	
	
	"una lista de testigos inicializada"
	
	nahuel _ Testigo con: { colorDePelo . ubicacion . colorDeOjos } conUbicacion: argentina .
	gaston _ Testigo con: {formaDePelo . colorDePelo . ubicacion } conUbicacion: argentina .
	maximo _ Testigo con: { ubicacion . colorDeOjos . colorDeTez } conUbicacion: argentina .
	unaListaDeTestigos addAll: {nahuel . gaston . maximo}.! !

!TestPais methodsFor: 'as yet unclassified' stamp: 'DDC 12/6/2020 21:39:58'!
test001_unPaisTieneUnaCantidadDeHorasDeEsperaDefinidaPorMigración

	| unPais |
	
	unPais _ Pais conNombre: 'Argentina' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: {} esRutaDeEscapeDelDelincuente: unaCondicion.
	
	Assert that: unPais horasDeEsperaDeMigracion isEqualTo: 2 * hour.! !

!TestPais methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 22:53:02'!
test002_unPaisTiene3Testigos

	
	Assert that: argentina cantidadDeTestigos isEqualTo: 3 "testigos"! !

!TestPais methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 22:53:10'!
test003_unPaisTienePaisesLimitrofes
	
	
	
	Assert that: argentina cantidadDePaisesLimitrofes isEqualTo: 3 "paises".! !

!TestPais methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 22:53:17'!
test004_unPaisEsLimitrofeConOtro


	Assert isTrue: ( argentina esLimitrofeDe: brasil).! !

!TestPais methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 22:53:23'!
test005_unPaisNoEsLimitrofeConOtro


	Assert isTrue: (argentina noEsLimitrofeDe: mexico).! !


!classDefinition: #TestSospechoso category: 'TP_CarmenSanDiego_Grupo_9'!
TestCase subclass: #TestSospechoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TestSospechoso methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 18:26:00'!
test001_unSospechosoDeNombreAdrianConOjosMarronesPeloColorCastañoOnduladoYTezBlanca_noEsDelincuente


	| unSospechoso|
	
	unSospechoso _ Sospechoso conNombre: 'Adrian' conOjosColor: 'Marron' conFormaDeCabello: 'Ondulado' conColorDeCabello: 'Castaño' conColorDeTez: 'Blanco'.
	
	Assert that: unSospechoso cantidadDeCaracteristicas isEqualTo: 4 "caracteristicas".
	Assert that: unSospechoso nombre isEqualTo: 'Adrian'.
	
	
	
	
	! !


!classDefinition: #TestTestigo category: 'TP_CarmenSanDiego_Grupo_9'!
TestCase subclass: #TestTestigo
	instanceVariableNames: 'mexico argentina uruguay paraguay brasil pedro pablo sebastian david detectiveClasico colorDeOjos formaDePelo ubicacion maximo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TestTestigo methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 23:26:11'!
setUp

	|paisesLimitrofes paises sospechosos testigos |
	
	testigos _ Set new.
	sospechosos _ Set new.
	paises _ Set new.
	paisesLimitrofes _ Set new.
	
	mexico _ Pais conNombre: 'Mexico' conEsperaDeMigracion: 4 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	argentina _ Pais conNombre: 'Argentina' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	uruguay _ Pais conNombre: 'Uruguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	paraguay _ Pais conNombre: 'Paraguay' conEsperaDeMigracion: 3 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'no es ruta de escape'.
	brasil _ Pais conNombre: 'Brasil' conEsperaDeMigracion: 2 * hour conObjetoDeValor: 'Escultura'  conListaDeTestigos: testigos esRutaDeEscapeDelDelincuente: 'es ruta de escape'.
	
	paisesLimitrofes addAll: {  brasil . uruguay . paraguay }.
	argentina conPaisesLimitrofes: paisesLimitrofes.
	
	paises addAll: {mexico . argentina . uruguay . paraguay . brasil }.
	
	"sospechosos inicializados"
	
	pedro _ Sospechoso conNombre: 'Pedro' conOjosColor: 'ojos celestes' conFormaDeCabello: 'cabello ondulado' conColorDeCabello: 'cabello castaño' conColorDeTez: 'tez marron'.
	pablo _ Sospechoso conNombre: 'Pablo' conOjosColor: 'ojos azules' conFormaDeCabello: 'cabello largo' conColorDeCabello: 'cabello rubio' conColorDeTez: 'tez blanca'.
	sebastian _ Sospechoso conNombre: 'Sebastian' conOjosColor: 'ojos marrones' conFormaDeCabello: 'cabello lacio' conColorDeCabello: 'cabello negro' conColorDeTez: 'tez negra'.
	david _ Sospechoso conNombre: 'David' conOjosColor: 'ojos marrones' conFormaDeCabello: 'cabello corto' conColorDeCabello: 'cabello negro' conColorDeTez: 'tez blanca'.
	sospechosos addAll: {pedro . pablo . sebastian . david}.
	
	"detective clasico inicializado"
	detectiveClasico _ DetectiveClasico conHorasDeBusqueda: 50 * hour conUbicacion: argentina conListaDeSospechosos: sospechosos conPaisesParaViajar: paises.
	
	"pistas inicializadas"
	colorDeOjos _ Pista conDescripcion: 'Ojos Marrones' .
	formaDePelo _ Pista conDescripcion: 'Pelo Marron' .
	ubicacion _ Pista conDescripcion: 'Brasil' .
	maximo _ Testigo con: {colorDeOjos . formaDePelo . ubicacion } conUbicacion: argentina.! !

!TestTestigo methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 21:26:01'!
test001_unTestigoNoTienePistas

	| testigoCarlos  |
	
	testigoCarlos _ Testigo new.

	Assert isTrue: (testigoCarlos noTienePistas ) .! !

!TestTestigo methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 18:43:36'!
test002_unTestigoTiene3Pistas
	

	Assert that: (maximo cantidadDePistas) isEqualTo: 3.! !

!TestTestigo methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 18:44:04'!
test003_CuandoUnTestigoCon3PistasEsInterrogado_PasaATener2Pistas
	
	
	
	detectiveClasico interrogaA: maximo.

	Assert that: (maximo cantidadDePistas) isEqualTo: 2.! !

!TestTestigo methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 18:45:20'!
test004_CuandoUnTestigoCon3PistasEsInterrogado2Veces_PasaATener1Pistas
	
	
	
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.

	Assert that: (maximo cantidadDePistas) isEqualTo: 1.! !

!TestTestigo methodsFor: 'as yet unclassified' stamp: 'CB 12/10/2020 18:46:25'!
test005_CuandoUnTestigoCon3PistasEsInterrogado3Veces_NoTienePistas
	
	
	
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.
	detectiveClasico interrogaA: maximo.

	Assert isTrue: (maximo noTienePistas).! !


!classDefinition: #Detective category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #Detective
	instanceVariableNames: 'ubicacion tiempo sospechosos pistas paisesParaViajar paisesVisitados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!Detective methodsFor: 'accessing' stamp: 'DDC 12/6/2020 23:06:42'!
cantidadDePistas
	
	^ pistas size.! !

!Detective methodsFor: 'accessing' stamp: 'CB 12/8/2020 19:29:23'!
cantidadDeSospechosos
	
	^ sospechosos size.! !

!Detective methodsFor: 'accessing' stamp: 'DDC 12/6/2020 23:10:06'!
paisesParaViajar
	
	^paisesParaViajar! !

!Detective methodsFor: 'accessing' stamp: 'CB 12/8/2020 21:07:24'!
pistas
	
	^ pistas ! !

!Detective methodsFor: 'accessing' stamp: 'DDC 12/6/2020 23:10:54'!
sospechosos
	
	^sospechosos! !

!Detective methodsFor: 'accessing' stamp: 'CB 12/10/2020 20:37:33'!
sospechososFiltradosPor: caracteristicas

	^ sospechosos _ sospechosos select: [: sospechoso | sospechoso tieneTodosLasCaracteristicas: caracteristicas ].! !

!Detective methodsFor: 'accessing' stamp: 'CB 12/10/2020 23:40:51'!
tiempoDeEsperaPorViajar

	^ ubicacion horasDeEsperaDeMigracion! !

!Detective methodsFor: 'accessing' stamp: 'CB 11/29/2020 22:38:48'!
tiempoDeViaje

	^ self subclassResponsibility .! !

!Detective methodsFor: 'accessing' stamp: 'CB 12/10/2020 23:37:46'!
tiempoDeViajeA: unPais

	^ (self tipoDeViajeHacia: unPais) tiempoDeViajePara: self! !

!Detective methodsFor: 'accessing' stamp: 'DDC 12/6/2020 23:12:32'!
tiempoLimiteDeBusqueda

	^ tiempo ! !

!Detective methodsFor: 'accessing' stamp: 'DDC 12/6/2020 23:48:21'!
tiempoPorInterrogatorio
	

	^ self subclassResponsibility 
	
	! !

!Detective methodsFor: 'accessing' stamp: 'CB 12/8/2020 02:13:53'!
tipoDeViajeHacia: unPais

	^ TiposDeViajesDetective tipoDeViajePara: self con: unPais
	
	
	
	
	! !

!Detective methodsFor: 'accessing' stamp: 'CB 11/26/2020 16:40:12'!
ubicacion

	^ ubicacion
	
	! !


!Detective methodsFor: 'initialization' stamp: 'DDC 12/6/2020 23:07:42'!
conHorasDeBusqueda: unaCantidadDeHoras conUbicacion: unPais conListaDeSospechosos: unaListaDeSospechosos conPaisesParaViajar: unaListaDePaises  

	tiempo _ unaCantidadDeHoras .
	ubicacion _ unPais .
	sospechosos _ unaListaDeSospechosos .
	paisesParaViajar _ unaListaDePaises .! !


!Detective methodsFor: 'testing' stamp: 'CB 12/10/2020 18:54:42'!
estaEnMismaUbicacionDe: unTestigo

	^ (ubicacion = (unTestigo ubicacion))! !

!Detective methodsFor: 'testing' stamp: 'DDC 12/7/2020 17:32:41'!
haVisitado: unPais
	
	
	^ paisesVisitados includes: unPais.! !

!Detective methodsFor: 'testing' stamp: 'CB 12/8/2020 21:24:56'!
noTienePistas
	
	^ pistas isEmpty .! !

!Detective methodsFor: 'testing' stamp: 'CB 12/8/2020 21:05:15'!
noTieneTiempoDisponible
	
	^ tiempo <= (0 * hour).! !

!Detective methodsFor: 'testing' stamp: 'CB 12/10/2020 20:23:31'!
seEncuentraUbicadoEn: unPais

	^ (self ubicacion) = unPais! !

!Detective methodsFor: 'testing' stamp: 'CB 12/10/2020 20:37:39'!
tieneComoSospechosoA: unSospechoso

	^sospechosos includes: unSospechoso .
	
	! !

!Detective methodsFor: 'testing' stamp: 'DDC 12/8/2020 22:03:54'!
tieneLaPista: unaPista

	^ pistas includes: unaPista .! !

!Detective methodsFor: 'testing' stamp: 'DDC 12/8/2020 01:24:59'!
tieneTiempoDisponible
	
	^ self tiempoLimiteDeBusqueda > (0*hour).! !


!Detective methodsFor: 'validation' stamp: 'CB 12/10/2020 23:29:53'!
tieneUnUnicoSospechoso: unosSospechosos

	^ unosSospechosos size  = 1! !

!Detective methodsFor: 'validation' stamp: 'DDC 12/8/2020 00:51:06'!
validarQueDelicuenteEstuvoEnElPaisDe: unTestigo 
	
	^ (((unTestigo ubicacion) esRutaDeEscape) = ('es ruta de escape')) ifFalse: [self eliminarUltimaPista ]. ! !

!Detective methodsFor: 'validation' stamp: 'CB 12/10/2020 18:56:30'!
validarQueDetectiveEsteEnElMismoPaisQue: unTestigo 
	
	^ (self estaEnMismaUbicacionDe: unTestigo ) ifFalse: [self error: self noPuedeRealizarInterrogatorioAUnTestigoQueEstaEnOtroPais ]. ! !

!Detective methodsFor: 'validation' stamp: 'CB 12/10/2020 20:23:31'!
validarQueElDetectiveNoEstaUbicadoEn: unPais

	^ ((self seEncuentraUbicadoEn: unPais) not) ifFalse: [self error: self noSePuedeViajarAlPaisDondeSeEstaUbicado ].! !

!Detective methodsFor: 'validation' stamp: 'DDC 12/8/2020 21:52:18'!
validarQueElFiltradoArrojeUnSoloSospechosoEn: listaDeSospechosos 
	
	^( (self tieneUnUnicoSospechoso: listaDeSospechosos) ) ifFalse: [self error: self noPuedeImprimirseOrdenDeArrestoPorqueHayMasDeUnSospechosoConLasCaracteristicasObtenidas ].
	! !

!Detective methodsFor: 'validation' stamp: 'CB 12/8/2020 20:33:54'!
validarQueHayTiempoSuficiente
	
	^ (self tieneTiempoDisponible) ifFalse: [self error: self noHayMasTiempoSuficienteSePierdeLaPartida].     ! !

!Detective methodsFor: 'validation' stamp: 'CB 12/10/2020 20:36:38'!
validarQueNoEsteVaciaLaListaDePistasDe: unTestigo

	^ (unTestigo tienePistas) ifFalse: [self error: self noPuedeRealizarInterrogatorioAUnTestigoSinPistas ]. 
	! !


!Detective methodsFor: 'exceptions messages' stamp: 'DDC 12/7/2020 21:00:33'!
noHayMasTiempoSuficienteSePierdeLaPartida
	
	^'Pierde la partida. El tiempo se ha agotado'.! !

!Detective methodsFor: 'exceptions messages' stamp: 'DDC 12/7/2020 21:00:38'!
noPuedeImprimirseOrdenDeArrestoPorqueElSospechosoNoEsDelincuentePierdeLaPartida
	
	^ 'Pierde la partida. El Sospechoso elegido no es el delincuente.'! !

!Detective methodsFor: 'exceptions messages' stamp: 'DDC 12/7/2020 21:00:42'!
noPuedeImprimirseOrdenDeArrestoPorqueHayMasDeUnSospechosoConLasCaracteristicasObtenidas
	
	^ 'No puede imprimirse orden de arresto, porque hay más de un sospechoso con esas características'.! !

!Detective methodsFor: 'exceptions messages' stamp: 'DDC 12/6/2020 23:09:26'!
noPuedeRealizarInterrogatorioAUnTestigoQueEstaEnOtroPais
	
	^ 'El detective debe encontrarse en el mismo país que el testigo a interrogar.'.! !

!Detective methodsFor: 'exceptions messages' stamp: 'DDC 12/6/2020 23:09:31'!
noPuedeRealizarInterrogatorioAUnTestigoSinPistas

	^ 'El detective no puede realizar el interrogatorio a un testigo sin pistas'! !

!Detective methodsFor: 'exceptions messages' stamp: 'DDC 12/6/2020 23:09:42'!
noSePuedeViajarAlPaisDondeSeEstaUbicado
	
	^ 'El detective ya se encuentra ubicado en el país donde intenta viajar.'! !


!Detective methodsFor: 'action' stamp: 'CB 12/10/2020 23:48:54'!
arrivaA: unPais

	ubicacion _ unPais.! !

!Detective methodsFor: 'action' stamp: 'CB 12/8/2020 21:08:19'!
eliminarUltimaPista
	
	pistas remove: (pistas asOrderedCollection last)! !

!Detective methodsFor: 'action' stamp: 'DDC 12/10/2020 15:52:23'!
emitirOrdenDeArrestoPara: unSospechoso

	| unaOrdenDeArresto unArchivoVacio |
	
	self validarQueHayTiempoSuficiente.
	self validarQueElFiltradoArrojeUnSoloSospechosoEn: unSospechoso .
	
	
	unaOrdenDeArresto _ OrdenDeArresto para: unSospechoso .
	unArchivoVacio _  'orden.txt' asFileEntry.
	
	unaOrdenDeArresto imprimirEn: unArchivoVacio.
	
	
	
	! !

!Detective methodsFor: 'action' stamp: 'CB 12/10/2020 23:20:02'!
interrogaA: unTestigo
	
	self validarQueDetectiveEsteEnElMismoPaisQue: unTestigo .
	
	self validarQueNoEsteVaciaLaListaDePistasDe: unTestigo.
		
	self obtenerPistasDe: unTestigo.
	self perderTiempoPorInterrogatorio.
	
	self validarQueDelicuenteEstuvoEnElPaisDe: unTestigo .! !

!Detective methodsFor: 'action' stamp: 'CB 12/10/2020 20:34:56'!
obtenerPistasDe: unTestigo

	^ self subclassResponsibility.! !

!Detective methodsFor: 'action' stamp: 'CB 12/10/2020 23:20:02'!
perderTiempoPorInterrogatorio

	^ tiempo _ tiempo - (self tiempoPorInterrogatorio)! !

!Detective methodsFor: 'action' stamp: 'CB 12/10/2020 23:41:05'!
perderTiempoPorViajarA: unPais

	^ tiempo _ tiempo - (self tiempoDeEsperaPorViajar + (self tiempoDeViajeA: unPais))! !

!Detective methodsFor: 'action' stamp: 'CB 12/10/2020 23:49:22'!
registraVisitaA: unPais

 	paisesVisitados add: unPais ! !

!Detective methodsFor: 'action' stamp: 'CB 12/10/2020 23:49:48'!
viajaA: unPais
	
	
	self validarQueElDetectiveNoEstaUbicadoEn: unPais .
	
	
	self perderTiempoPorViajarA: unPais.
	self arrivaA: unPais.
	self registraVisitaA: unPais.
	
	
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Detective class' category: 'TP_CarmenSanDiego_Grupo_9'!
Detective class
	instanceVariableNames: ''!

!Detective class methodsFor: 'instance creation' stamp: 'DDC 12/6/2020 23:45:06'!
conHorasDeBusqueda: unaCantidadDeHoras conUbicacion: unPais conListaDeSospechosos: unaListaDeSospechosos conPaisesParaViajar: unaLIstaDePaises  
	
	^self new conHorasDeBusqueda: unaCantidadDeHoras conUbicacion: unPais conListaDeSospechosos: unaListaDeSospechosos conPaisesParaViajar: unaLIstaDePaises ! !


!classDefinition: #DetectiveClasico category: 'TP_CarmenSanDiego_Grupo_9'!
Detective subclass: #DetectiveClasico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!DetectiveClasico methodsFor: 'action' stamp: 'CB 12/10/2020 23:17:00'!
obtenerPistasDe: unTestigo

	unTestigo entregaPistaA: self.
	
	! !

!DetectiveClasico methodsFor: 'action' stamp: 'CB 12/10/2020 23:15:03'!
recibe: unaPista

	pistas add: unaPista.
	! !


!DetectiveClasico methodsFor: 'accessing' stamp: 'CB 11/29/2020 22:33:03'!
tiempoDeViaje
	
	^ 10 * hour.! !

!DetectiveClasico methodsFor: 'accessing' stamp: 'CB 12/5/2020 04:03:41'!
tiempoPorInterrogatorio
	
	^ 2 * hour.! !


!DetectiveClasico methodsFor: 'initialization' stamp: 'CB 12/10/2020 20:33:35'!
initialize

	tiempo _ 50 * hour.
	paisesVisitados _ Bag new. "un detective puede volver a un pais donde estuvo anteriormente si lo desea"
	pistas _ Set new.! !


!classDefinition: #DetectiveInterpol category: 'TP_CarmenSanDiego_Grupo_9'!
Detective subclass: #DetectiveInterpol
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!DetectiveInterpol methodsFor: 'initialization' stamp: 'CB 12/10/2020 20:33:42'!
initialize

	tiempo _ 50 * hour.
	paisesVisitados _ Bag new. "un detective puede volver a un pais donde estuvo anteriormente si lo desea"
	pistas _ Set new.! !


!DetectiveInterpol methodsFor: 'accessing' stamp: 'CB 11/29/2020 22:35:48'!
tiempoDeViaje
	
	^ 8 * hour.! !

!DetectiveInterpol methodsFor: 'accessing' stamp: 'DDC 12/6/2020 23:55:57'!
tiempoPorInterrogatorio
	
	^ 2 * hour.! !


!DetectiveInterpol methodsFor: 'action' stamp: 'CB 12/10/2020 23:17:11'!
obtenerPistasDe: unTestigo

	unTestigo entregaPistaA: self.! !

!DetectiveInterpol methodsFor: 'action' stamp: 'CB 12/10/2020 23:18:10'!
recibe: unaPista

	pistas add: unaPista.! !


!classDefinition: #DetectivePersuasivo category: 'TP_CarmenSanDiego_Grupo_9'!
Detective subclass: #DetectivePersuasivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!DetectivePersuasivo methodsFor: 'initialization' stamp: 'CB 12/10/2020 20:33:48'!
initialize

	tiempo _ 50 * hour.
	paisesVisitados _ Bag new. "un detective puede volver a un pais donde estuvo anteriormente si lo desea"
	pistas _ Set new.! !


!DetectivePersuasivo methodsFor: 'action' stamp: 'CB 12/10/2020 23:17:17'!
obtenerPistasDe: unTestigo

	unTestigo entregaPistaA: self.
	unTestigo entregaPistaA: self.! !

!DetectivePersuasivo methodsFor: 'action' stamp: 'CB 12/10/2020 23:18:21'!
recibe: unaPista

	pistas add: unaPista.! !


!DetectivePersuasivo methodsFor: 'accessing' stamp: 'CB 11/29/2020 22:36:48'!
tiempoDeViaje
	
	^ 10 * hour.! !

!DetectivePersuasivo methodsFor: 'accessing' stamp: 'DDC 12/6/2020 23:46:31'!
tiempoPorInterrogatorio
	
	^ 1 * hour.! !


!classDefinition: #OrdenDeArresto category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #OrdenDeArresto
	instanceVariableNames: 'delincuente'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!OrdenDeArresto methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 21:10:16'!
cabecera

	^ '	REPÚBLICA ARGENTINA
	BUENOS AIRES - QUILMES
	
	ORDEN DE ARRESTO'! !

!OrdenDeArresto methodsFor: 'as yet unclassified' stamp: 'DDC 12/7/2020 03:13:53'!
delincuente

	^delincuente! !

!OrdenDeArresto methodsFor: 'as yet unclassified' stamp: 'DDC 12/7/2020 02:43:38'!
imprimirEn: unArchivo 
	
	unArchivo forceWriteStreamDo: [:fileStream |
		fileStream nextPutAll: (self textoEscritoHastaElMomento)
		
		].! !

!OrdenDeArresto methodsFor: 'as yet unclassified' stamp: 'DDC 12/7/2020 16:57:01'!
para:unDelincuente

	delincuente _ unDelincuente asOrderedCollection first. ! !

!OrdenDeArresto methodsFor: 'as yet unclassified' stamp: 'DDC 12/9/2020 12:36:12'!
textoEscritoHastaElMomento

	| textoEscritoHastaElMomento |
	
	textoEscritoHastaElMomento _ String  streamContents: [:unStream | 
		unStream nextPutAll: (self cabecera ).
		unStream newLine .
		unStream newLine .
		unStream newLine .
		unStream nextPutAll: 'Agencia de detectives A.C.M.E. emite la orden de arresto para: '.
		unStream nextPutAll: (self delincuente nombre ). 
		unStream newLine .
		unStream newLine .
		unStream nextPutAll: 'El delincuente posee las siguientes características: '.
		unStream newLine .
		unStream nextPutAll: (self delincuente listaDeCaracteristicas asOrderedCollection first). 
		unStream newLine .
		unStream nextPutAll: (self delincuente listaDeCaracteristicas asOrderedCollection second).
		unStream newLine .
		unStream nextPutAll: (self delincuente listaDeCaracteristicas asOrderedCollection third ). 
		unStream newLine .
		unStream nextPutAll: (self delincuente listaDeCaracteristicas asOrderedCollection fourth ).
		unStream newLine .
		unStream newLine .
		unStream nextPutAll: 'Procédase a traerlo a su país de origen y restituir el objeto robado.'.
	].
	
	^ textoEscritoHastaElMomento.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrdenDeArresto class' category: 'TP_CarmenSanDiego_Grupo_9'!
OrdenDeArresto class
	instanceVariableNames: ''!

!OrdenDeArresto class methodsFor: 'as yet unclassified' stamp: 'DDC 12/7/2020 03:08:13'!
para: unDelincuente

	^self new para: unDelincuente .! !


!classDefinition: #Pais category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #Pais
	instanceVariableNames: 'tiempoDeEsperaPorMigracion testigos paisesLimitrofes objetoDeValor nombre esRutaDeEscape'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!Pais methodsFor: 'accessing' stamp: 'CB 12/2/2020 14:53:44'!
cantidadDePaisesLimitrofes
	
	^ paisesLimitrofes size.! !

!Pais methodsFor: 'accessing' stamp: 'CB 11/29/2020 21:09:44'!
cantidadDeTestigos
	
	^ testigos size.! !

!Pais methodsFor: 'accessing' stamp: 'CB 12/2/2020 14:53:56'!
horasDeEsperaDeMigracion
	
	^ tiempoDeEsperaPorMigracion ! !


!Pais methodsFor: 'initialization' stamp: 'DDC 12/6/2020 21:40:28'!
conNombre: nombreDePais conEsperaDeMigracion: unaCantidadDeHoras conObjetoDeValor: unObjetoDeValor conListaDeTestigos: unaListaDeTestigos esRutaDeEscapeDelDelincuente: unaCondicion  
	
	nombre _ nombreDePais .
	tiempoDeEsperaPorMigracion _ unaCantidadDeHoras .
	objetoDeValor _ unObjetoDeValor .
	testigos _ unaListaDeTestigos .
	esRutaDeEscape _ unaCondicion .! !

!Pais methodsFor: 'initialization' stamp: 'CB 12/2/2020 14:53:49'!
conPaisesLimitrofes: unaListaDePaises 
	
	paisesLimitrofes _ unaListaDePaises .! !


!Pais methodsFor: 'testing' stamp: 'CB 12/2/2020 14:53:52'!
esLimitrofeDe: unPais 
	
	^  paisesLimitrofes includes: unPais.! !

!Pais methodsFor: 'testing' stamp: 'DDC 12/6/2020 21:48:09'!
esRutaDeEscape

	^esRutaDeEscape ! !

!Pais methodsFor: 'testing' stamp: 'CB 12/2/2020 14:54:02'!
noEsLimitrofeDe: unPais

	^ (paisesLimitrofes includes: unPais ) not
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pais class' category: 'TP_CarmenSanDiego_Grupo_9'!
Pais class
	instanceVariableNames: ''!

!Pais class methodsFor: 'instance creation' stamp: 'DDC 12/6/2020 21:39:58'!
conNombre: nombreDePais conEsperaDeMigracion: unaCantidadDeHoras conObjetoDeValor: unObjetoDeValor conListaDeTestigos: unaListaDeTestigos esRutaDeEscapeDelDelincuente: unaCondicion  
	
	^self new conNombre: nombreDePais conEsperaDeMigracion: unaCantidadDeHoras conObjetoDeValor: unObjetoDeValor conListaDeTestigos: unaListaDeTestigos esRutaDeEscapeDelDelincuente: unaCondicion ! !


!classDefinition: #Partida category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #Partida
	instanceVariableNames: 'detective'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!Partida methodsFor: 'accesing' stamp: 'DDC 12/10/2020 17:34:06'!
detective
	
	^ detective .! !


!Partida methodsFor: 'initialization' stamp: 'DDC 12/10/2020 17:31:44'!
conDetective: unDetective 

	detective _ unDetective .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Partida class' category: 'TP_CarmenSanDiego_Grupo_9'!
Partida class
	instanceVariableNames: ''!

!Partida class methodsFor: 'as yet unclassified' stamp: 'DDC 12/10/2020 17:31:26'!
conDetective: unDetective 
	
	^ self new conDetective: unDetective .! !


!classDefinition: #Pista category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #Pista
	instanceVariableNames: 'descripcion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!Pista methodsFor: 'as yet unclassified' stamp: 'DDC 12/4/2020 15:54:06'!
conDescripcion: unaDescripcion

	descripcion _ unaDescripcion! !

!Pista methodsFor: 'as yet unclassified' stamp: 'DDC 12/8/2020 00:18:10'!
descripcion

	^ descripcion ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pista class' category: 'TP_CarmenSanDiego_Grupo_9'!
Pista class
	instanceVariableNames: 'pistaDeUbicacion'!

!Pista class methodsFor: 'instance creation' stamp: 'DDC 12/4/2020 15:39:43'!
conDescripcion: unaDescripcion
	
	^self new conDescripcion: unaDescripcion .! !


!classDefinition: #Sospechoso category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #Sospechoso
	instanceVariableNames: 'nombre caracteristicas condicionDeCulpabilidad objetosRobados ubicacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!Sospechoso methodsFor: 'initialization' stamp: 'DDC 12/10/2020 16:41:21'!
conNombre: unNombre conOjosColor: unColorDeOjos conFormaDeCabello: unaFormaDeCabello conColorDeCabello: unColorDeCabello conColorDeTez: unColorDeTez 
	
	nombre _ unNombre.
	
	caracteristicas add: unColorDeOjos .
	caracteristicas add: unaFormaDeCabello .
	caracteristicas add: unColorDeCabello .
	caracteristicas add: unColorDeTez.
	
! !

!Sospechoso methodsFor: 'initialization' stamp: 'DDC 12/10/2020 16:41:21'!
initialize

	caracteristicas _ Set new.
	
	objetosRobados _ Set new.! !


!Sospechoso methodsFor: 'accessing' stamp: 'CB 12/10/2020 18:26:37'!
cantidadDeCaracteristicas
	
	^ caracteristicas size.! !

!Sospechoso methodsFor: 'accessing' stamp: 'DDC 12/10/2020 16:41:21'!
listaDeCaracteristicas

	^caracteristicas ! !

!Sospechoso methodsFor: 'accessing' stamp: 'CB 11/26/2020 17:30:03'!
nombre
	
	^nombre! !

!Sospechoso methodsFor: 'accessing' stamp: 'CB 12/8/2020 21:18:12'!
ubicacion
	
	^ ubicacion! !


!Sospechoso methodsFor: 'testing' stamp: 'DDC 12/10/2020 16:41:21'!
tieneComoAspecto: unaCaracteristica

	^ (caracteristicas includes: unaCaracteristica)! !

!Sospechoso methodsFor: 'testing' stamp: 'DDC 12/10/2020 16:41:21'!
tieneTodosLasCaracteristicas: unasCaracteristicas

	^ unasCaracteristicas allSatisfy: [: caracteristica | caracteristicas includes: caracteristica ] .! !


!Sospechoso methodsFor: 'actions' stamp: 'DDC 12/6/2020 20:24:53'!
viajaA: unPais

	ubicacion _ unPais .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sospechoso class' category: 'TP_CarmenSanDiego_Grupo_9'!
Sospechoso class
	instanceVariableNames: ''!

!Sospechoso class methodsFor: 'instance creation' stamp: 'DDC 12/10/2020 15:22:39'!
conNombre: unNombre conOjosColor: unColor conFormaDeCabello: unaFormaDeCabello conColorDeCabello: unColorDeCabello conColorDeTez: unColorDeTez 
	
	
	^self new conNombre: unNombre conOjosColor: unColor conFormaDeCabello: unaFormaDeCabello conColorDeCabello: unColorDeCabello conColorDeTez: unColorDeTez .! !


!classDefinition: #Testigo category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #Testigo
	instanceVariableNames: 'pistas ubicacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!Testigo methodsFor: 'initialization' stamp: 'DDC 12/6/2020 20:56:26'!
con: unaLista conUbicacion: unaUbicacion 

	pistas addAll: unaLista .
	
	ubicacion _ unaUbicacion.! !

!Testigo methodsFor: 'initialization' stamp: 'DDC 12/5/2020 00:17:17'!
initialize

	pistas _ OrderedCollection new.! !


!Testigo methodsFor: 'accessing' stamp: 'DDC 12/5/2020 00:17:17'!
cantidadDePistas
	
	^ pistas size.! !

!Testigo methodsFor: 'accessing' stamp: 'CB 12/8/2020 16:32:40'!
pistas
	
	^ pistas! !

!Testigo methodsFor: 'accessing' stamp: 'CB 12/10/2020 23:16:24'!
primerPista
	
	^ pistas first.! !

!Testigo methodsFor: 'accessing' stamp: 'CB 12/8/2020 21:22:19'!
ubicacion
	
	^ ubicacion! !


!Testigo methodsFor: 'action' stamp: 'CB 12/5/2020 03:03:24'!
descartarPista
	
	pistas remove: pistas first.! !

!Testigo methodsFor: 'action' stamp: 'CB 12/10/2020 23:15:36'!
entregaPistaA: unDetective
	
	
	unDetective recibe: self primerPista.
	self descartarPista.! !


!Testigo methodsFor: 'testing' stamp: 'CB 12/8/2020 21:25:01'!
noTienePistas
	
	^ pistas isEmpty.! !

!Testigo methodsFor: 'testing' stamp: 'CB 12/10/2020 20:37:14'!
tienePistas
	
	^ (pistas size > 0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Testigo class' category: 'TP_CarmenSanDiego_Grupo_9'!
Testigo class
	instanceVariableNames: ''!

!Testigo class methodsFor: 'instance creation' stamp: 'DDC 12/6/2020 20:56:56'!
con: unaListaDePistas conUbicacion: unaUbicacion 
	
	^self new con: unaListaDePistas conUbicacion: unaUbicacion .! !


!classDefinition: #TiposDeViajesDetective category: 'TP_CarmenSanDiego_Grupo_9'!
Object subclass: #TiposDeViajesDetective
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!TiposDeViajesDetective methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 02:13:04'!
tiempoDeViajePara: unDetective

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TiposDeViajesDetective class' category: 'TP_CarmenSanDiego_Grupo_9'!
TiposDeViajesDetective class
	instanceVariableNames: ''!

!TiposDeViajesDetective class methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 02:11:41'!
puedeHacerseCargoDe: unDetective queViajaHacia: unPais

      self subclassResponsibility .! !

!TiposDeViajesDetective class methodsFor: 'as yet unclassified' stamp: 'CB 12/8/2020 02:06:05'!
tipoDeViajePara: unDetective con: unPais 
	
	^ (self allSubclasses detect: [: cadaTipo | cadaTipo puedeHacerseCargoDe: unDetective queViajaHacia: unPais ]) new. ! !


!classDefinition: #ViajeAPaisLimitrofe category: 'TP_CarmenSanDiego_Grupo_9'!
TiposDeViajesDetective subclass: #ViajeAPaisLimitrofe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!ViajeAPaisLimitrofe methodsFor: 'as yet unclassified' stamp: 'CB 11/30/2020 00:35:41'!
tiempoDeViajePara: unDetective

	^ (unDetective tiempoDeViaje / 2)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ViajeAPaisLimitrofe class' category: 'TP_CarmenSanDiego_Grupo_9'!
ViajeAPaisLimitrofe class
	instanceVariableNames: ''!

!ViajeAPaisLimitrofe class methodsFor: 'testing' stamp: 'CB 11/30/2020 19:06:05'!
puedeHacerseCargoDe: unDetective queViajaHacia: unPais

      ^ unDetective ubicacion esLimitrofeDe: unPais. 
	! !


!classDefinition: #ViajeAPaisNoLimitrofe category: 'TP_CarmenSanDiego_Grupo_9'!
TiposDeViajesDetective subclass: #ViajeAPaisNoLimitrofe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP_CarmenSanDiego_Grupo_9'!

!ViajeAPaisNoLimitrofe methodsFor: 'accessing' stamp: 'CB 11/30/2020 00:47:20'!
tiempoDeViajePara: unDetective

	^ unDetective tiempoDeViaje.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ViajeAPaisNoLimitrofe class' category: 'TP_CarmenSanDiego_Grupo_9'!
ViajeAPaisNoLimitrofe class
	instanceVariableNames: ''!

!ViajeAPaisNoLimitrofe class methodsFor: 'testing' stamp: 'CB 11/30/2020 19:52:17'!
puedeHacerseCargoDe: unDetective queViajaHacia: unPais 
	
	 ^ unDetective ubicacion noEsLimitrofeDe: unPais
! !
