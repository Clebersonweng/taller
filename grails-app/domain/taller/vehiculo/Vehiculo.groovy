package taller.vehiculo

import taller.cliente.Cliente
import taller.marca.Marca
import taller.modelo.Modelo
import taller.ordenDeServicio.OrdenDeServicio

class Vehiculo {
	Integer anho
	String matricula
	static hasMany = [orden:OrdenDeServicio]
	static belongsTo = [cliente:Cliente,marca:Marca,modelo:Modelo]
	static constraints = {
		cliente blank:false
		matricula(unique:true, blank:false)
		marca (blank:false)
		modelo (blank:false)
		anho (blank:false,minSize:3,matches:"[0-9]+")
	}
	String toString() {
		return matricula
	};
}
