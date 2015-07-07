package taller.mecanico

import taller.ordenDeServicio.OrdenDeServicio

class Mecanico {
	String nombre
	String apellido
	Integer numDocumento
	String direccion
	String numContacto

	static hasMany= [ordenesDeServicios:OrdenDeServicio]

	static constraints = {
		nombre (blank:false ,minSize:3)
		apellido (blank:false ,minSize:3)
		numDocumento (blank:false,minSize:3,matches:"[0-9]+")
		direccion (blank:true,minSize:4)
		numContacto (blank:false,minSize:6,matches:"[0-9]+")
	}
	String toString(){
		return nombre
	};
}
