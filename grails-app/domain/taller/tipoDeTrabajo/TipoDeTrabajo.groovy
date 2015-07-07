package taller.tipoDeTrabajo

import taller.facturaDetalle.FacturaDetalle;
import taller.ordenDeServicio.OrdenDeServicio

class TipoDeTrabajo {
	String tipoDeTrabajo
	Double precio
	String descripcion
	static hasMany = [orden:OrdenDeServicio, facturaDetalle:FacturaDetalle]
	static constraints = {
		tipoDeTrabajo blank:false
		precio nullable:false
		descripcion blank:false
	}
	String toString(){
		return tipoDeTrabajo
	}
}
