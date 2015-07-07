package taller.estado

import taller.ordenDeServicio.OrdenDeServicio

class Estado {
	String estado
	String descripcion
	static hasMany = [orden:OrdenDeServicio]
	static constraints = {
		estado(blank:false)
		descripcion(blank:false)
	}
	String toString(){
		return estado
	}
}
