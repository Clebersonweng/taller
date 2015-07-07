package taller.cliente

import taller.facturaMaestro.FacturaMaestro
import taller.ordenDeServicio.OrdenDeServicio
import taller.vehiculo.Vehiculo




class Cliente {
	Integer numDocumento
	String nombre
	String apellido
	String numContacto
	String direccion
	static hasMany = [vehiculo:Vehiculo,ordenServicio:OrdenDeServicio,factura:FacturaMaestro]
	static constraints = {
		numDocumento(unique:true,blank:false,minSize:3,matches:"[0-9]+")
		nombre (blank:false , minSize:3)
		apellido(blank:true,minSize:3)
		numContacto(blank:false,minSize:6,matches:"[0-9 ]+")
		direccion(blank:false,minSize:4)
	}
	String toString() {
		return "${nombre}"+" "+"${apellido}"
	};
	def beforeDelete = {
		Vehiculo.withNewSession{ vehiculo*.delete() }
	}
}
