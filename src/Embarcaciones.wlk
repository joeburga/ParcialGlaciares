/*6.Como cualquier fenómeno natural, los glaciares atraen turistas. Sabemos que hay 
 * 	embarcaciones de distintos tamaños y con distinta fuerza en su motor, queremos 
 *  agregar a nuestro programa que una embarcación navegue por un lago o un río con
 *  el objetivo de predecir qué efectos podría producir sobre su entorno, teniendo 
 *  en cuenta a su vez que dicha embarcación tal vez no pueda realizar la navegación 
 *  pedida. Sólo es posible navegar en un lago con más de 20 témpanos grandes si el
 *  tamaño de la embarcación es menor a 10 metros, y además la temperatura del lago 
 *  no debe ser menor a 0°. En el caso de los ríos, sólo son navegables si la velocidad
 *  del agua es menor a la fuerza de la embarcación. El efecto que se produce al 
 *  navegar por cualquier masa de agua es que todos los témpanos que están flotando
 *  allí pierden 1 kilo, y aquellos témpanos compactos que no sean grandes luego de
 *  perder peso se vuelven aireados. */
 
class Embarcacion {
	
	var tamanio
	var fuerza
	
	constructor(_tamanio,_fuerza){
		
		tamanio = _tamanio
		fuerza = _fuerza
	}
	
	
	method navegaPor(masaDeAgua){
		
		if(self.puedoNavegar(masaDeAgua)){
			
			masaDeAgua.efectoTempanosFlotando()
		}			
	}
	
	method puedoNavegar(masaDeAgua){
		
		return masaDeAgua.puedeNavegarEmbarcacion(self)
	}
	
	method esChico(){
		
		return tamanio < 10
	}
		
		
	
}
