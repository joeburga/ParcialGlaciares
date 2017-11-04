
class MasaDeAgua {
	
	var tempanos
	var temperaturaAmbiente = 1
	
	constructor(listaTempanos){
		
		tempanos = listaTempanos
	}
	
	method tempanos(){
		
		return tempanos
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
	
	method cantidadTempanosGrandes(){
		
		return tempanos.filter({tempano => tempano.esGrande()}).size()
	}
	
	method agregarTempano(tempano){
		
		tempanos.add(tempano)
	}
	
	method esGlaciar(){
		
		return false
	}
	
	method esLago(){
		
		return false
	}
	
	method esRio(){
		
		return false
	}
	
	method tempanosGrandesMayorA(valor){
		
		return self.todosSonGrandes() and tempanos.size() > valor
	}
	
	method temperaturaMayorA(valor){
		
		return self.temperatura() > valor
	}
	
	method puedeNavegarEmbarcacion(embarcacion){
		
		return true
	}
	
	method efectoTempanosFlotando(){
		
		tempanos.forEach({tempano => tempano.flotarEn(self)})		
	}
}

class Lago inherits MasaDeAgua {
	
	override method esLago(){
		
		return true
	}
	
	override method puedeNavegarEmbarcacion(embarcacion){
		
		return self.esLago() and self.temperaturaMayorA(0) and self.tempanosGrandesMayorA(20) and embarcacion.esChico() 
																														
	}
}

class Rio inherits MasaDeAgua {
	
	var velocidaBase //igual a la velocidadAgua 
	
	constructor(_velocidadAgua,listaTempanos) = super(listaTempanos) {
		
		velocidaBase = _velocidadAgua
	}
	
	override method temperatura(){
		
		return super() + velocidaBase - self.cantidadTempanosGrandes()
	}
	
	override method esRio(){
		
		return true
	}
	
	override method puedeNavegarEmbarcacion(embarcacion){
		
		return self.esRio() and velocidaBase < embarcacion.fuerza()
	}
	
		
}