package taller.ordenDeServicioDetalle

import taller.ordenDeServicio.OrdenDeServicio
import taller.repuesto.Repuesto



class OrdenDeServicioDetalle{
	Integer cantidad
	static belongsTo = [orden:OrdenDeServicio,repuesto:Repuesto]
	static constraints = {
		repuesto()
		cantidad(blank:false,matches:"[0-9]+")
	}
	boolean _deleted
	static transients = ['_deleted']
}
