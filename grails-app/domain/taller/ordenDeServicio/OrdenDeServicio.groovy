package taller.ordenDeServicio


import taller.cliente.Cliente
import taller.estado.Estado
import taller.mecanico.Mecanico
import taller.ordenDeServicioDetalle.OrdenDeServicioDetalle
import taller.tipoDeTrabajo.TipoDeTrabajo
import taller.vehiculo.Vehiculo

class OrdenDeServicio {
	List detalles = new ArrayList()
	static hasMany = [detalles: OrdenDeServicioDetalle]
	static belongsTo = [vehiculo: Vehiculo,cliente:Cliente,mecanico:Mecanico,tipoTrabajo:TipoDeTrabajo,estado:Estado]
	Integer numOrden
	Date fecha
	String descripcionProblema
	String descripcionTrabajoRealizar
	//List detalles = new ArrayList()
	static constraints = {
		//detalles(blank:false)
		vehiculo()
		cliente()
		mecanico()
		tipoTrabajo()
		estado()
	//	fecha blank:false
		numOrden unique:true
		descripcionProblema(blank:false)
		descripcionTrabajoRealizar(blank:false)
	}

	static mapping = {
		//detallesList cascade:"all,delete-orphan"
	}

	
}
