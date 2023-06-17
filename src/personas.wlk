import planetas.*
import armas.*

class Persona {
	var property edad
	method inteligencia() {
		if (edad.between(20, 40)) { return 12 }
		else { return 8 }
	}
	method potencia() = 20
	method esDestacada() = edad == 25 or edad == 35
	method ofrecerTributos(planeta) {}
	method valor() = self.inteligencia() + self.potencia()
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property tecnicasConocidas = 2
	override method potencia() = super() + (masaMuscular * tecnicasConocidas)
	override method esDestacada() = super() or tecnicasConocidas > 5
	method entrenar(dias) { masaMuscular += dias / 5 }
	method aprenderUnaTecnica() { tecnicasConocidas += 1 }
	override method ofrecerTributos(planeta) {
		planeta.construirMurallas()
		planeta.construirMurallas()
	}
}

class Docente inherits Persona {
	var property cursosDados = 0
	override method inteligencia() = super() + cursosDados * 2
	override method esDestacada() = cursosDados > 3
	override method ofrecerTributos(planeta) { planeta.fundarUnMuseo() }
	override method valor() = super() + 5
}

class Soldado inherits Persona {
	const armas = #{}
	override method potencia() = super() + armas.sum({arma => arma.potenciaOtorgada(self)})
	override method ofrecerTributos(planeta) { 
		planeta.construirMurallas()
		planeta.construirMurallas()
		planeta.construirMurallas()
		planeta.construirMurallas()
		planeta.construirMurallas()
	}
}