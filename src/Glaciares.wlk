import Tempanos.*
import MasasDeAgua.*

class Glaciar {
	
	var masa
	var temperatura = 1
	var tempanosDesprendidos = #{}
		
	constructor(_masa){
		
		masa = _masa
	}
	/* Saber para un glaciar cuál sería el peso inicial de un témpano si surgiera un
	 * desprendimiento. El peso inicial es la millonésima parte de la masa del 
	 * glaciar multiplicado por la temperatura de su desembocadura. */
	 
	method pesoInicialTempano(tempano){
		
		return (masa / 1000000) * temperatura//o es los grados del tempano? tempano.grados()  
	}
	
	/* Hacer que se produzca un desprendimiento de un glaciar. Cuando esto sucede, 
	 * se genera un témpano compacto con el peso inicial correspondiente, el glaciar
	 * pierde tanta masa como pese el témpano generado e inmediatamente el mismo cae 
	 * sobre su desembocadura.Si el témpano cae en el agua, éste queda flotando a la 
	 * deriva en ese lago o río. En el caso de caer en otro glaciar, dicho glaciar 
	 * crece en masa tanto como el peso del témpano. */
	
	method producirDesprendimiento(lugarDondeCae){
		var tempanoGenerado = new TempanoCompacto(0,0)//peso,grados
		masa -= tempanoGenerado.peso() 
		self.desembocaEn(tempanoGenerado, lugarDondeCae)
	}
	/* Un glaciar desemboca en un solo lugar, que puede ser otro glaciar o
	 * una masa de agua (o sea, un río o un lago).Es allí donde van cayendo
	 * los témpanos que se desprenden cada tanto del glaciar. */
		
	method desembocaEn(tempano,lugar){
		if(self.esGlaciar()){
			
			lugar.agregarTempano(tempano)
			masa += tempano.peso()
			
		}else{
			
			lugar.agregarTempano(tempano)
			tempano.flotarEn(lugar)
		}
		
	}
	
	method agregarTempano(tempano){
		
		tempanosDesprendidos.add(tempano)
	}
	
	method esGlaciar(){
		
		return true
	}
}



