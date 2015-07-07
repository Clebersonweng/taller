package taller.repuesto

import taller.ordenDeServicioDetalle.OrdenDeServicioDetalle

class Repuesto {
	String nombre
	String marca
	Integer precioCompra
	Integer precioVenta
	String descripcion

	static hasMany = [ordenDetalle:OrdenDeServicioDetalle]

	static constraints = {
		
		nombre(blank:false ,minSize:1)
		marca (blank:false ,minSize:1)
		precioCompra (blank:false,minSize:1,matches:"[0-9]+")
		precioVenta (blank:false,minSize:1,matches:"[0-9]+")

		descripcion blank:true
	}
	String toString() {
		
		return nombre;
	};
}

