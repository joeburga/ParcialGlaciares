
class MasaDeAgua {
	
	var tempanos
	var temperaturaAmbiente = 1
	
	constructor(listaTempanos){
		
		tempanos = listaTempanos
	}
	
	method esAtractiva(){
		
		return self.tieneMasDe5TempanosFlotando() and self.todosSonGrandes() or self.todosSonAzules()
	}
	
	method tieneMasDe5TempanosFlotando(){
		
		return tempanos.size() > 5
	}	
	
	method todosSonGrandes(){
		
		return tempanos.all{tempano => tempano.esGrande()}
	}
	
	method todosSonAzules(){
		
		return tempanos.all{tempano => tempano.seVeAzul()}
	}
	
	method temperatura(){
		
		return temperaturaAmbiente - tempanos.sum({tempano => tempano.cuantoEnfria()})
	}
	
	method tempanosGrandes(){
		
		return tempanos.filter({tempano => tempano.esGrande()}).size()
	}
	
	method agregarTempano(tempano){
		
		tempanos.add(tempano)
	}
	
	method esGlaciar(){
		
		return false
	}
		
}

class Lago inherits MasaDeAgua {
	
}

class Rio inherits MasaDeAgua {
	
	var velocidaBase //igual a la velocidadAgua 
	
	constructor(_velocidadAgua,listaTempanos) = super(listaTempanos) {
		
		velocidaBase = _velocidadAgua
	}
	
	override method temperatura(){
		
		return super() + velocidaBase - self.tempanosGrandes()
	}
	
	
	
	
}