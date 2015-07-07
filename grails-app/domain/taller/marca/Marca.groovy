package taller.marca

import taller.modelo.Modelo
import taller.vehiculo.Vehiculo

class Marca {
	String marca
	String descripcion
	static hasMany = [vehiculo:Vehiculo,modelo:Modelo]
	static constraints = {
		marca (blank:false ,matches:"[a-zA-Z]+")
		descripcion (matches:"[a-zA-Z .-]+")
	}
	 String toString() {
		return marca
	};
}
