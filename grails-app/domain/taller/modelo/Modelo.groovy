package taller.modelo

import taller.marca.Marca
import taller.vehiculo.Vehiculo

class Modelo {
	String modelo
	String descripcion

	static hasMany = [vehiculo:Vehiculo]
	static belongsTo = [marca:Marca]
	
	static constraints = {
		marca ()
		modelo (blank:false)
	}

	String toString() {		
		return modelo;
	};
}
