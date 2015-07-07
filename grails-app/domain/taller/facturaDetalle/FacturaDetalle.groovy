package taller.facturaDetalle

import taller.facturaMaestro.FacturaMaestro;
import taller.ordenDeServicioDetalle.OrdenDeServicioDetalle
import taller.tipoDeTrabajo.TipoDeTrabajo;

class FacturaDetalle {
	static belongsTo=[factura:FacturaMaestro,tipoDeTrabajo:TipoDeTrabajo]
	OrdenDeServicioDetalle ordenDetalle
	BigDecimal subtotal
	static constraints = {
		//servicioDetalle(unique: true)
	}
	String toString(){
		return ordenDetalle
	}
}
