
class Tempano {
	
	var peso
	var gradosC
	
	constructor(_peso,_gradosC){
		
		peso = _peso
		gradosC = _gradosC
	}
	
	method seVeAzul(){
		
		return false
	}
	
	method peso(){
		
		return peso
	}
	method cuantoEnfria()
	
	method grados()
	
	method esGrande(){
		
		return peso > 500
	}
	
	method flotarEn(lugar){
		
		lugar.agregarTempano(self)
		peso -= 1
		
	}
	
	
}

class TempanoCompacto inherits Tempano {
	
		
	method parteVisible(){
		
		return peso * 0.15
	}
	
	override method seVeAzul(){
		
		return self.parteVisible() > 100
	}
	
	override method cuantoEnfria(){
		
		return self.grados()
	}
	
	override method grados(){
		
		return peso / 100
	}
	
	override method flotarEn(lugar){
		if(!self.esGrande()){
			
			lugar.agregarTempano(self)
			peso -= 1
			self.volveteAireado()//como cambiar el tipo¿?
		}
		
	}
	
	method volveteAireado(){
		
	}
}

class TempanoAireado inherits Tempano {
	
	override method cuantoEnfria(){
		
		return self.grados()
	}
	
	override method grados(){
		
		return 0.5
	}
}
