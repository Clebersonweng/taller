package taller.facturaMaestro

import taller.cliente.Cliente
import taller.facturaDetalle.FacturaDetalle
import taller.ordenDeServicio.OrdenDeServicio

class FacturaMaestro {
	BigDecimal total
	Date fecha
	Integer numFactura
	static belongsTo = [cliente:Cliente, ordenMaestroId:OrdenDeServicio]
	static hasMany = [facturaDet:FacturaDetalle]
	static constraints = { numFactura(unique:true) }
	String toString(){
		return numFactura
	}
}
